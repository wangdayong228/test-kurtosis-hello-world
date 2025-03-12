file_demo = import_module("file_demo.star")
postgres_demo = import_module("postgres_demo.star")
port_map = import_module("port_map.star")
# 只有在 main.star 中才能访问本地文件，直接 kurtosis run ... xxx.star 时，不能访问本地文件
# 所以测试都通过 main.star 运行
# 自行注释掉不需要运行的 demo 即可

def run(plan, args):
    # 运行 file_demo.star 中的 run 函数
    file_demo.run(plan, args)

    # # 运行 postgres_demo
    # postgres_demo.run(plan, args)

    # 容器端口映射到公共端口
    port_map.run(plan, args)