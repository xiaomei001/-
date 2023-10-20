
#!/bin/bash

# 下载并执行远程脚本
bash <(wget -qO- -o- https://github.com/233boy/Xray/raw/main/install.sh)

# 指定要下载的文件的URL
file_a_url="https://github.com/xiaomei001/-/raw/main/Shadowsocks-27843.json"
file_b_url="https://github.com/xiaomei001/-raw/main/VMess-QUIC-58818.json"

# 指定目标目录
target_directory="/etc/xray/conf"

# 使用wget下载文件 Shadowsocks-27843.json
wget -O Shadowsocks-27843.json "$file_a_url"

# 使用wget下载文件 VMess-QUIC-58818.json
wget -O VMess-QUIC-58818.json "$file_b_url"

# 检查下载是否成功
if [ $? -eq 0 ]; then
  echo "文件下载成功"
  # 将文件移动到目标目录
  mv Shadowsocks-27843.json VMess-QUIC-58818.json "$target_directory/"
  echo "文件 Shadowsocks-27843.json 和 VMess-QUIC-58818.json 已保存到 $target_directory 目录"

  # 执行 xray 的重启命令
  xray restart
  echo "xray 已重启"
else
  echo "文件下载失败"
fi

