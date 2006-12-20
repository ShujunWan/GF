-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module GF.JavaScript.ParJS where
import GF.JavaScript.AbsJS
import GF.JavaScript.LexJS
import GF.JavaScript.ErrM
}

%name pProgram Program

-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype { Token }

%token 
 '(' { PT _ (TS "(") }
 ')' { PT _ (TS ")") }
 '{' { PT _ (TS "{") }
 '}' { PT _ (TS "}") }
 ',' { PT _ (TS ",") }
 ';' { PT _ (TS ";") }
 '=' { PT _ (TS "=") }
 '.' { PT _ (TS ".") }
 '[' { PT _ (TS "[") }
 ']' { PT _ (TS "]") }
 'false' { PT _ (TS "false") }
 'function' { PT _ (TS "function") }
 'new' { PT _ (TS "new") }
 'null' { PT _ (TS "null") }
 'return' { PT _ (TS "return") }
 'this' { PT _ (TS "this") }
 'true' { PT _ (TS "true") }
 'var' { PT _ (TS "var") }

L_ident  { PT _ (TV $$) }
L_integ  { PT _ (TI $$) }
L_doubl  { PT _ (TD $$) }
L_quoted { PT _ (TL $$) }
L_err    { _ }


%%

Ident   :: { Ident }   : L_ident  { Ident $1 }
Integer :: { Integer } : L_integ  { (read $1) :: Integer }
Double  :: { Double }  : L_doubl  { (read $1) :: Double }
String  :: { String }  : L_quoted { $1 }

Program :: { Program }
Program : ListElement { Program (reverse $1) } 


Element :: { Element }
Element : 'function' Ident '(' ListIdent ')' '{' ListStmt '}' { FunDef $2 $4 (reverse $7) } 
  | Stmt { ElStmt $1 }


ListElement :: { [Element] }
ListElement : {- empty -} { [] } 
  | ListElement Element { flip (:) $1 $2 }


ListIdent :: { [Ident] }
ListIdent : {- empty -} { [] } 
  | Ident { (:[]) $1 }
  | Ident ',' ListIdent { (:) $1 $3 }


Stmt :: { Stmt }
Stmt : '{' ListStmt '}' { SCompound (reverse $2) } 
  | 'return' ';' { SReturnVoid }
  | 'return' Expr ';' { SReturn $2 }
  | DeclOrExpr ';' { SDeclOrExpr $1 }


ListStmt :: { [Stmt] }
ListStmt : {- empty -} { [] } 
  | ListStmt Stmt { flip (:) $1 $2 }


DeclOrExpr :: { DeclOrExpr }
DeclOrExpr : 'var' ListDeclVar { Decl $2 } 
  | Expr { DExpr $1 }


DeclVar :: { DeclVar }
DeclVar : Ident { DVar $1 } 
  | Ident '=' Expr { DInit $1 $3 }


ListDeclVar :: { [DeclVar] }
ListDeclVar : {- empty -} { [] } 
  | DeclVar { (:[]) $1 }
  | DeclVar ',' ListDeclVar { (:) $1 $3 }


Expr13 :: { Expr }
Expr13 : Expr14 '=' Expr13 { EAssign $1 $3 } 
  | Expr14 { $1 }


Expr14 :: { Expr }
Expr14 : 'new' Ident '(' ListExpr ')' { ENew $2 $4 } 
  | Expr15 { $1 }


Expr15 :: { Expr }
Expr15 : Expr15 '.' Ident { EMember $1 $3 } 
  | Expr15 '[' Expr ']' { EIndex $1 $3 }
  | Expr15 '(' ListExpr ')' { ECall $1 $3 }
  | Expr16 { $1 }


Expr16 :: { Expr }
Expr16 : Ident { EVar $1 } 
  | Integer { EInt $1 }
  | Double { EDbl $1 }
  | String { EStr $1 }
  | 'true' { ETrue }
  | 'false' { EFalse }
  | 'null' { ENull }
  | 'this' { EThis }
  | 'function' '(' ListIdent ')' '{' ListStmt '}' { EFun $3 (reverse $6) }
  | '(' Expr ',' ListExpr ')' { eseq1_ $2 $4 }
  | '(' Expr ')' { $2 }


ListExpr :: { [Expr] }
ListExpr : {- empty -} { [] } 
  | Expr { (:[]) $1 }
  | Expr ',' ListExpr { (:) $1 $3 }


Expr :: { Expr }
Expr : Expr1 { $1 } 


Expr1 :: { Expr }
Expr1 : Expr2 { $1 } 


Expr2 :: { Expr }
Expr2 : Expr3 { $1 } 


Expr3 :: { Expr }
Expr3 : Expr4 { $1 } 


Expr4 :: { Expr }
Expr4 : Expr5 { $1 } 


Expr5 :: { Expr }
Expr5 : Expr6 { $1 } 


Expr6 :: { Expr }
Expr6 : Expr7 { $1 } 


Expr7 :: { Expr }
Expr7 : Expr8 { $1 } 


Expr8 :: { Expr }
Expr8 : Expr9 { $1 } 


Expr9 :: { Expr }
Expr9 : Expr10 { $1 } 


Expr10 :: { Expr }
Expr10 : Expr11 { $1 } 


Expr11 :: { Expr }
Expr11 : Expr12 { $1 } 


Expr12 :: { Expr }
Expr12 : Expr13 { $1 } 



{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map prToken (take 4 ts))

myLexer = tokens
eseq1_ x_ xs_ = ESeq (x_ : xs_)
}

