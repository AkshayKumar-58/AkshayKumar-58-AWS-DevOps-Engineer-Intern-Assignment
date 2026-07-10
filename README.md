# AWS EC2 Nginx Deployment

# Objective

Deployed a simple web server using an AWS EC2 Ubuntu instance and host a basic web page with Nginx.

# Prerequisites

* AWS Account
* EC2 Key Pair (.pem)
* Security Group allowing:

  * SSH (22)
  * HTTP (80)

# Step 1: Launched an EC2 Instance

1. Sign in to the AWS Management Console.
2. Open **EC2**.
3. Click **Launch Instance**.
4. Configure the instance:

   * **Name:** Ubuntu-WebServer
   * **AMI:** Ubuntu Server 26.04 LTS
   * **Instance Type:** t3.small (or t3.micro if available)
   * **Key Pair:** Created a new key pair.
5. Configure the Security Group:

   * SSH (TCP 22) → My IP
   * HTTP (TCP 80) → Anywhere (0.0.0.0/0)
6. Launch the instance.


# Step 2: Connect to the EC2 Instance

Change the permissions of the key file:

```bash
chmod 400 ec2_key.pem
```

Connect using SSH:

```bash
ssh -i ec2_key.pem ubuntu@3.230.149.94
```

# Step 3: Update the Server

```bash
sudo apt update
sudo apt upgrade -y
```

# Step 4: Install Nginx

```bash
sudo apt install nginx -y
```

Check the installation:

```bash
nginx -v
```

# Step 5: Start and Enable Nginx

Start the service:

```bash
sudo systemctl start nginx
```

Enable it at boot:

```bash
sudo systemctl enable nginx
```

Verify its status:

```bash
sudo systemctl status nginx


# Step 6: Create a Simple Web Page

Navigate to the web root:

```bash
cd /var/www/html
```

Create an HTML page:

index.html that is present in the GitHub repo.

Alternatively, edit the page manually:

```bash
sudo vi /var/www/html/index.html
```

# Step 7: Verify the Website

Open a browser and visit:

http://3.230.149.94

You should see the Student Information custom HTML page.


# Useful Nginx Commands

Check status:

```bash
sudo systemctl status nginx
```

Start:

```bash
sudo systemctl start nginx
```

Stop:

```bash
sudo systemctl stop nginx
```

Restart:

```bash
sudo systemctl restart nginx
```

Reload configuration:

```bash
sudo systemctl reload nginx
```

Enable on boot:

```bash
sudo systemctl enable nginx
```

Disable on boot:

```bash
sudo systemctl disable nginx
```

Test configuration:

```bash
sudo nginx -t
```

View version:

```bash
nginx -v
```

---

# Verify HTTP Access

Checked the web server is responding:

```bash
curl http://localhost
```

or

```bash
curl http://3.230.149.94
```

# Security Group Configuration

| Protocol | Port | Source    | Purpose        |
| -------- | ---- | --------- | -------------- |
| SSH      | 22   | My IP     | Remote login   |
| HTTP     | 80   | 0.0.0.0/0 | Website access |


# Outcome

* Ubuntu 26.04 EC2 instance launched.
* Connected via SSH.
* System packages updated.
* Nginx installed and configured.
* Nginx service started and enabled.
* Sample web page deployed.
* Website successfully accessible through the EC2 public IP.

