unraid 开机恢复配置

1. 将项目clone到 `/boot/config`下，在 `/boot/config/go` 文件中最后添加 

   ```shell
   cp -r /boot/config/custom.scripts /tmp
   bash /tmp/custom.scripts/startall.sh
   ```

2. 文件说明，脚本里面一般都有必要的注释说明

- config.sh 配置文件。
- commfunc.sh 公共函数文件。一些日志输出函数。
- startall.sh 运行所有设置配置脚本的入口。会运行所有 set 开头的脚本文件，会 nohup 运行 loop 开头的脚本文件，这样后续添加设置文件更加清晰。
- updateconfig.sh 将一些配置保存到U盘中
- setddns.sh 定时检查外网ip
- setohmyzsh.sh 恢复oh-my-zsh
- setssh.sh 恢复ssh 的配置，禁用密码登录、重启sshd 等
- setplugins.sh autofan设置风扇根据CPU温度调节
- setroute.sh 设置路由
- loopping4ups.sh 用来检查网络是否通畅，ping 局域网下的主路由， 如果主路由长时间失联则关机

