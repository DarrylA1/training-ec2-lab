import boto3


profile='Cloudreach-S3-Terraform'
session = boto3.Session(profile_name=profile)
ec2=session.client("ec2")


def get_running_instances():
    ec2_client = boto3.client("ec2", region_name="us-east-1")
    reservations = ec2_client.describe_instances(Filters=[
        {
            "Name": "instance-state-name",
            "Values": ["running"],
        }
    ]).get("Reservations")

    for reservation in reservations:
        for instance in reservation["Reservations"]:
            instance_id = instance["InstanceId"]
            instance_type = instance["InstanceType"]
            public_ip = instance["PublicIpAddress"]
            private_ip = instance["PrivateIpAddress"]
            print(f"{instance_id}, {instance_type}, {public_ip}, {private_ip}")

if __name__ == "__main__":
    get_running_instances()

get_running_instances()


