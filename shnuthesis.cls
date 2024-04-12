%%
%% This is file `shnuthesis.cls',
%%
%% @author andy123t
%% @date 2024/04/12
%% @version v4.6
%% @address https://github.com/andy123t/shnuthesis
%% LaTeX thesis template for Shanghai Normal University
%%

%---------- 定义的新的Class ----------
\ProvidesClass{shnuthesis}[2024/04/12 v4.6]
\NeedsTeXFormat{LaTeX2e}

%---------- 载入学校logo ----------
\def\logopic{shnu.eps}  %SHNU-logo

%---------- 定义的新的Options ----------
\newif\ifshnu@master
\newif\ifshnu@print
\newif\ifshnu@science
\newif\ifshnu@arts
\DeclareOption{master}{\shnu@mastertrue}
\DeclareOption{doctor}{\shnu@masterfalse}
\DeclareOption{print}{\shnu@printtrue}
\DeclareOption{science}{\shnu@sciencetrue}
\DeclareOption{arts}{\shnu@artstrue}
\DeclareOption{openany}{\PassOptionsToClass{openany}{ctexbook}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{master,science,openany,twoside}
\ProcessOptions\relax

%---------------------------------
% twoside,openany 单面排版
% twoside,openany,print 用于打印, 封面等生成空白页
% twoside,openright,print 用于打印, 全部双面排版
%---------------------------------

%---------- 修改字体宏包 ----------
\PassOptionsToPackage{no-math}{fontspec}

%---------- 载入Class ----------
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}
\@ifclasslater{ctexbook}{2017/01/01}{}{%
    \ClassError{shnuthesis}{ctex >= 2017/01/01 is required ...}{}%
}

%---------- 定义页边距 ----------
\RequirePackage{geometry}
%\geometry{left=2.5cm,right=2.5cm,top=2.7cm,bottom=3.0cm}
\geometry{left=3.0cm,right=3.0cm,top=2.9cm,bottom=3.2cm}
\setlength{\headheight}{18pt}
\setlength{\headsep}{18pt}
\setlength{\footskip}{28pt}

%---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{mathrsfs}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{makecell}
\RequirePackage{etoolbox}
\RequirePackage{titletoc}
\RequirePackage{anyfontsize}
\RequirePackage{pdfpages}
\RequirePackage[numbered]{bookmark}
\RequirePackage{microtype}

%---------- 定义文档属性格式 ----------
\def\shnu@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{
        \expandafter\gdef\csname shnu@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}

%----------- 添加几个新的文档属性 -----------
\shnu@define@term{shnucode}
\shnu@define@term{institute}
\shnu@define@term{major}
\shnu@define@term{research}
\shnu@define@term{studentID}
\shnu@define@term{advisor}

%---------- 定义新变量 ----------
\newcommand\shnuname{上海师范大学}
\newcommand\cnabstractname{摘~~要}
\newcommand\enabstractname{Abstract}
\newcommand\denotationname{主要符号表}
\newcommand\acknowledgementname{致谢}

\ifshnu@master
    \newcommand\shnu@thesisname{硕~士~学~位~论~文}%
    \newcommand\shnu@shnuthesisname{上海师范大学硕士学位论文}%
    \newcommand\shnu@publications{攻读硕士学位期间的研究成果}%
    \else
    \newcommand\shnu@thesisname{博~士~学~位~论~文}%
    \newcommand\shnu@shnuthesisname{上海师范大学博士学位论文}%
    \newcommand\shnu@publications{攻读博士学位期间的研究成果}%
\fi

%------- 重新定义cleardoublepage --------
\renewcommand{\cleardoublepage}{\clearpage
    \clearpage\if@twoside\ifodd\c@page\else%
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%---------- 设置超链接 ----------
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=blue,
    filecolor=blue,
    urlcolor=blue
}

%---------- 设置正文前页码为大写罗马数字 ----------
\renewcommand\frontmatter{%
    \ifshnu@print\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}%
}

%---------- 设置正文页码为阿拉伯数字 ----------
\renewcommand\mainmatter{%
    \ifshnu@print\cleardoublepage\else\clearpage\fi
    \pagenumbering{arabic}%
    \@mainmattertrue
}

%---------- 设置图片的路径 ----------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

%---------- 设置章节目录的深度 ----------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%---------- 定义章节字号 ----------
\newcommand{\chapfont}{\fontsize{20bp}{28bp}\selectfont}
\newcommand{\secfont}{\fontsize{15bp}{20bp}\selectfont}
\newcommand{\subsecfont}{\fontsize{14bp}{20bp}\selectfont}
\newcommand{\ssubsecfont}{\fontsize{12bp}{18bp}\selectfont}

%---------- 定义章节标题格式 ----------
%---------- 理科论文章节格式 ----------
\ifshnu@science
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\sffamily\heiti\chapfont\centering,
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        numberformat = {},
        aftername = \quad,
        beforeskip = {-4pt},
        afterskip = {24pt},
        pagestyle = plain,
    }
}
%--- section ---
\ctexset{
    section = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-3}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%--- subsection ---
\ctexset{
    subsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- subsubsection ---
\ctexset{
    subsubsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- appendix ---
\ctexset{
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    }
}
\fi

%---------- 文科论文章节格式 ----------
\ifshnu@arts
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\sffamily\heiti\chapfont\centering,
        nameformat = {},
        titleformat = {},
        number = \chinese{chapter},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {4pt},
        afterskip = {24pt},
        pagestyle = plain,
    }
}
%--- section ---
\ctexset{
    section = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-3}\centering,
        name = {第,节},
        number = \chinese{section},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%--- subsection ---
\ctexset{
    subsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{4}\raggedright,
        number = \chinese{subsection},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- subsubsection ---
\ctexset{
    subsubsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-4}\raggedright,
        name = {（,）},
        number = \chinese{subsubsection},
        numberformat = \heiti,
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- appendix ---
\ctexset{
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    }
}
\fi

%---------- 算法宏包及设置 ----------
\RequirePackage{algorithm,algorithmicx}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\algrenewcommand\algorithmicrequire{\textbf{输入:}}
\algrenewcommand\algorithmicensure{\textbf{输出:}}

%---------- 定义页眉页脚 ----------
% 定义页眉和页脚 使用 fancyhdr 宏包

%---------- 设置分隔线宽度 ----------
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

%---------- 设置页眉样式 ----------
% \renewcommand{\headrule}{%
%     \let\headrulewidth\plainheadrulewidth
%     \hrule\@height 1.5pt \@width\headwidth
%     \vskip 1.6pt
%     \hrule\@height 0.4pt \@width\headwidth
%     \vskip-1.5pt
% }

\renewcommand{\headrule}{%
    \let\headrulewidth\plainheadrulewidth
    \hrule\@height 0.5pt \@width\headwidth
    \vskip-1.5pt
}

%---------- 设置页眉样式 ----------
\newcommand{\headstyle}{
    %\fancyhead[RO,LE]{\zihao{5} \nouppercase{\leftmark}}
    %\fancyhead[LO,RE]{\zihao{5} \shnu@shnuthesisname}
    \fancyhead[C]{\zihao{5} \nouppercase{\leftmark}}
}

%---------- 设置页脚样式 ----------
\newcommand{\footstyle}{
    %\fancyfoot[C]{\zihao{5} \thepage}
    \fancyfoot[LE]{\zihao{5} \thepage}
    \fancyfoot[RO]{\zihao{5} \thepage}
}

%---------- 定义plain样式 ----------
\fancypagestyle{plain}{%
    \fancyhf{}
    \headstyle
    \footstyle
}

\pagestyle{plain}

%---------- 中文段落缩进和行距 ----------
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{4pt plus 1pt minus 1pt}
\linespread{1.35}  % 设置行距
%\renewcommand{\baselinestretch}{1.35}

%---------- 浮动对象设置 ----------
% 浮动对象的缺省值稍微宽松一点
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%---------- 设置图表格式 ----------
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
%\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
%\renewcommand{\thetable}{\thechapter.\arabic{table}}

%---------- 定制图形和表格标题的样式 ----------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={6pt},name={图}}
\captionsetup[table]{position=top,skip={3pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
%\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
%\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}

%---------- 重新设置图表autoref ----------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

%---------- 使用tabularx库并定义新的左右中格式 ----------
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

%---------- 设置三线表格式 ----------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}

%---------- 数学定理设置 ----------
\newtheoremstyle{shnu}
{0.5\topsep}{0.5\topsep}
{\itshape}{}{\bfseries}
{.}{5pt plus 1pt minus 1pt}{}
%\theoremstyle{plain}
\theoremstyle{shnu}
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    %\normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont \topsep0\p@\@plus3\p@\relax
    \trivlist\item[\hskip\labelsep
    \bfseries #1\@addpunct{\,:\,}]\ignorespaces
}{%
    \popQED\endtrivlist\@endpefalse
}

%---------- 数学公式设置 ----------
\allowdisplaybreaks[4]

%---------- 设置公式间距 ----------
\AtBeginDocument{
    \setlength{\abovedisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\belowdisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
    \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
    %\setlength{\arraycolsep}{2pt}
}

%---------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}

%---------- 重新设置公式autoref ----------
\renewcommand{\equationautorefname}{公式}

%---------- 定义列表项的样式 ----------
\RequirePackage{enumitem}
\setlist{nolistsep}

%---------- 定义新的列表 ----------
\newlist{biblist}{enumerate}{1}
\setlist[biblist]{leftmargin=*,label={[\arabic*]}}

%---------- 定义新的标题页面 ----------
\renewcommand{\maketitle}[1][15em]{
    \clearpage
    \phantomsection
    \pdfbookmark[0]{封~~面}{cover}
    \thispagestyle{empty}
    \begin{center}
        \vspace*{-1.8\baselineskip}

        {\hfill 学校代码：\shnu@shnucode \hspace*{8cm} 学号：\shnu@studentID \hfill}

        \vspace*{\fill}

        \vspace*{3.0\baselineskip}

        \includegraphics[width=10cm]{\logopic}

        \vspace*{1.0\baselineskip}

        {\fontsize{40bp}{40bp}\selectfont\shnu@thesisname}

        \vspace*{2.5\baselineskip}

        \parbox[t]{15cm}{\centering\zihao{1}\sffamily\heiti\@title}

        \vspace*{3.0\baselineskip}

        {\zihao{3} \heiti \renewcommand\arraystretch{1.6}
        \begin{tabular}{lc}
            \makebox[7em][s]{学 \hfill 院~：} & \underline{\makebox[#1]{\shnu@institute}} \\
            \makebox[7em][s]{专 \hfill 业~：} & \underline{\makebox[#1]{\shnu@major}} \\
            \makebox[7em][s]{研 \hfill 究 \hfill 方 \hfill 向~：} & \underline{\makebox[#1]{\shnu@research}} \\
            \makebox[7em][s]{研 \hfill 究 \hfill 生 \hfill 姓 \hfill 名~：} & \underline{\makebox[#1]{\@author}} \\
            \makebox[7em][s]{指 \hfill 导 \hfill 教 \hfill 师~：} & \underline{\makebox[#1]{\shnu@advisor}} \\
            \makebox[7em][s]{完 \hfill 成 \hfill 日 \hfill 期~：} & \underline{\makebox[#1]{\@date}} \\
        \end{tabular}}
    \end{center}
    \vspace*{\fill}
    \ifshnu@print
        \cleardoublepage
        \hypersetup{hidelinks}
    \else
        \clearpage
    \fi
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义声明页 ----------
\newcommand{\makestatement}[1][]{
    \clearpage
    \phantomsection
    \pdfbookmark[0]{声明页}{statement}
    \def\shnu@tmp{#1}
    \ifx\shnu@tmp\@empty
    \thispagestyle{empty}
    {
        \linespread{1.6}\selectfont
        \ziju{0.03}

        \vspace*{0.2\baselineskip}

        \begin{center}
            {\heiti \chapfont 论文独创性声明}
        \end{center}

        \vspace*{\baselineskip}

        本论文是我个人在导师指导下进行的研究工作及取得的研究成果。论文中除了特别加以标注和致谢的地方外，不包含其他人或机构已经发表或撰写过的研究成果。其他同志对本研究的启发和所做的贡献均已在论文中做了明确的声明并表示了谢意。

        \vspace*{2.4\baselineskip}

        \hspace*{1.5cm} \raisebox{4pt}{作者签名：} \hrulefill \hspace*{4em} \raisebox{4pt}{日\hspace*{2em}期：}\hrulefill \hspace*{0.5cm}

        \vspace*{4.0\baselineskip}

        \begin{center}
            {\heiti \chapfont 论文使用授权声明}
        \end{center}

        \vspace*{\baselineskip}

        本人完全了解上海师范大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被査阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其它手段保存论文。暂缓出版的论文在公开后遵守此规定。

        \vspace*{2.4\baselineskip}

        \hspace*{1.5cm} \raisebox{4pt}{作者签名：} \hrulefill \hspace*{4em} \raisebox{4pt}{导师签名：} \hrulefill \hspace*{0.5cm}

        \vspace*{0.25\baselineskip}

        \hspace*{1.5cm} \raisebox{4pt}{日\hspace*{2em}期：} \hrulefill \hspace*{4em} \raisebox{4pt}{日\hspace*{2em}期：} \hrulefill \hspace*{0.5cm}

        \vspace*{2.0\baselineskip}
    }
    \else
        \kv@define@key{shnu@statement}{file}{\includepdf{\kv@value}}%
        \kv@set@family@handler{shnu@statement}{%
            \ifx\kv@value\relax\includepdf{\kv@key}\else\kv@handled@false\fi%
        }
        \kvsetkeys{shnu@statement}{#1}
    \fi
    \ifshnu@print\cleardoublepage\else\clearpage\fi
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义插入封面pdf文件命令 ----------
\newcommand{\insertcover}[1]{
    \clearpage
    \phantomsection
    \pdfbookmark[0]{封~~面}{cover}
    \thispagestyle{empty}
    \includepdf{#1}
    \ifshnu@print\cleardoublepage\else\clearpage\fi
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义插入声明页pdf文件命令 ----------
\newcommand{\insertstatement}[1]{
    \clearpage
    \phantomsection
    \pdfbookmark[0]{声明页}{statement}
    \thispagestyle{empty}
    \includepdf{#1}
    \ifshnu@print\cleardoublepage\else\clearpage\fi
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义中英文关键词 ----------
%--- 中文关键词 ---
\newcommand{\cnkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries 关键词:~} #1}
%--- 英文关键词 ---
\newcommand{\enkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries Key Words:~} #1}

%---------- 中文摘要环境 ----------
\newenvironment{cnabstract}{
    \clearpage
    \pagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\cnabstractname}
    \chapter*{\cnabstractname}
    \chaptermark{\cnabstractname}
}{
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 英文摘要环境 ----------
\newenvironment{enabstract}{
    \clearpage
    \pagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\enabstractname}
    \chapter*{\enabstractname}
    \chaptermark{\enabstractname}
}{
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义新的目录页面 ----------
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\hfill\heiti\chapfont}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\heiti\chapfont}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\heiti\chapfont}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforechapskip}{10pt plus 2pt minus 2pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapfont}{\sffamily\heiti}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\ifshnu@arts
\renewcommand{\cftsubsecaftersnumb}{\hspace{-1.4em}}
\renewcommand{\cftsubsubsecaftersnumb}{\hspace{-1.4em}}
\fi

%---------- 设置新的生成目录命令 ----------
\newcommand{\maketoc}{
    % 设置目录hdr和页码选项
    \clearpage
    \pagestyle{plain}
    \phantomsection
    \addcontentsline{toc}{chapter}{\contentsname}
    \tableofcontents
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 设置插图清单和表格清单格式 ----------
\titlecontents{figure}[0pt]{}{
\figureautorefname\hspace*{0.3em}\thecontentslabel\quad}{}{
\titlerule*[8pt]{$\cdot$}\contentspage}
\titlecontents{table}[0pt]{}{
\tableautorefname\hspace*{0.3em}\thecontentslabel\quad}{}{
\titlerule*[8pt]{$\cdot$}\contentspage}

%---------- 重定义插图清单 ----------
\newcommand\makelof{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\listfigurename}
    \chaptermark{\listfigurename}
    \@starttoc{lof}
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 重定义表格清单 ----------
\newcommand\makelot{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\listtablename}
    \chaptermark{\listtablename}
    \@starttoc{lot}
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义主要符号表环境 ----------
\newenvironment{denotation}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\denotationname}
    \chapter*{\denotationname}
    \chaptermark{\denotationname}
}{
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 重新定义参考文献页 ----------
\RequirePackage[sort&compress]{natbib}
\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\newcommand\bibstyle@numbers{\bibpunct{[}{]}{,}{n}{,}{,}}
\newcommand\bibstyle@authoryear{\bibpunct{(}{)}{;}{a}{,}{,}}
%--- 参考文献引用 ---
\renewcommand\NAT@citesuper[3]{%
    \ifNAT@swa\if*#2*\else#2\NAT@spacechar\fi
    \unskip\kern\p@\textsuperscript{\NAT@@open#1%
    \if*#3*\else,\NAT@spacechar#3\fi
    \NAT@@close}\else#1\fi\endgroup}
%--- 参考文献间距 ---
\def\bibfont{\small}
\setlength{\bibsep}{7pt plus 3pt minus 3pt}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
    \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
    \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
    \do\u\do\v\do\w\do\x\do\y\do\z%
    \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J%
    \do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T%
    \do\U\do\V\do\W\do\X\do\Y\do\Z%
    \do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0%
}
%--- 设置新的参考文献命令 ---
\renewcommand{\bibname}{参考文献}
\renewcommand\bibsection{%
    \@mainmatterfalse
    \chapter{\bibname}%
    \@mainmattertrue
}

%---------- 定义新的环境研究成果页 ----------
\newenvironment{publications}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\shnu@publications}
    \chapter*{\shnu@publications}
    \chaptermark{\shnu@publications}
    \baselineskip=1.2\baselineskip
}{
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义新的致谢环境 ----------
\newenvironment{acknowledgement}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\acknowledgementname}
    \chapter*{\acknowledgementname}
    \chaptermark{\acknowledgementname}
    \baselineskip=1.2\baselineskip
}{
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% End of file `shnuthesis.cls'.
