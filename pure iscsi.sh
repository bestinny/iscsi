yum install -y iscsi-initiator-utils

iscsiadm -m discovery -t st -p 10.0.0.11
iscsiadm -m node -l -T iqn.2010-06.com.purestorage:flasharray.73e3ebb2aa0c32de -p 10.0.0.11
iscsiadm -m node -l -T iqn.2010-06.com.purestorage:flasharray.73e3ebb2aa0c32de -p 10.0.0.12



#multipath alias 설정
CONFIG_CONTENT=$(cat << EOF

multipaths {
    multipath {
        wwid    3600a0980774f6a34663f58354f2f5355
        alias   mpath0
    }
}
EOF
)

# /etc/multipath.conf 파일에 설정 추가
echo "Adding multipath configuration to /etc/multipath.conf..."
echo "$CONFIG_CONTENT" | sudo tee -a /etc/multipath.conf > /dev/null

echo "Configuration added successfully."

