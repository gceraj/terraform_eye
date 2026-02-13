# terraform_bus
cd C:\Proof_Of_Concept\docker_aws_falcon_duck\env_prod
terraform fmt -recursive ../
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
terraform apply -auto-approve -target=module.get_join_command
terraform apply -auto-approve -target=module.roles

terraform destroy -auto-approve -target=module.github_runner
terraform apply -auto-approve -target=module.github_runner

terraform destroy -auto-approve
terraform destroy -auto-approve -target=module.get_join_command
terraform destroy -auto-approve -target=module.get_join_command
terraform plan -var-file=terraform.tfvars
terraform force-unlock 5691003e-56a2-5e3d-6a6f-150fafeb4235
terraform force-unlock 1e222bdc-27dd-3d3c-7856-a3948d8e07cc
terraform force-unlock 9a6ac66e-9a16-a158-0dc7-fdb933b3d4eb
terraform state list
terraform refresh module.eip.aws_eip.eip_bull
terraform refresh -target=module.eip.aws_eip.eip_bull
terraform workspace new aws_ec2_poc


https://resource-explorer.console.aws.amazon.com/resource-explorer/home


"C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe"  -newtab "ssh -i /mnt/C/Documents/MLOps/key_pair/KP_Kubernetes_A_v1.pem ubuntu@52.72.113.196"
"C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe"  -newtab "ssh -i /mnt/C/Documents/MLOps/key_pair/KP_Kubernetes_A_v1.pem ubuntu@100.52.214.32"

Test-NetConnection -ComputerName 52.72.113.196 -Port 30007

curl localhost:30007
curl localhost:30080

curl localhost:8000
curl localhost:8501

---------------------------------------------------------------------

Test-NetConnection -ComputerName 100.52.214.32 -Port 8501

Test-NetConnection -ComputerName 52.72.113.196 -Port 22
Test-NetConnection -ComputerName 52.72.113.196 -Port 80



http://52.72.113.196:30007
http://52.72.113.196:30080

nc -zv 52.72.113.196 30007

http://52.72.113.196:30007/predict

telnet 52.72.113.196 30007
http://52.72.113.196:30007/predict
100.52.214.32

curl http://52.72.113.196:30007


kubeadm token create --print-join-command
kubeadm token list
sudo kubeadm reset
kubectl get nodes
kubectl get pods -o wide

kubectl logs gceraj-api-deploy-9bb999fcf-jrt5h

kubectl rollout restart deployment gceraj-api-deploy
kubectl rollout restart deployment gceraj-ui-deploy



sudo kubeadm join 10.0.1.8:6443 --token wyrhkj.1bs38t9hdyheslf4 --discovery-token-ca-cert-hash sha256:13e80d5b3fdd9f46b625331c96f17d763377f70e2a1c60fcd18a19c4076514b4
sudo kubeadm join 10.0.1.8:6443 \
  --token wyrhkj.1bs38t9hdyheslf4 \
  --discovery-token-ca-cert-hash sha256:13e80d5b3fdd9f46b625331c96f17d763377f70e2a1c60fcd18a19c4076514b4

sudo base64 -w 0 ~/.kube/config 

./config.sh --url https://github.com/gceraj/mlops_e2e_duck --token "AWOBUTBVW3CX4H5CO67QZSDJRP62A" --name "self-hosted" --work "_work" --labels "ec2,terraform" --runnergroup "Default" --unattended  --replace
./run.sh

git init
git remote add origin git@github.com:gceraj/terraform_eye.git
git add .
git commit -m "21 working verion"
git switch -c main
git push origin main --force


ubuntu@ip-10-0-1-13:~$ kubectl get svc --all-namespaces
NAMESPACE     NAME             TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default       gceraj-api-svc   NodePort    10.98.168.17    <none>        8000:30080/TCP           23h
default       gceraj-ui-svc    NodePort    10.108.71.103   <none>        8501:30007/TCP           23h
default       kubernetes       ClusterIP   10.96.0.1       <none>        443/TCP                  23h
kube-system   kube-dns         ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   23h
ubuntu@ip-10-0-1-13:~$





ubuntu@ip-10-0-1-13:~$ ss -tulnp
Netid          State           Recv-Q          Send-Q                     Local Address:Port                      Peer Address:Port          Process
udp            UNCONN          0               0                             127.0.0.54:53                             0.0.0.0:*
udp            UNCONN          0               0                          127.0.0.53%lo:53                             0.0.0.0:*
udp            UNCONN          0               0                         10.0.1.13%ens5:68                             0.0.0.0:*
udp            UNCONN          0               0                                0.0.0.0:8472                           0.0.0.0:*
udp            UNCONN          0               0                              127.0.0.1:323                            0.0.0.0:*
udp            UNCONN          0               0                                  [::1]:323                               [::]:*
tcp            LISTEN          0               4096                             0.0.0.0:22                             0.0.0.0:*
tcp            LISTEN          0               4096                       127.0.0.53%lo:53                             0.0.0.0:*
tcp            LISTEN          0               128                            127.0.0.1:6010                           0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:39787                          0.0.0.0:*
tcp            LISTEN          0               4096                          127.0.0.54:53                             0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10257                          0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10259                          0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10249                          0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10248                          0.0.0.0:*
tcp            LISTEN          0               4096                           10.0.1.13:2380                           0.0.0.0:*
tcp            LISTEN          0               4096                           10.0.1.13:2379                           0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:2379                           0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:2381                           0.0.0.0:*
tcp            LISTEN          0               4096                                   *:10250                                *:*
tcp            LISTEN          0               4096                                [::]:22                                [::]:*
tcp            LISTEN          0               4096                                   *:10256                                *:*
tcp            LISTEN          0               4096                                   *:6443                                 *:*
tcp            LISTEN          0               128                                [::1]:6010                              [::]:*
ubuntu@ip-10-0-1-13:~$



</html>
ubuntu@ip-10-0-1-13:~$ ss -tulnp
Netid          State           Recv-Q          Send-Q                     Local Address:Port                      Peer Address:Port          Process
udp            UNCONN          0               0                             127.0.0.54:53                             0.0.0.0:*
udp            UNCONN          0               0                          127.0.0.53%lo:53                             0.0.0.0:*
udp            UNCONN          0               0                         10.0.1.13%ens5:68                             0.0.0.0:*
udp            UNCONN          0               0                                0.0.0.0:8472                           0.0.0.0:*
udp            UNCONN          0               0                              127.0.0.1:323                            0.0.0.0:*
udp            UNCONN          0               0                                  [::1]:323                               [::]:*
tcp            LISTEN          0               4096                             0.0.0.0:22                             0.0.0.0:*
tcp            LISTEN          0               4096                       127.0.0.53%lo:53                             0.0.0.0:*
tcp            LISTEN          0               128                            127.0.0.1:6010                           0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:39787                          0.0.0.0:*
tcp            LISTEN          0               4096                          127.0.0.54:53                             0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10257                          0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10259                          0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10249                          0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:10248                          0.0.0.0:*
tcp            LISTEN          0               4096                           10.0.1.13:2380                           0.0.0.0:*
tcp            LISTEN          0               4096                           10.0.1.13:2379                           0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:2379                           0.0.0.0:*
tcp            LISTEN          0               4096                           127.0.0.1:2381                           0.0.0.0:*
tcp            LISTEN          0               4096                                   *:10250                                *:*
tcp            LISTEN          0               4096                                [::]:22                                [::]:*
tcp            LISTEN          0               4096                                   *:10256                                *:*
tcp            LISTEN          0               4096                                   *:6443                                 *:*
tcp            LISTEN          0               128                                [::1]:6010                              [::]:*
ubuntu@ip-10-0-1-13:~$
