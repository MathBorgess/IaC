resource "aws_ebs_volume" "main-volume" {
  size              = 29
  type              = "gp2"
  availability_zone = aws_instance.nvl-main-server.availability_zone
  encrypted         = false
  iops              = 0
  snapshot_id       = "snap-015e0c9bfb72bf22e"
}

resource "aws_ebs_volume" "staging-volume" {
  size              = 29
  type              = "gp2"
  availability_zone = aws_instance.nvl-staging-server.availability_zone
  encrypted         = false
  iops              = 0
  snapshot_id       = "snap-0e110edaae4b0636b"
}

resource "aws_volume_attachment" "main-attachment" {
  device_name = "/dev/sda1"
  volume_id   = aws_ebs_volume.main-volume.id
  instance_id = aws_instance.nvl-main-server.id
}

resource "aws_volume_attachment" "staging-attachment" {
  device_name = "/dev/sda1"
  volume_id   = aws_ebs_volume.staging-volume.id
  instance_id = aws_instance.nvl-staging-server.id
}

# resource "aws_ebs_snapshot" "production-snapshot" {
#   volume_id = aws_ebs_volume.main-volume.id
# }
