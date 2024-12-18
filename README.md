这是一个nginx代理局域网任意IP的配置

假设你要将代理流量转向 http://192.168.1.100

那么请输入：http://nginxip?lanset=192.168.1.100

之后所有的流量都会转到192.168.1.100，

如果你要代理到其它地址也是一样

主要是有时公网隧道只有一条的情况,我们又希望将流量转向不同的内网IP地址，比如有多个服务情况下，如果一对一的映射，那么需要多个公网映射，此项目通过单个公网映射，通过lanset参数来动态设置要转向的目标IP


This is a configuration of nginx proxy LAN for any IP

Suppose you want to proxy http://192.168.1.100

Then please enter: http://nginxip?lanset=192.168.1.100

All traffic will then be directed to 192.168.1.100.

The same is true if you want to proxy to other addresses

Mainly because there is only one public network

docker-compose example
```
networks:
  lan13:
    name: lan13
    driver: macvlan
    driver_opts:
      parent: eth1
    ipam:
      config:
        - subnet: "192.168.13.0/24"
          gateway: "192.168.13.1"
services:
  nginx-lanproxy:
    container_name: nginx-lanproxy
    image: sleechengn/nginx:lanproxy
    restart: always
    hostname: "nginx-lanproxy"
    networks:
      lan13:
        ipv4_address: 192.168.13.65
```
