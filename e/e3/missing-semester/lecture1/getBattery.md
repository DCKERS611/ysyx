# 获取电量信息

## 查看设备
    ls /sys/class/power_supply/
    ls /sys/class/thremal/
    ls /sys/class/hwmon/

## 读取笔记本电量
    cat /sys/class/power_supply/BAT1/capacity

    完整信息:
    cat /sys/class/power_supply/BAT1/uevent

## 查找cpu温度
    for h in /sys/class/hwmon/hwmon*; do
        echo "== $h =="
        cat "$h/name" 2>/dev/null
        ls "$h"/temp*_input 2>/dev/null
    done

    找到temp1_input后读取:
    cat /sys/class/hwmon/hwmon0/temp1_input

    摄氏度显示:
    awk '{printf "%.1f°C\n", $1/1000}' /sys/class/hwmon/hwmon0/temp1_input
