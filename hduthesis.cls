% 杭州电子科技大学研究生论文LaTeX模版
% 最新版的模版可以在此获得： https://gitee.com/xmlu/hduthesis

% MIT License
%
% Copyright (c) 2019 Star Brilliant
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.


% 格式要求见《杭州电子科技大学研究生学位论文格式统一要求》（杭电研[2012]311号）

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hduthesis}[2025/06/19 Hangzhou Dianzi University Thesis Template]
\def\version{1.4}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 正文字号为小四
\LoadClass[a4paper,UTF8,zihao=-4,scheme=chinese]{ctexbook}

% 建议在模板开始处载入全部宏包，不要轻易改变加载顺序。
% \pkg{hyperref} 一般在最后加载。
\RequirePackage{gbt7714}
\RequirePackage{filehook} %provides hooks for input files
\RequirePackage{fancyhdr} % 页眉页脚
\RequirePackage{titletoc}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}% 定理类环境宏包，其中 amsmath 选项用来兼容 AMS LaTeX 的宏包
\RequirePackage{datetime} % 日期格式
\RequirePackage[driver=xetex]{geometry}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\RequirePackage{caption}
\RequirePackage{emptypage}

% 添加参数
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=hdu,
    prefix=hdu@
}
\DeclareBoolOption{legacy}
\DeclareBoolOption{doctor}
\DeclareBoolOption{applied}
\ProcessKeyvalOptions*

\ifhdu@doctor
    \def\hdu@degreeLevel{博}
\else
    \def\hdu@degreeLevel{硕}
\fi

\ifhdu@applied
    \def\hdu@degreeType{专业}
\else
    \def\hdu@degreeType{学术}
\fi


% ==============================================
% 字体设置
% ==============================================

% ctex已经定义了songti, heiti, fangsong, kaishu. 
% ctex定义命令 \zihao {⟨字号⟩}，负号代表小，如\zihao{-4}为小四字号
% 中文单倍行距为1.3倍的字号
% \renewcommand\normalsize{%
%     \@setfontsize\normalsize{12bp}{20bp}%
%     \abovedisplayskip 6bp%
%     \abovedisplayshortskip 6bp%
%     \belowdisplayshortskip 6bp%
%     \belowdisplayskip \abovedisplayskip
% }

% ===========================================
% 纸张和页面
% ===========================================
% 使用 \pkg{geometry} 宏包设置纸张和页面。
% 纸张：A4；
% 页面设置：上、下 2.54 cm，左、右 3.17 cm，
% 5号字高3.70mm 

\geometry{
    paper      = a4paper,
    vmargin    = 2.54cm,
    hmargin    = 3.17cm,
    headheight = 0.5cm,
    headsep    = 0.37cm,
    footskip   = 0.79cm, % 2.54 - 1.75
}

% =======================
% 设置页眉页脚
% 全文除封面、原创性声明、中、英文扉页无页眉外，均采 用页眉“杭州电子科技大学博士(硕士)学位论文”
% 宋体五号 字，居中，距边界 2 厘米;
% =======================
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[C]{\songti \zihao{5} \selectfont 杭州电子科技大学硕士学位论文}%
    \fancyfoot[C,C]{\zihao{5} ~\thepage~}
}

% =======================
% 设置主要信息
% =======================
\SetupKeyvalOptions{
    family=hdu,
    prefix=hdu@,
    setkeys=\kvsetkeys
}

\let\hdu@setup@hook\@empty
\newcommand\hdusetup[1]{%
    \let\hdu@setup@hook\@empty
    \kvsetkeys{hdu}{#1}%
    \hdu@setup@hook
}

\newcommand\hdu@define@key[1]{%
    \kvsetkeys{hdu@key}{#1}%
}

\kv@set@family@handler{hdu@key}{%
    \@namedef{hdu@#1@@name}{#1}%
    \def\hdu@@default{}%
    \def\hdu@@choices{}%
    \kv@define@key{hdu@value}{name}{%
        \@namedef{hdu@#1@@name}{##1}%
    }%
    \@namedef{hdu@#1@@check}{}%
    \@namedef{hdu@#1@@code}{}%
    \kv@define@key{hdu@value}{choices}{%
        \def\hdu@@choices{##1}%
        \@namedef{hdu@#1@@reset}{}%
        \@namedef{hdu@#1@@check}{%
            \@ifundefined{%
                ifhdu@\@nameuse{hdu@#1@@name}@\@nameuse{hdu@\@nameuse{hdu@#1@@name}}%
            }{%
                \hdu@error{Invalid value "#1 = \@nameuse{hdu@\@nameuse{hdu@#1@@name}}"}%
            }%
        \@nameuse{hdu@#1@@reset}%
        \@nameuse{hdu@\@nameuse{hdu@#1@@name}@\@nameuse{hdu@\@nameuse{hdu@#1@@name}}true}%
    }%
}%
  
\kv@define@key{hdu@value}{default}{%
    \def\hdu@@default{##1}%
}%
\kvsetkeys{hdu@value}{#2}%

\@namedef{hdu@\@nameuse{hdu@#1@@name}}{}%
\kv@set@family@handler{hdu@choice}{%
    \ifx\hdu@@default\@empty
        \def\hdu@@default{##1}%
    \fi
    \expandafter\newif\csname ifhdu@\@nameuse{hdu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname hdu@#1@@reset\endcsname{%
        \@nameuse{hdu@\@nameuse{hdu@#1@@name}@##1false}%
    }%
}%
\kvsetkeys@expandafter{hdu@choice}{\hdu@@choices}%
\expandafter\let\csname hdu@\@nameuse{hdu@#1@@name}\endcsname\hdu@@default
\expandafter
    \ifx\csname hdu@\@nameuse{hdu@#1@@name}\endcsname\@empty
    \else\@nameuse{hdu@#1@@check}%
    \fi
    \kv@define@key{hdu}{#1}{%
        \@namedef{hdu@\@nameuse{hdu@#1@@name}}{##1}%
        \@nameuse{hdu@#1@@check}%
        \@nameuse{hdu@#1@@code}%
    }%
}
\newcommand\hdu@option@hook[2]{%
    \expandafter\g@addto@macro\csname hdu@#1@@code\endcsname{#2}%
}
\hdu@define@key{
    title = { % 标题
        default = {标题},
    },
    titleA = { % 封面标题第一行
        default = {标题},
    },
    titleB = { % 封面标题第二行
        default = {},
    },
    title* = { % 英文标题
        default = {Title},
        name    = title@en,
    },
    author = {
        default = {姓名},
    },
    author* = {
        default = {Name of author},
        name    = author@en,
    },
    supervisor = {
        default = {导师姓名},
    },
    supervisor* = {
        default = {Name of supervisor},
        name    = supervisor@en,
    },
    discipline = {
        default = {物理学},
    },
    discipline* = {
        default = {Physics},
        name    = discipline@en,
    },
    date = {
        default = {\the\year{}年\the\month{}月},
    },
    date* = {
        default = {\monthname, \the\year},
        name = date@en,
    },
    keywords,
    keywords* = {
        name = keywords@en,
    },
    % 2025 封面新增选项
    studentID = {
        default = {},
    },
    school = {
        default = {理学院},
    },
    supervisorB = {
        default = {},
    },
    secretLevel = {
        default = {},
    },
    % 专业硕/博士学位论文参数
    degreeCategory = {
        default = {},
    },
    field = {
        default = {}
    },
}

% ============================================================
% 前置部分，包括封面，中、英文扉页，原创性声明和使用授权声明，中、英文摘要，目录
% ============================================================

\renewcommand\maketitle{%
  \cleardoublepage
  \pagestyle{empty}%
  \hdu@cover % 封面
  \hdu@title@page@graduate@zh % 中文扉页
  \hdu@title@page@graduate@en % 英文扉页
  \cleardoublepage 
  \hdu@title@page@originality % 原创性声明和使用授权声明
  \cleardoublepage
}

% ==============================
%  封面
% ==============================
\def\HDU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}
}    %如果想要居中对齐，则在#2\fhill前加入\fhill即可。
\def\HDUunderline{\@ifnextchar[\HDU@underline\underline}

% 旧版封面 (2025 前)
\ifhdu@legacy
    \newcommand\hdu@cover{%
        \thispagestyle{empty}
        \vspace*{0.1cm}

        \begin{center}
            \hfill\includegraphics[width=135mm]{HDULOGO.pdf}\hfill
        \end{center}
        \begin{center}
            {\songti\zihao{2}\bfseries 硕\quad 士\quad 学\quad 位\quad 论\quad 文\par}
        \end{center}

        \vspace{18mm}
        
        \parbox[t][4cm][t]{\textwidth}{ 
            \begin{center}
                \zihao{-2}
                \begin{tabular}{lc}
                    {\songti\bfseries 题~~~~目：} & 
                    \underline{\makebox[250pt]{\kaishu \hdu@titleA }} \\[2mm]
                    & \HDUunderline[250pt]{\kaishu \hdu@titleB}
                \end{tabular}
            \end{center} 
        }

        \parbox[t][5.8cm][t]{\textwidth}{
            \zihao{3}
            \begin{center} 
                \renewcommand{\arraystretch}{1.5} 
                \begin{tabular}{ll}
                    {\songti\bfseries 研\hfill 究\hfill 生} & 
                    \HDUunderline[220pt]{\kaishu \hdu@author} \\ 
                    {\songti\bfseries 专\hfill 业}  & 
                    \HDUunderline[220pt]{\kaishu \hdu@discipline} \\
                    {\songti\bfseries 指导教师} & 
                    \HDUunderline[220pt]{\kaishu \hdu@supervisor}
                \end{tabular} 
                \renewcommand{\arraystretch}{1}
            \end{center} 
        }

        \parbox[t][1.4cm][t]{\textwidth}{
            \begin{center}
                \songti\zihao{4}\textbf{完成日期}
                \HDUunderline[150pt]{\kaishu \quad \hdu@date\quad}
            \end{center} 
        }
    }

% 新版封面 (2025 年更新)
\else
    \newcommand\hdu@cover{
        \thispagestyle{empty}

        \vspace*{-1cm}
        \noindent
        \makebox[\textwidth]{
            \hspace*{0pt}
            {\zihao{-4}学号：\HDUunderline[22mm]{\textsf{\hdu@studentID}}}
            \hfill
            {\zihao{-4}学校代码：\HDUunderline[22mm]{\textsf{10336}}}
        }
        \ifx\hdu@secretLevel\@empty\else
            \makebox[\textwidth]{
                \smallskip
                \hspace*{0pt}
                {\zihao{-4}密级：\HDUunderline[22mm]{\textsf{\hdu@secretLevel}}}\hfill
            }
        \fi
        \vspace{1cm} 

        \begin{center}
            \noindent
            \renewcommand{\arraystretch}{2.5} 
            \begin{tabular}{c}
                \includegraphics[width=135mm]{HDULOGO.pdf}\\
                \noindent{\heiti\zihao{1} \hdu@degreeLevel~~士~~学~~位~~论~~文}\\
                \noindent{\zihao{-1}（\hdu@degreeType 学位）}\\
            \end{tabular}
            \renewcommand{\arraystretch}{1}

            \vspace{0.2cm} 
            \includegraphics[width=28mm]{HDUEMBLEM.pdf}
        \end{center}

        \hspace*{-5mm} 
        \parbox[t][4cm][t]{\textwidth}{ 
            \centering
            \zihao{3}
            \begin{tabular}{lc}
                {\songti\bfseries 论文题目：} & 
                \underline{\makebox[250pt]{\bfseries \hdu@titleA }} \\[2mm]
                & \HDUunderline[250pt]{\bfseries \hdu@titleB}
            \end{tabular}
        }

        \hspace*{-5mm} 
        \parbox{\textwidth}{
            \centering
            \zihao{4}
            \renewcommand{\arraystretch}{1.5} 
            \begin{tabular}{ll}
                {\songti 作\hfill 者\hfill 姓\hfill 名：} & 
                \HDUunderline[65mm]{\hdu@author} \\ 
                {\songti 指\hfill 导\hfill 教\hfill 师：} & 
                \HDUunderline[65mm]{\hdu@supervisor} \\ 
                \ifx\hdu@supervisorB\@empty\else
                    {\songti 第\hfill 二\hfill 导\hfill 师：} & 
                    \HDUunderline[65mm]{\hdu@supervisorB} \\ 
                \fi
                \ifhdu@applied
                    {专业学位类别：} & 
                    \HDUunderline[65mm]{\hdu@degreeCategory} \\ 
                    {专\hfill 业\hfill 领\hfill 域：} & 
                    \HDUunderline[65mm]{\hdu@field} \\ 
                \else
                    {\songti 专\hfill 业\hfill 名\hfill 称：} & 
                    \HDUunderline[65mm]{\hdu@discipline} \\ 
                \fi
                {\songti 所\hfill 在\hfill 学\hfill 院：} &
                \HDUunderline[65mm]{\hdu@school} \\ 
                {\songti 完\hfill 成\hfill 时\hfill 间：} &
                \HDUunderline[65mm]{\hdu@date}
            \end{tabular} 
            \renewcommand{\arraystretch}{1}
        }
    }
\fi


% ==================
% 中文扉页
% ==================
\newcommand{\hdu@title@page@graduate@zh}{
    \cleardoublepage
    \thispagestyle{empty}

    \begin{center}
        \vspace*{0.5mm}
        \parbox[t][2.4cm][t]{\textwidth}{
            \begin{center}
                \songti\zihao{2}\textbf{杭州电子科技大学硕士学位论文}
            \end{center} 
        }

    \vspace{40mm}
    \parbox[t][5cm][t]{\textwidth}{
        \zihao{-1}
        \begin{center}
            \heiti\textbf{\hdu@titleA\\ \hdu@titleB}
        \end{center} 
    } %标题

    \vspace{30mm}

    \parbox[t][2.8cm][t]{\textwidth}{
        \zihao{3}
        \begin{center} 
            \renewcommand{\arraystretch}{1.62} 
            \begin{tabular}{l@{：}l}
                {\songti\textbf{研\hfill 究\hfill 生}} & {\kaishu \hdu@author}\\
                {\songti\textbf{指导教师}} & {\kaishu \hdu@supervisor}
            \end{tabular} 
        \renewcommand{\arraystretch}{1}
      \end{center}
    }
  
    \vspace{20mm}
    \parbox[t][1.4cm][t]{\textwidth}{
        \begin{center}
            \kaishu\zihao{4}{\quad\hdu@date\quad}
        \end{center}
    }
    \end{center}
}

% ==================
% 英文扉页
% ==================
\newcommand{\hdu@title@page@graduate@en}{
    \newpage
    \thispagestyle{empty}

    \begin{center}
        \vspace*{2.0mm}
        \parbox[t][3.5cm][t]{\textwidth}{
            \begin{center} 
                \linespread{1.5} %1.5倍行距
                {\zihao{4}\bfseries\rmfamily Dissertation Submitted for Hangzhou Dianzi University \\
                for the Degree of Master} \par
            \end{center} 
        } 

        \vspace{30mm}
        \parbox[t][4cm][t]{\textwidth}{
            \begin{center} 
                {\zihao{-1} \bfseries \rmfamily \hdu@title@en}
            \end{center} 
        } 

        \vspace{40mm}
        
        \parbox[t][5cm][t]{\textwidth}{
            \zihao{3}
            \begin{center}
                \renewcommand{\arraystretch}{1.3}
                \begin{tabular}{@{}l@{~}l@{}}
                    {\bfseries\rmfamily Candidate:} & \quad \hdu@author@en\\
                    {\bfseries\rmfamily Supervisor:} &  \quad \hdu@supervisor@en\\
                \end{tabular}
                \renewcommand{\arraystretch}{1}
            \end{center}
        }

        \parbox[t][1.4cm][t]{\textwidth}{
            \begin{center}
                {\zihao{4} \bfseries\rmfamily \quad\hdu@date@en \quad}
            \end{center} 
        }
    \end{center}
}

% ===========================
% 学位论文原创性声明和使用授权说明
% ===========================

\newcommand{\hdu@title@page@originality}{
    \newpage
    \thispagestyle{empty}

    \begin{center}
        \linespread{1.5}
        \songti\zihao{3}\bfseries 
        杭州电子科技大学 \\ 学位论文原创性声明和使用授权说明 \\ 
    \end{center}

    \vspace{2mm}

    \begin{center}
        {\songti\zihao{4}\bfseries 独创性声明}
    \end{center}
 
    {
        \linespread{1.5} 
        \songti\zihao{-4}
        本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究工作所取得的成果。
        除文中已经注明引用的内容外，本论文不含任何其他个人或集体已经发表或撰写过的作品或成果。
        对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。
        申请学位论文与资料若有不实之处，本人承担一切相关责任。

        \noindent
        \begin{tabular}{ll}
            & \\
            论文作者签名：\hspace{3cm} & 日期：\hspace{1.5cm}年\hspace{1cm}月\hspace{1cm}日
        \end{tabular}
        \par
    }

    \vspace*{25mm}

    \centerline{\songti\zihao{4}\bfseries 学位论文使用授权说明}

    \vspace{6mm}
  
    {
        \linespread{1.5} 
        \songti\zihao{-4}
        本人完全了解杭州电子科技大学关于保留和使用学位论文的规定，即：研究生在校攻读学位期间论
        文工作的知识产权单位属杭州电子科技大学。本人保证毕业离校后，发表论文或使用论文工作成果
        时署名单位仍然为杭州电子科技大学。学校有权保留送交论文的复印件，允许查阅和借阅论文；学
        校可以公布论文的全部或部分内容，可以允许采用影印、缩印或其它复制手段保存论文。(保密论
        文在解密后遵守此规定)\par
  
        \vspace*{11mm}
        {
            \noindent
            \begin{tabular}{ll}
                & \\
                论文作者签名：\hspace{3cm} & 日期：\hspace{1.5cm}年\hspace{1cm}月\hspace{1cm}日\\
                ~ & ~\\
                指导教师签名：\hspace{3cm} & 日期：\hspace{1.5cm}年\hspace{1cm}月\hspace{1cm}日
            \end{tabular}
            \par
        }
    }
}

% ============================
% 中文摘要环境
% ============================
\newenvironment{abstract}{
    \pagestyle{plain}
    \chapter*{\centering\heiti\zihao{3}\selectfont{}摘~~~~要}
    \setcounter{page}{1}
    \addcontentsline{toc}{chapter}{摘要}
    \songti\zihao{-4}
    \setlength{\baselineskip}{20bp}
    \selectfont
}{
    \par\null\par\noindent\hangindent=4\ccwd\relax
    {\heiti 关键词}：\hdu@keywords\par
    % \clearpage
}

% ============================
% 英文摘要环境
% ============================
\newenvironment{abstract*}{
    \pagestyle{plain}
    \chapter*{\centering\rmfamily\bfseries\zihao{3}\selectfont ABSTRACT}%
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \rmfamily\zihao{-4}
    \setlength{\baselineskip}{20bp}
    \selectfont
}{
    \par\null\par\noindent\hangindent=5.3em\relax
    \textbf{Keywords}: \hdu@keywords@en\par
    \cleardoublepage
}

% ============================
% 致谢环境
% ============================
\newenvironment{acknowledgements}{
    \chapter*{致~~~~谢}
    \addcontentsline{toc}{chapter}{致谢}
    \songti
}{
  \clearpage
}


% ============================
% 目录格式设置
% ============================
% 目录:目录内容中文为宋体、英文为 Times New Roman 小四号字，
% 依次排列摘要、ABSTRACT、各章、节、致谢、参考文献、 附录等。
% \titlecontents{标题名}[左间距]{标题格式}{标题标志}{无序号标题}{指引线与页码}[下间距]
\titlecontents{chapter}
              [\z@]
              {\songti\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont}%
              {\contentspush{\thecontentslabel\hspace{1em}}}{}
              {\titlerule*[4bp]{.}\thecontentspage}%
\titlecontents{section}
              [\ccwd]
              {\songti\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont}
              {\contentspush{\thecontentslabel\hspace{1em}}}{}
              {\titlerule*[4bp]{.}\thecontentspage}%
\titlecontents{subsection}
              [2\ccwd]
              {\songti\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont}
              {\contentspush{\thecontentslabel\hspace{1em}}}{}
              {\titlerule*[4bp]{.}\thecontentspage}%

% 重定义目录命令，修改标题格式并插入书签。
\RenewDocumentCommand \tableofcontents { }
{
    \pagestyle{plain}
    \raggedbottom
    \ctexset{
        contentsname = {目\hspace{\ccwd}录},
    }
    \chapter*{\contentsname}
    \addcontentsline{toc}{chapter}{目录}
    \@starttoc{toc}
}

% “摘要”、“目录”、各章标题、“致谢”、“参考文献”， “附录题目”等为黑体三号字，“ABSTRACT” 为 Times New Roman 加黑三号字，居中，2 倍行距，段前 2 行，段后 1 行。
% 各节标题为黑体四号字，各小节标题为黑体小四号字，均靠左
% 用 \pkg{ctex} 的接口设置全部章节标题格式。
\ctexset{
    chapter = {
        format      = \centering\heiti\zihao{3}\selectfont,
        name = {,},
        number      = \arabic{chapter},
        aftername   = \hspace{\ccwd},
        beforeskip  = 2\baselineskip,
        afterskip   = \baselineskip,
        fixskip     = true,
    },
    section = {
        format     = \heiti\zihao{-3}\selectfont,
        aftername  = \hspace{\ccwd},
    },
    subsection = {
        format     = \heiti\zihao{4}\selectfont,
        aftername  = \hspace{\ccwd},
   },
}


\renewcommand\frontmatter{%
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering{Roman}%
}

\renewcommand\mainmatter{%
    \cleardoublepage
    \@mainmattertrue
    \pagestyle{plain} 
    \pagenumbering{arabic}%
    \songti\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont
}

\RequirePackage{hyperref}
\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    bookmarksdepth     = 3,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }%
  
  \pdfstringdefDisableCommands{
    \let\\\relax
    \let\quad\relax
    \let\qquad\relax
    \let\hspace\@gobble
  }%
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \hypersetup{
    pdflang = zh-CN,
  }
}

\AtBeginDocument{%
    \hypersetup{
        pdftitle    = \hdu@title,
        pdfauthor   = \hdu@author,
        % pdfsubject  = \hdu@degree@name,
        pdfkeywords = \hdu@keywords,
        pdfcreator={hduthesis-v\version},
    }%
    \songti\zihao{-4}
    \setlength{\baselineskip}{20bp}
    \selectfont
}

% 图和表的标题格式为宋体五号字，居中
\DeclareCaptionFont{hdu}{
    \songti\zihao{5}\selectfont
}
\captionsetup{font=hdu}  

% ============================
% 参考文献格式
% ============================
\PassOptionsToPackage{sort&compress}{gbt7714}

% ============================
% 提供一些常用命令
% ============================
\DeclareRobustCommand\cmd[1]{\texttt{#1}}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\file{\nolinkurl}
\DeclareRobustCommand\env{\textsf}
\DeclareRobustCommand\pkg{\textsf}
\DeclareRobustCommand\cls{\textsf}

% ============================
%相关环境设置
% ============================
\theoremstyle{plain}
\theorembodyfont{\songti\rmfamily}
\theoremheaderfont{\heiti\rmfamily}
\newtheorem{definition}{\heiti 定义}[chapter]
\newtheorem{property}{\heiti 性质}[chapter]
\newtheorem{example}{\heiti 例}[chapter]
\newtheorem{algo}{\heiti 算法}[chapter]
\newtheorem{theorem}{\heiti 定理}[chapter]
\newtheorem{axiom}{\heiti 公理}[chapter]
\newtheorem{proposition}{\heiti 命题}[chapter]
\newtheorem{lemma}{\heiti 引理}[chapter]
\newtheorem{corollary}{\heiti 推论}[chapter]
\newtheorem{remark}{\heiti 注解}[chapter]
\newenvironment{proof}{\noindent{\heiti 证明：}}{\hfill $ \square $ \vskip 4mm}
\theoremsymbol{$\square$}
