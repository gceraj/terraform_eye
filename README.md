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
"C:\Program Files (x86)\Mobatek\MobaXterm\MobaXterm.exe"  -newtab "ssh -i /mnt/C/Documents/MLOps/key_pair/KP_Kubernetes_A_v1.pem ubuntu@34.239.146.130"

http://52.72.113.196:30007/predict


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
