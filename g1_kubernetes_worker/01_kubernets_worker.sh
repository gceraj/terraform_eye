#!/bin/bash

sudo apt-get update -y  >>/dev/null
sudo apt-get upgrade -y  >>/dev/null

sudo apt-get update -y  >>/dev/null
sudo apt-get install -y unzip curl  >>/dev/null
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"  >>/dev/null
cd /tmp/
unzip /tmp/awscliv2.zip  >>/dev/null
sudo  /tmp/aws/install   >>/dev/null


# --- Disable swap ---
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab

# --- Kernel modules ---
sudo tee /etc/modules-load.d/k8s.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# --- Sysctl settings ---
sudo tee /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-ip6tables=1
net.ipv4.ip_forward=1
EOF

sudo sysctl --system  >>/dev/null

# --- Install containerd ---
sudo apt-get install -y containerd  >>/dev/null

sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml >/dev/null

# Enable SystemdCgroup
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

sudo systemctl restart containerd  >>/dev/null
sudo systemctl enable containerd   >>/dev/null

# --- Add Kubernetes Repo (v1.31) ---
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key \
  | sudo gpg --dearmor --yes -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update -y >>/dev/null
sudo apt-get install -y kubelet kubeadm kubectl conntrack >>/dev/null
sudo apt-mark hold kubelet kubeadm kubectl  >>/dev/null

echo "=============================================================="
echo " Worker node setup complete."
echo " Run the following join command from your control plane:"
echo
echo "   sudo kubeadm join <CONTROL_PLANE_IP>:6443 \\"
echo "     --token <TOKEN> \\"
echo "     --discovery-token-ca-cert-hash sha256:<HASH>"
echo
echo "=============================================================="
