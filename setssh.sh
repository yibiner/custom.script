#!/usr/bin/bash

# 从boot中恢复ssh文件

ssh_start()                                                                                        
{                                                                                                  
  # no-op if already running                                                                       
  if [ -f /var/run/sshd.pid ]; then                                                                
    #echo "SSH already running"                                                                    
    #sleep 1                                                                                       
    return                                                                                         
  fi                                                                                               
                                                                                                   
  echo "Starting SSH..."                                                                           
  sleep 1                                                                                          
                                                                                                   
  /usr/sbin/sshd                                                                                   
                                                                                                   
  echo "... OK"                                                                                    
  sleep 1                                                                                          
}                                                                                                  
                                                                                                   
ssh_stop()                                                                                         
{                                                                                                  
  # no-op if already running                                                                       
  if [ ! -f /var/run/sshd.pid ]; then                                                              
    #echo "SSH already stopped"                                                                    
    #sleep 1                                                                                       
    return                                                                                         
  fi                                                                                               
                                                                                                   
  echo "Stopping SSH..."                                                                           
  sleep 1                                                                                          
                                                                                                   
  killall sshd                                                                                     
                                                                                                   
  echo "... OK"                                                                                    
  sleep 1                                                                                          
}                                                                                                  
                                                                                                   
ssh_restart() {                                                                                    
  if [ -r /var/run/sshd.pid ]; then                                                                
    echo "Restarting parent listener process only. To kill every sshd process, you must use stop"  
    sleep 3                                                                                        
    kill `cat /var/run/sshd.pid`                                                                   
  else                                                                                             
    echo "Warning: there does not appear to be a parent instance of sshd running."                 
    sleep 3                                                                                        
    exit 1                                                                                         
  fi                                                                                               
  sleep 1                                                                                          
  ssh_start                                                                                        
}


if [ -d "/root/.ssh" ]; then
  cp $BASE_PATH/.ssh/* /root/.ssh/
fi

if [ ! -d "/root/.ssh" ]; then
  cp -r $BASE_PATH/.ssh /root
fi
chmod 644 /root/.ssh/id_rsa.pub
chmod 644 /root/.ssh/authorized_keys

cp $BASE_PATH/sshd_config /etc/ssh/sshd_config
ssh_restart

fn_log " end..."
