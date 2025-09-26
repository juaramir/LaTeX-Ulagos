% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]
%\RequirePackage{palatino}

\usepackage{graphicx}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@memotitle{\relax}
\newcommand{\memotitle}[1]{\gdef\@memotitle{#1}}

\def\@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}

\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}

\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}

\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[l]{0.3\textwidth}
		\begin{flushleft}
			\vspace{-0.6in}
			\includegraphics[scale=0.2]{Ulagos.png}
			\vspace{0.5in}
		\par\end{flushleft}%
  \end{minipage} \hfill
\begin{minipage}[c]{0.3\textwidth} 

\end{minipage} \hfill
\begin{minipage}[r]{0.3\textwidth} 
  		\begin{flushright}
			\vspace{-0.6in}
			\includegraphics[scale=0.5]{Acreditacion.png}
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
	\LARGE\bf
	\textsc{\@memotitle}
	\end{center}}
	% To, From, Subject Block
	\begin{description}
		\ifthenelse{\equal{\@memoto}{\relax}}{}{\item [{A:}] \@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [{De:}] \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [{Asunto:}] \@memosubject}
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [{Fecha:}] \@memodate}
	\end{description}
	\decorativeline\bigskip{}
}