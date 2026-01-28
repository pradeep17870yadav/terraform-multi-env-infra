#!/bin/bash
set -e

exec > >(tee /var/log/user-data.log)
exec 2>&1

echo "===== Starting Nginx Installation ====="
echo "Timestamp: $(date)"

echo "Updating system packages..."
apt-get update
apt-get upgrade -y

echo "Installing Nginx..."
apt-get install -y nginx

echo "Starting Nginx service..."
systemctl start nginx
systemctl enable nginx

echo "Creating custom Nginx welcome page..."
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Nginx</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        .container {
            text-align: center;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
        h1 {
            color: #333;
            margin: 0;
        }
        p {
            color: #666;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Nginx is Running!</h1>
        <p>Your web server is successfully deployed and running.</p>
        <p>This instance was created using Terraform and provisioned with Nginx.</p>
    </div>
</body>
</html>
EOF

echo "Nginx installation completed successfully!"
echo "Nginx is running on port 80"
