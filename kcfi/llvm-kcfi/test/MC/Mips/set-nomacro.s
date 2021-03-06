# RUN: llvm-mc %s -arch=mips -mcpu=mips32 2>&1 | FileCheck %s

# CHECK-NOT: warning: macro instruction expanded into multiple instructions
  .set macro
  li  $8, -16
  li  $8, 16
  li  $8, 161616

  la  $8, 16
  la  $8, 161616
  la  $8, 16($9)
  la  $8, 161616($9)
  la  $8, symbol

  jal $25
  jal $4, $25

  bne $2, 0, 1332
  bne $2, 1, 1332
  beq $2, 0, 1332
  beq $2, 1, 1332

  blt $7, $8, local_label
  blt $7, $0, local_label
  blt $0, $8, local_label
  blt $0, $0, local_label

  bltu $7, $8, local_label
  bltu $7, $0, local_label
  bltu $0, $8, local_label
  bltu $0, $0, local_label

  ble $7, $8, local_label
  ble $7, $0, local_label
  ble $0, $8, local_label
  ble $0, $0, local_label

  bleu $7, $8, local_label
  bleu $7, $0, local_label
  bleu $0, $8, local_label
  bleu $0, $0, local_label

  bge $7, $8, local_label
  bge $7, $0, local_label
  bge $0, $8, local_label
  bge $0, $0, local_label

  bgeu $7, $8, local_label
  bgeu $7, $0, local_label
  bgeu $0, $8, local_label
  bgeu $0, $0, local_label

  bgt $7, $8, local_label
  bgt $7, $0, local_label
  bgt $0, $8, local_label
  bgt $0, $0, local_label

  bgtu $7, $8, local_label
  bgtu $7, $0, local_label
  bgtu $0, $8, local_label
  bgtu $0, $0, local_label

  ulhu $5, 0

  add $4, $5, $6

  .set noreorder
  .set nomacro
  li  $8, -16
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  li  $8, 16
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  li  $8, 161616
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  la  $8, 16
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  la  $8, 161616
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  la  $8, 16($9)
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  la  $8, 161616($9)
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  la  $8, symbol
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  jal $25
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  jal $4, $25
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bne $2, 0, 1332
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bne $2, 1, 1332
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  beq $2, 0, 1332
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  beq $2, 1, 1332
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  blt $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  blt $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  blt $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  blt $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bltu $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bltu $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bltu $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bltu $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  ble $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  ble $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  ble $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  ble $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bleu $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bleu $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bleu $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bleu $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bge $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bge $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bge $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bge $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bgeu $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgeu $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgeu $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgeu $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bgt $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgt $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgt $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgt $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  bgtu $7, $8, local_label
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgtu $7, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgtu $0, $8, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
  bgtu $0, $0, local_label
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  ulhu $5, 0
# CHECK: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions

  add $4, $5, $6
# CHECK-NOT: [[@LINE-1]]:3: warning: macro instruction expanded into multiple instructions
