def run(plan, args):
    # 读取文件
    # Note: 使用 read_file 通过本地路径读取文件只在 main.star 中有效
    file_content = read_file("./README.md")
    plan.print('file content:' + file_content)
    # 通过 github url 上传文件工件
    artifact_by_url = plan.upload_files(
        # 要上传到文件工件中的文件
        # 必须是任何不带 '/blob/main' 部分的 GitHub URL。
        # 必填
        src = "github.com/kurtosis-tech/basic-service-package/README.md",

        # 将生成的文件工件的名称。
        # 如果未指定，将自动生成。
        # 可选
        name = "artifact-by-rul",

        # 为包的最终用户提供的人性化描述
        # 可选（默认：将文件 'PATH' 上传到文件工件 'ARTIFACT_NAME'）
        description = "uploading file from github url"
    )
    plan.print('crtated artifact by url:' + artifact_by_url)

    # 通过本地路径上传文件工件
    artifact_by_local = plan.upload_files(
        # 要上传到文件工件中的文件
        # 必须是任何不带 '/blob/main' 部分的 GitHub URL。
        # 必填
        src = "/README.md",

        # 将生成的文件工件的名称。
        # 如果未指定，将自动生成。
        # 可选
        name = "artifact-by-local",

        # 为包的最终用户提供的人性化描述
        # 可选（默认：将文件 'PATH' 上传到文件工件 'ARTIFACT_NAME'）
        description = "uploading file from local path"
    )
    plan.print('crtated artifact by local:' + artifact_by_local)

    # 获取文件工件
    artifact = plan.get_files_artifact(
        name = "artifact-by-rul",
        description = "use plan.get_files_artifact to get artifact-by-rul"
    )

    plan.print('artifact:' + artifact)
    
    # 用模板渲染一个 file artifact
    template_data = {
        "Name" : "Stranger",
        "Answer": 6,
        "Numbers": [1, 2, 3],
        "UnixTimeStamp": 1257894000,
        "LargeFloat": 1231231243.43,
        "Alive": True,
    }

    artifact_name = plan.render_templates(
        # 一个字典，其中：
        #  - 每个键是将在输出文件工件中生成的文件路径
        #  - 每个值是生成文件路径所需的模板和数据
        # 可以指定多个文件路径以生成包含多个文件的文件工件。
        # 必填
        config = {
            "/foo/bar/output.txt": struct(
                # 要渲染的模板，应采用 Go 模板格式：
                #   https://pkg.go.dev/text/template#pkg-overview
                # 必填
                template="Hello {{.Name}}. The sum of {{.Numbers}} is {{.Answer}}. My favorite moment in history {{.UnixTimeStamp}}. My favorite number {{.LargeFloat}}. Am I Alive? {{.Alive}}",

                # 要插入模板的数据，可以是结构体或字典
                # 键应与模板中的键完全匹配。
                # 必填
                data=template_data,
            ),
        },

        # 将生成的文件工件的名称。
        # 如果未指定，将自动生成。
        # 可选
        name = "my-artifact",

        # 为包的最终用户提供的人性化描述
        # 可选（默认：将模板渲染为名称为 'ARTIFACT_NAME' 的文件工件）
        description = "rendering a template"  
    )
    plan.print('creted artifact by render templates:' + artifact_name)


    