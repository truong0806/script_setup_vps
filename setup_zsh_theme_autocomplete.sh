#!/bin/bash

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

echo "Cài đặt Zsh, Oh My Zsh, theme robbyrussell và plugin zsh-autosuggestions đã hoàn tất!"
echo "Đang chuyển sang sử dụng Zsh làm shell mặc định..."

# Đăng xuất để thay đổi shell mặc định có hiệu lực
echo "Vui lòng đăng xuất và đăng nhập lại để áp dụng các thay đổi."
