module "instance" {
    source = "./instance-module"

    #ovveride the default values
    instance_name_md = var.instance_name
    instance_type_md = var.instance_type
    instance_key_md = aws_key_pair.key.key_name

}