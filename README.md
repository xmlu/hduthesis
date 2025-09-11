
# 杭州电子科技大学研究生论文 LaTeX 模版

格式要求见《杭州电子科技大学研究生学位论文格式统一要求》（杭电研 [2012] 311 号）

推荐的编译命令为`latexmk -xelatex -synctex=1 main.tex`。
`latexmk`命令的运行需要系统安装有 Perl 解释器。
可以使用命令`latexmk -C`来删除编译产生的文件，可以使用命令`latexmk -c`来删除编译产生的临时文件。

如果系统提示找不到`.bst`文件的话，需要安装[`gbt7714`宏包](https://github.com/zepinglee/gbt7714-bibtex-style)。
Linux 或 macOS 操作系统上的 TeX Live / MacTeX 的话，在终端输入
``` bash
sudo tlmgr install gbt7714
```
Window 操作系统上的 TeX Live，在 CMD 中输入
```
tlmgr install gbt7714
```

字数统计可以使用如下命令:
```
texcount -total data/*.tex
```

### 项目结构

- `README.md`: 本文件，提供项目的基本说明。
- `hduthesis.cls`: 论文模版的类文件，定义了整体格式和样式。
- `main.tex`: 论文的主 LaTeX 文件，通常包含引入其他章节和整体框架。
- `HDUEMBLEM.pdf`: 校徽，用于论文封面。
- `HDULOGO.pdf`: 校名，用于论文封面。
- `LICENSE`: 项目遵循的开源许可证（MIT 许可证）。

### 使用说明

1. **安装LaTeX环境**  
   确保你的系统已经安装了 LaTeX 发行版（推荐 TeX Live 和 MacTeX）以及一个合适的编辑器（如 VS Code 配合 LaTeX Workshop 插件）。

2. **下载模版**  
   [下载zip包](https://gitee.com/xmlu/hduthesis/repository/archive/master.zip)或使用 Git 克隆本仓库。
   如果你使用 Git，可以运行以下命令：
   ```
   git clone https://gitee.com/xmlu/hduthesis.git
   ```

3. **编译论文**  
   使用`makefile`来编译主文件（需要安装`make`工具）：
   ```
   make
   ```
   或者使用 VS Code 的`Recipe: latexmk (xelatex)`选项。
   
   这会生成`main.pdf`，即你的最终论文文件。

   

4. **自定义内容**  
   在`data/abstract.tex`、`data/acknowledgements.tex`、`data/appendix.tex`和`data/chap01.tex`等文件中撰写内容，以完成你的论文。


### 常见问题

- **参考文献作者姓名大小写问题**：根据《杭州电子科技大学研究生学位论文格式统一要求》（杭电研 [2012] 311 号），参考文献著录应遵循 GB/T 7714-2005《文后参考文献著录规则》。在该标准中，对作者姓名的大小写未作明确规定，可采用首字母大写或全部大写。依据现行标准 GB/T 7714-2015，作者姓名应全部大写。本模板默认采用作者姓名全部大写的格式。如需将作者姓名修改为首字母大写，可在模板中自行调整。（最后更新：2025 年 9 月 11 日）

## 参考资料

- CTeX
- 清华大学学位论文模版 thuthesis
- 南京大学学位论文模版 NJUthesis
- 中国科学技术大学学位论文模版 ustcthesis
- 杭州电子科技大学之前的硕士学位论文模版
- 陈浩元（标准起草人）：[GB/T 7714 新标准对旧标准的主要修改及实施要点提示](http://bjxb.cessp.org.cn/ch/reader/view_abstract.aspx?file_no=20150411&flag=1)