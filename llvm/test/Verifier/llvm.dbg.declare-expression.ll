; RUN: llvm-as -disable-output <%s 2>&1 | FileCheck %s
; CHECK: invalid #dbg record expression
; CHECK-NEXT: #dbg_declare({{.*}})
; CHECK: warning: ignoring invalid debug info

define void @foo(i32 %a) {
entry:
  %s = alloca i32
  call void @llvm.dbg.declare(metadata ptr %s, metadata !DILocalVariable(scope: !1), metadata !"")
  ret void
}

declare void @llvm.dbg.declare(metadata, metadata, metadata)

!llvm.module.flags = !{!0}
!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = distinct !DISubprogram()
