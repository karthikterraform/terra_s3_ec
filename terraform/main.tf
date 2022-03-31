resource "aws_instance" "DevopsRoles-WebSer3" {
 ami = "ami-04505e74c0741db8d"
 instance_type = "t2.micro"
 vpc_security_group_ids = ["${aws_security_group.webserver_security_group.id}"]
  tags = {
	 Name = "DevopsRoles-Webserver1"
 }
 key_name = "terraform"
 user_data = <<EOF
 #cloud-config
# update apt on boot
package_update: true
# install nginx
packages:
- nginx
write_files:
- content: |
    <!DOCTYPE html>
    <html>
    <head>
      <title>StackPath - Amazon Web Services Instance</title>
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
      <style>
        html, body {
          background: #000;
          height: 100%;
          width: 100%;
          padding: 0;
          margin: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          flex-flow: column;
        }
        img { width: 250px; }
        svg { padding: 0 40px; }
        p {
          color: #fff;
          font-family: 'Courier New', Courier, monospace;
          text-align: center;
          padding: 10px 30px;
        }
      </style>
    </head>
    <body>
      <img src="https://karthik-pic2.s3.ap-south-1.amazonaws.com/picturefolder/Apartments_Slomo.mp4">
      <p>This request was proxied from <strong>Amazon Web Services</strong></p>
    </body>
    </html>
  path: /usr/share/app/index.html
  permissions: '0644'
runcmd:
- cp /usr/share/app/index.html /var/www/html/index.html           
EOF
}
