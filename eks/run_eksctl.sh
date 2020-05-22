eksctl create cluster \
--name test-cluster \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--region us-west-2
# eksctl delete cluster --region=us-west-2 --name=test-cluster

# or run:
# eksctl cluster create -f config.yaml
# eksctl cluster delete -f config.yaml