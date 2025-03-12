POSTGRES_PORT_ID = "postgres"
POSTGRES_DB = "app_db"
POSTGRES_USER = "app_user"
POSTGRES_PASSWORD = "password"

# 映射到指定的公共端口
def run(plan, args):
    # 添加一个 Postgres 服务器
    postgres = plan.add_service(
        name = "postgres",
        config = ServiceConfig(
            image = "postgres:15.2-alpine",
            ports = {
                POSTGRES_PORT_ID: PortSpec(5432, application_protocol = "postgresql"),
            },
            public_ports = {
                POSTGRES_PORT_ID: PortSpec(
                    # 我们想要暴露的端口号
                    # 必填
                    number = 25432,

                    # 端口的传输协议（可以是 "TCP" 或 "UDP"）
                    # 可选（默认值："TCP"）
                    transport_protocol = "TCP",

                    # 端口的应用协议
                    # 可选
                    application_protocol = "postgresql"
                )
            },
            env_vars = {
                "POSTGRES_DB": POSTGRES_DB,
                "POSTGRES_USER": POSTGRES_USER,
                "POSTGRES_PASSWORD": POSTGRES_PASSWORD,
            },
        ),
    )
