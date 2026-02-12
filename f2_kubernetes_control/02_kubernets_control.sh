
sudo apt-get update -y  >>/dev/null
sudo apt-get upgrade -y  >>/dev/null

sudo apt-get update -y  >>/dev/null
sudo apt-get install -y unzip curl  >>/dev/null
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"  >>/dev/null
cd /tmp/
unzip /tmp/awscliv2.zip  >>/dev/null
sudo  /tmp/aws/install   >>/dev/null
rm -f /tmp/awscliv2.zip  >>/dev/null

sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab

sudo tee /etc/modules-load.d/k8s.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.ipv4.ip_forward=1
EOF

sudo sysctl --system  >>/dev/null

# --- Install containerd ---
sudo apt-get install -y containerd  >>/dev/null

sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# Enable SystemdCgroup
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

sudo systemctl restart containerd  >>/dev/null
sudo systemctl enable containerd   >>/dev/null

# --- Add Kubernetes Repo (NEW OFFICIAL REPO) ---
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key \
  | sudo gpg --dearmor --yes -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update -y >>/dev/null
sudo apt-get install -y kubelet kubeadm kubectl  >>/dev/null
sudo apt install -y conntrack >>/dev/null
sudo apt-mark hold kubelet kubeadm kubectl  >>/dev/null
sudo kubeadm init --pod-network-cidr=10.244.0.0/16  >>/dev/null

mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# --- Install Flannel CNI ---
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
