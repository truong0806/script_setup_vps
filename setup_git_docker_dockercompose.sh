#!/bin/bash

# Định nghĩa màu sắc
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # Không màu

# Cập nhật và nâng cấp hệ thống
sudo apt-get update -y
sudo apt-get upgrade -y

# Cài đặt Zsh
sudo apt-get install zsh -y

# Kiểm tra phiên bản Zsh
zsh --version

# Tự động thay đổi shell mặc định sang Zsh (tránh prompt người dùng)
chsh -s $(which zsh) $(whoami)

# Cài đặt Oh My Zsh thông qua script chính thức
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cài đặt plugin zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Cấu hình theme robbyrussell và thêm plugin zsh-autosuggestions vào .zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc

# Áp dụng các thay đổi bằng cách tải lại .zshrc
source ~/.zshrc

# Xác nhận shell mặc định đã được thay đổi thành Zsh
current_shell=$(echo $SHELL)
if [[ $current_shell == *"zsh"* ]]; then
    echo -e "${GREEN}Zsh đã được đặt làm shell mặc định thành công!${NC}"
else
    echo -e "${RED}Lỗi: Zsh không phải là shell mặc định. Shell hiện tại: $current_shell${NC}"
fi

echo -e "${BLUE}Cài đặt Zsh, Oh My Zsh, theme robbyrussell và plugin zsh-autosuggestions đã hoàn tất!${NC}"
echo -e "${YELLOW}Đang chuyển sang sử dụng Zsh làm shell mặc định...${NC}"
echo -e "${YELLOW}Vui lòng đăng xuất và đăng nhập lại để áp dụng các thay đổi.${NC}"

# Cài đặt Docker
echo -e "${BLUE}Cài đặt Docker...${NC}"
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list'
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Kiểm tra Docker
docker --version

# Cài đặt Docker Compose
echo -e "${BLUE}Cài đặt Docker Compose...${NC}"
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Kiểm tra Docker Compose
docker-compose --version

echo -e "${GREEN}Cài đặt Docker và Docker Compose đã hoàn tất!${NC}"

# Cài đặt Node.js và npm mới nhất
echo -e "${BLUE}Cài đặt Node.js và npm...${NC}"
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs

# Kiểm tra Node.js và npm
node -v
npm -v

echo -e "${GREEN}Cài đặt Node.js và npm đã hoàn tất!${NC}"
