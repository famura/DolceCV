% ================================================== %
% Based on and inspired by the Friggeri CV template
% https://www.overleaf.com/latex/templates/friggeri-cv-template/hmnchbfmjgqh
% ================================================== %

\ProvidesClass{dolce-cv}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{german}{\def\@cv@german{}}
\DeclareOption{print}{\def\@cv@print{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}% this class is based on the acricle class
}

\ProcessOptions\relax
\LoadClass{article}% this class is based on the acricle class


\def\firstname#1{\def\@firstname{#1}}
\def\lastname#1{\def\@lastname{#1}}

% ================================================== %
% LAYOUT
% ================================================== %

\RequirePackage[left=5.8cm, top=2.8cm, right=1.3cm, bottom=1.3cm, nohead, nofoot]{geometry} % letterpaper or a4paper is handled by the acrticle class on which this class is based
% 4.3 (left side witdh) + 1.25 (margin left) + X (space between left side and main)
% 2. (top header)

% ================================================== %
% COLORS
% ================================================== %

\RequirePackage{xcolor}

\definecolor{datecolor}{RGB}{180, 180, 180}

\definecolor{darkgray}{RGB}{45, 45, 45}
\definecolor{gray}{RGB}{65, 65, 65}
\definecolor{lightgray}{RGB}{120, 120, 120}
\definecolor{white}{RGB}{255,255,255}
\definecolor{silver}{HTML}{808080}
\definecolor{blue}{HTML}{66D9EE}
\definecolor{red}{HTML}{FA2772}
\definecolor{orange}{HTML}{FE9720}
\definecolor{green}{HTML}{A7E22E}
\definecolor{purple}{HTML}{9358FE}
\definecolor{aquamarine}{HTML}{36AF90}

% seaborn's tab10 color palette
\definecolor{sns1}{HTML}{1f77b4}
\definecolor{sns2}{HTML}{ff7f0e}
\definecolor{sns3}{HTML}{2ca02c}
\definecolor{sns4}{HTML}{d62728}
\definecolor{sns5}{HTML}{9467bd}
\definecolor{sns6}{HTML}{8c564b}
\definecolor{sns7}{HTML}{e377c2}
\definecolor{sns8}{HTML}{7f7f7f}
\definecolor{sns9}{HTML}{bcbd22}
\definecolor{sns10}{HTML}{17becf}

% seaborn's dark tab10 color palette
\definecolor{sns1dark}{HTML}{001c7f}
\definecolor{sns2dark}{HTML}{b1400d}
\definecolor{sns3dark}{HTML}{12711c}
\definecolor{sns4dark}{HTML}{8c0800}
\definecolor{sns5dark}{HTML}{591e71}
\definecolor{sns6dark}{HTML}{592f0d}
\definecolor{sns7dark}{HTML}{a23582}
\definecolor{sns8dark}{HTML}{3c3c3c}
\definecolor{sns9dark}{HTML}{b8850a}
\definecolor{sns10dark}{HTML}{006374}


\ifdefined\@cv@print
  \colorlet{blue}{gray}
  \colorlet{red}{gray}
  \colorlet{orange}{gray}
  \colorlet{green}{gray}
  \colorlet{purple}{gray}
  \colorlet{aquamarine}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
  \definecolor{sns1}{HTML}{gray}
  \definecolor{sns2}{HTML}{gray}
  \definecolor{sns3}{HTML}{gray}
  \definecolor{sns4}{HTML}{gray}
  \definecolor{sns5}{HTML}{gray}
  \definecolor{sns6}{HTML}{gray}
  \definecolor{sns7}{HTML}{gray}
  \definecolor{sns8}{HTML}{gray}
  \definecolor{sns9}{HTML}{gray}
  \definecolor{sns10}{HTML}{gray}
  \definecolor{sns1dark}{HTML}{gray}
  \definecolor{sns2dark}{HTML}{gray}
  \definecolor{sns3dark}{HTML}{gray}
  \definecolor{sns4dark}{HTML}{gray}
  \definecolor{sns5dark}{HTML}{gray}
  \definecolor{sns6dark}{HTML}{gray}
  \definecolor{sns7dark}{HTML}{gray}
  \definecolor{sns8dark}{HTML}{gray}
  \definecolor{sns9dark}{HTML}{gray}
  \definecolor{sns10dark}{HTML}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\newcommand{\simurlacra}{Simu{\color{sns1} RL}acra}


% ================================================== %
% FONTS
% ================================================== %

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont{Roboto-Regular}[Path=fonts/]
\newfontfamily\bodyfontit{Roboto-Italic}[Path=fonts/] % former: LightItalic
\newfontfamily\thinfont{Roboto-Light}[Path=fonts/] % former: Thin
\newfontfamily\thinfontit{Roboto-LightItalic}[Path=fonts/]
\newfontfamily\headingfont{RobotoCondensed-Bold}[Path=fonts/]

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path=fonts/]{Roboto-Light}

% ================================================== %
% HEADER
% ================================================== %

\RequirePackage{tikz}

\newcommand{\header}[2]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.0cm] (box) at (current page.north){};% former: height=2.0cm
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{48pt}\color{header}% former: 65pt
      {\thinfont #1}{\bodyfont  #2}
    };
  \end{tikzpicture}
}

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\chead{\header{\@firstname~}{\@lastname}\lastupdated}
\cfoot{}
% Disable the default rule at the top and bottom
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% ================================================== %
% THE LAST UPDATED COMMAND
% ================================================== %

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{polyglossia}

\newcommand{\sethyphenation}[3][]{%
  \sbox0{\begin{otherlanguage}[#1]{#2}
    \hyphenation{#3}\end{otherlanguage}}}
%\sethyphenation[<options>]{<language>}{<list of words separated by spaces>}

\ifdefined\@cv@german
  \setdefaultlanguage{german}
  \def\lastupdatedtext{zuletzt aktualisiert am}
\else
  \setdefaultlanguage[variant=us]{english}
  \def\lastupdatedtext{last updated on}
\fi

\setlength{\TPHorizModule}{0.01\paperwidth}
\setlength{\TPVertModule}{0.01\paperwidth}

\newcommand{\lastupdated}{ 
  \begin{textblock}{10}(11.3, 0.05)
    \raggedleft
    \fontsize{8pt}{10pt}\color{datecolor}\thinfont 
    \lastupdatedtext{} \today
  \end{textblock}}

% ================================================== %
% STRUCTURE
% ================================================== %

\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        sns1\or%
        sns2\or%
        sns3\or%
        sns4\or%
        sns5\or%
        sns6\else%
        headercolor\fi%
    } #1%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{%
  {\par\vspace{0pt}% former: \parskip
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }%
  \par\vspace{\parskip}}% former: \parskip
}

\renewcommand{\subsection}[2]{%
  \par\vspace{.5\parskip}
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.5\parskip}%
}

% ================================================== %
% TEXT FORMATTING
% ================================================== %

\newcommand{\addresskeyword}[1]{%
	{\color{darkgray}\bodyfontit #1}%
}
\newcommand{\papertitle}[2]{%
	{\color{gray}\href{#2}{\bodyfontit #1}}% former: \thinfontit #1
}
\newcommand{\paperentry}[5]{% #1: authors, #2: title, #3: URL, #4: conference, #5: year
	#1. \papertitle{#2}{#3}. \textbf{#4}. #5 \\
}
\newcommand{\jobtitle}[1]{%
    {\color{gray}\bodyfontit #1}%
}

\RequirePackage{enumitem}
\setitemize{noitemsep, leftmargin=\parindent, labelindent=\parindent}

% ================================================== %
% MAIN ENTRYLIST ENVIRONMENT
% ================================================== %

\RequirePackage{longtable}
\RequirePackage{tabu}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
	\begin{longtabu} to \textwidth {@{\extracolsep{\fill}}Xl}
	}{%
	\end{longtabu}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
	#1&\parbox[t]{0.85\textwidth}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize\bodyfontit\addfontfeature{Color=darkgray} #3}\\% former: \footnotesize\addfontfeature{Color=lightgray}
		#4%
	}\vspace{\parsep}\\%
}

\newcommand{\authorhighlight}[1]{\headingfont{#1}}

% ================================================== %
% SIMPLE LIST ENRY
% ================================================== %

\newcommand{\simpleentry}[3]{%
	#1&\parbox[t]{0.85\textwidth}{%
		#2%
		\hfill%
		{\footnotesize\addfontfeature{Color=lightgray} #3}%
	}\\% former: }\vspace{\parsep}
}

% ================================================== %
% LEFT SIDE
% ================================================== %

\RequirePackage[absolute, overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
	\let\oldsection\section
	\renewcommand{\section}[1]{
		\par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
	}
	\begin{textblock}{4.05}(1.0, 3.2)% \begin{textblock}{〈hsize〉}(〈hpos〉,〈vpos〉), former: {3.6}(1.5, 4.33)
		\begin{flushright}
			\obeycr
		}{%
			\restorecr
		\end{flushright}
	\end{textblock}
	\let\section\oldsection
}

% ================================================== %
% COMPETENCE CIRCLES
% ================================================== %

\newcommand{\tikzcircle}[2]{% #1 is the contur color and #2 is the fill color which defaults to thite
	\tikz[baseline=-0.7ex]\draw[#1, fill=#2, radius=0.4ex] (0, 0) circle ;
}
\newcommand{\unfilledcircle}{\tikzcircle{gray}{white}}
\newcommand{\filledcircle}{\tikzcircle{gray}{gray}}

\newcommand{\oneoffour}{%
	\tikzcircle{gray}{sns1}\!%
	\tikzcircle{gray}{white}\!%
	\tikzcircle{gray}{white}\!%
	\tikzcircle{gray}{white}\!%
}
\newcommand{\twooffour}{%
	\tikzcircle{gray}{sns1}\!%
	\tikzcircle{gray}{sns2}\!%
	\tikzcircle{gray}{white}\!%
	\tikzcircle{gray}{white}\!%
}
\newcommand{\threeoffour}{%
	\tikzcircle{gray}{sns1}\!%
	\tikzcircle{gray}{sns2}\!%
	\tikzcircle{gray}{sns3}\!%
	\tikzcircle{gray}{white}\!%
}
\newcommand{\fouroffour}{%
	\tikzcircle{gray}{sns1}\!%
	\tikzcircle{gray}{sns2}\!%
	\tikzcircle{gray}{sns3}\!%
	\tikzcircle{gray}{sns4}\!%
}

% ================================================== %
% HYPERLINKS
% ================================================== %
\RequirePackage{hyperref}

% Add meta-information
%\hypersetup{
%	pdftitle=\@firstname \@lastname -- CV,
%	pdfauthor=\@firstname \@lastname,
%	pdfsubject=CV%
%}