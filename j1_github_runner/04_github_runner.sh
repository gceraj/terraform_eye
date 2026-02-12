
cd ~
mkdir -p actions-runner 
cd actions-runner
curl -o actions-runner-linux-x64-2.331.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.331.0.tar.gz

./config.sh --url https://github.com/gceraj/mlops_e2e_duck --token ${code} --name "self-hosted" --work "_work" --labels "ec2,terraform" --runnergroup "Default" --unattended  --replace
./run.sh
