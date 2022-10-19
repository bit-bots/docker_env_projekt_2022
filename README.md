# ROS Development Environment

## Run

To start and connect to a session run

```bash
./connect.sh
```

## Access control

To run gui applications disable xserver access control.

```bash
xhost +
```

Don't forget to enable it again later on!

```bash
xhost -
```


# FAQ

Ich kann kein apt trotz root benutzten. Führe das aus:

```
apt-config dump | grep Sandbox::User
cat <<EOF > /etc/apt/apt.conf.d/sandbox-disable
APT::Sandbox::User "root";
EOF
```
