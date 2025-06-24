

杭州电子科技大学研究生论文LaTeX模版
---

这是一个为杭州电子科技大学研究生撰写论文而设计的LaTeX模版，帮助用户遵循学校关于论文格式的相关规定。该模版包含了论文的基本结构以及一些常用的配置，方便用户快速开始撰写。

### 项目结构

- `README.md`: 本文件，提供项目的基本说明。
- `data/abstract.tex`: 摘要部分的LaTeX代码。
- `data/acknowledgements.tex`: 致谢部分的LaTeX代码。
- `data/appendix.tex`: 附录部分的LaTeX代码。
- `data/chap01.tex`: 第一章内容的LaTeX代码。
- `hduthesis.cls`: 论文模版的类文件，定义了整体格式和样式。
- `main.tex`: 论文的主LaTeX文件，通常包含引入其他章节和整体框架。
- `makefile`: 构建脚本，用于自动化编译LaTeX文件。
- `HDUEMBLEM.pdf`: 校徽PDF文件，用于论文封面。
- `HDULOGO.pdf`: 校名PDF文件，用于论文封面。
- `LICENSE`: 项目遵循的开源许可证。

### 使用说明

1. **安装LaTeX环境**  
   确保你的系统已经安装了LaTeX发行版（如TeX Live或MiKTeX）以及一个合适的编辑器（如VS Code的LaTeX插件）。

2. **下载模版**  
   [下载zip包](https://gitee.com/xmlu/hduthesis/repository/archive/master.zip)或使用Git克隆本仓库。
   如果你使用Git，可以运行以下命令：
   ```
   git clone https://gitee.com/xmlu/hduthesis.git
   ```

3. **编译论文**  
   使用`makefile`来编译主文件：
   ```
   make
   ```
   或者直接运行：
   ```
   xelatex main.tex
   bibtex main
   xelatex main.tex
   xelatex main.tex
   ```
   这会生成`main.pdf`，即你的最终论文文件。

4. **自定义内容**  
   修改`data/abstract.tex`、`data/acknowledgements.tex`、`data/appendix.tex`和`data/chap01.tex`中的内容，以满足你的论文需要。同时，确保`hduthesis.cls`中的格式符合学校最新要求。

### 贡献指南

欢迎为本项目提供改进，例如优化格式定义、添加示例内容或修复错误。你可以通过以下步骤提交贡献：

1. Fork本仓库。
2. 创建新分支：`git checkout -b feature/your-feature-name`.
3. 提交更改：`git commit -m "Add new feature"`.
4. Push到远程分支：`git push origin feature/your-feature-name`.
5. 提交Pull Request。

### 许可证

本项目遵循 MIT 许可证。有关更多详细信息，请参阅[MIT License](LICENSE)。

### 参考资料

请查阅杭州电子科技大学研究生院发布的论文撰写规范，以及LaTeX官方文档以更好地理解和使用本模版。