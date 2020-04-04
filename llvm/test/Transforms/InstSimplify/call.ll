; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instsimplify -S | FileCheck %s
; RUN: opt < %s -passes=instsimplify -S | FileCheck %s

declare {i8, i1} @llvm.uadd.with.overflow.i8(i8 %a, i8 %b)
declare {i8, i1} @llvm.sadd.with.overflow.i8(i8 %a, i8 %b)
declare {i8, i1} @llvm.usub.with.overflow.i8(i8 %a, i8 %b)
declare {i8, i1} @llvm.ssub.with.overflow.i8(i8 %a, i8 %b)
declare {i8, i1} @llvm.umul.with.overflow.i8(i8 %a, i8 %b)
declare {i8, i1} @llvm.smul.with.overflow.i8(i8 %a, i8 %b)

define i1 @test_uadd1() {
; CHECK-LABEL: @test_uadd1(
; CHECK-NEXT:    ret i1 true
;
  %x = call {i8, i1} @llvm.uadd.with.overflow.i8(i8 254, i8 3)
  %overflow = extractvalue {i8, i1} %x, 1
  ret i1 %overflow
}

define i8 @test_uadd2() {
; CHECK-LABEL: @test_uadd2(
; CHECK-NEXT:    ret i8 42
;
  %x = call {i8, i1} @llvm.uadd.with.overflow.i8(i8 254, i8 44)
  %result = extractvalue {i8, i1} %x, 0
  ret i8 %result
}

define {i8, i1} @test_uadd3(i8 %v) {
; CHECK-LABEL: @test_uadd3(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %result = call {i8, i1} @llvm.uadd.with.overflow.i8(i8 %v, i8 undef)
  ret {i8, i1} %result
}

define {i8, i1} @test_uadd4(i8 %v) {
; CHECK-LABEL: @test_uadd4(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %result = call {i8, i1} @llvm.uadd.with.overflow.i8(i8 undef, i8 %v)
  ret {i8, i1} %result
}

define i1 @test_sadd1() {
; CHECK-LABEL: @test_sadd1(
; CHECK-NEXT:    ret i1 true
;
  %x = call {i8, i1} @llvm.sadd.with.overflow.i8(i8 126, i8 3)
  %overflow = extractvalue {i8, i1} %x, 1
  ret i1 %overflow
}

define i8 @test_sadd2() {
; CHECK-LABEL: @test_sadd2(
; CHECK-NEXT:    ret i8 -86
;
  %x = call {i8, i1} @llvm.sadd.with.overflow.i8(i8 126, i8 44)
  %result = extractvalue {i8, i1} %x, 0
  ret i8 %result
}

define {i8, i1} @test_sadd3(i8 %v) {
; CHECK-LABEL: @test_sadd3(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %result = call {i8, i1} @llvm.sadd.with.overflow.i8(i8 %v, i8 undef)
  ret {i8, i1} %result
}

define {i8, i1} @test_sadd4(i8 %v) {
; CHECK-LABEL: @test_sadd4(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %result = call {i8, i1} @llvm.sadd.with.overflow.i8(i8 undef, i8 %v)
  ret {i8, i1} %result
}

define {i8, i1} @test_usub1(i8 %V) {
; CHECK-LABEL: @test_usub1(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.usub.with.overflow.i8(i8 %V, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_usub2(i8 %V) {
; CHECK-LABEL: @test_usub2(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %x = call {i8, i1} @llvm.usub.with.overflow.i8(i8 %V, i8 undef)
  ret {i8, i1} %x
}

define {i8, i1} @test_usub3(i8 %V) {
; CHECK-LABEL: @test_usub3(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %x = call {i8, i1} @llvm.usub.with.overflow.i8(i8 undef, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_ssub1(i8 %V) {
; CHECK-LABEL: @test_ssub1(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.ssub.with.overflow.i8(i8 %V, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_ssub2(i8 %V) {
; CHECK-LABEL: @test_ssub2(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %x = call {i8, i1} @llvm.ssub.with.overflow.i8(i8 %V, i8 undef)
  ret {i8, i1} %x
}

define {i8, i1} @test_ssub3(i8 %V) {
; CHECK-LABEL: @test_ssub3(
; CHECK-NEXT:    ret { i8, i1 } { i8 undef, i1 false }
;
  %x = call {i8, i1} @llvm.ssub.with.overflow.i8(i8 undef, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_umul1(i8 %V) {
; CHECK-LABEL: @test_umul1(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.umul.with.overflow.i8(i8 %V, i8 0)
  ret {i8, i1} %x
}

define {i8, i1} @test_umul2(i8 %V) {
; CHECK-LABEL: @test_umul2(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.umul.with.overflow.i8(i8 %V, i8 undef)
  ret {i8, i1} %x
}

define {i8, i1} @test_umul3(i8 %V) {
; CHECK-LABEL: @test_umul3(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.umul.with.overflow.i8(i8 0, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_umul4(i8 %V) {
; CHECK-LABEL: @test_umul4(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.umul.with.overflow.i8(i8 undef, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_smul1(i8 %V) {
; CHECK-LABEL: @test_smul1(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.smul.with.overflow.i8(i8 %V, i8 0)
  ret {i8, i1} %x
}

define {i8, i1} @test_smul2(i8 %V) {
; CHECK-LABEL: @test_smul2(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.smul.with.overflow.i8(i8 %V, i8 undef)
  ret {i8, i1} %x
}

define {i8, i1} @test_smul3(i8 %V) {
; CHECK-LABEL: @test_smul3(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.smul.with.overflow.i8(i8 0, i8 %V)
  ret {i8, i1} %x
}

define {i8, i1} @test_smul4(i8 %V) {
; CHECK-LABEL: @test_smul4(
; CHECK-NEXT:    ret { i8, i1 } zeroinitializer
;
  %x = call {i8, i1} @llvm.smul.with.overflow.i8(i8 undef, i8 %V)
  ret {i8, i1} %x
}

; Test a non-intrinsic that we know about as a library call.
declare float @fabs(float %x)

define float @test_fabs_libcall() {
; CHECK-LABEL: @test_fabs_libcall(
; CHECK-NEXT:    [[X:%.*]] = call float @fabs(float -4.200000e+01)
; CHECK-NEXT:    ret float 4.200000e+01
;

  %x = call float @fabs(float -42.0)
; This is still a real function call, so instsimplify won't nuke it -- other
; passes have to do that.

  ret float %x
}


declare float @llvm.fabs.f32(float) nounwind readnone
declare float @llvm.floor.f32(float) nounwind readnone
declare float @llvm.ceil.f32(float) nounwind readnone
declare float @llvm.trunc.f32(float) nounwind readnone
declare float @llvm.rint.f32(float) nounwind readnone
declare float @llvm.nearbyint.f32(float) nounwind readnone
declare float @llvm.canonicalize.f32(float) nounwind readnone

; Test idempotent intrinsics
define float @test_idempotence(float %a) {
; CHECK-LABEL: @test_idempotence(
; CHECK-NEXT:    [[A0:%.*]] = call float @llvm.fabs.f32(float [[A:%.*]])
; CHECK-NEXT:    [[B0:%.*]] = call float @llvm.floor.f32(float [[A]])
; CHECK-NEXT:    [[C0:%.*]] = call float @llvm.ceil.f32(float [[A]])
; CHECK-NEXT:    [[D0:%.*]] = call float @llvm.trunc.f32(float [[A]])
; CHECK-NEXT:    [[E0:%.*]] = call float @llvm.rint.f32(float [[A]])
; CHECK-NEXT:    [[F0:%.*]] = call float @llvm.nearbyint.f32(float [[A]])
; CHECK-NEXT:    [[G0:%.*]] = call float @llvm.canonicalize.f32(float [[A]])
; CHECK-NEXT:    [[R0:%.*]] = fadd float [[A0]], [[B0]]
; CHECK-NEXT:    [[R1:%.*]] = fadd float [[R0]], [[C0]]
; CHECK-NEXT:    [[R2:%.*]] = fadd float [[R1]], [[D0]]
; CHECK-NEXT:    [[R3:%.*]] = fadd float [[R2]], [[E0]]
; CHECK-NEXT:    [[R4:%.*]] = fadd float [[R3]], [[F0]]
; CHECK-NEXT:    [[R5:%.*]] = fadd float [[R4]], [[G0]]
; CHECK-NEXT:    ret float [[R5]]
;

  %a0 = call float @llvm.fabs.f32(float %a)
  %a1 = call float @llvm.fabs.f32(float %a0)

  %b0 = call float @llvm.floor.f32(float %a)
  %b1 = call float @llvm.floor.f32(float %b0)

  %c0 = call float @llvm.ceil.f32(float %a)
  %c1 = call float @llvm.ceil.f32(float %c0)

  %d0 = call float @llvm.trunc.f32(float %a)
  %d1 = call float @llvm.trunc.f32(float %d0)

  %e0 = call float @llvm.rint.f32(float %a)
  %e1 = call float @llvm.rint.f32(float %e0)

  %f0 = call float @llvm.nearbyint.f32(float %a)
  %f1 = call float @llvm.nearbyint.f32(float %f0)

  %g0 = call float @llvm.canonicalize.f32(float %a)
  %g1 = call float @llvm.canonicalize.f32(float %g0)

  %r0 = fadd float %a1, %b1
  %r1 = fadd float %r0, %c1
  %r2 = fadd float %r1, %d1
  %r3 = fadd float %r2, %e1
  %r4 = fadd float %r3, %f1
  %r5 = fadd float %r4, %g1

  ret float %r5
}

define i8* @operator_new() {
; CHECK-LABEL: @operator_new(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CALL:%.*]] = tail call noalias i8* @_Znwm(i64 8)
; CHECK-NEXT:    br i1 false, label [[CAST_END:%.*]], label [[CAST_NOTNULL:%.*]]
; CHECK:       cast.notnull:
; CHECK-NEXT:    [[ADD_PTR:%.*]] = getelementptr inbounds i8, i8* [[CALL]], i64 4
; CHECK-NEXT:    br label [[CAST_END]]
; CHECK:       cast.end:
; CHECK-NEXT:    [[CAST_RESULT:%.*]] = phi i8* [ [[ADD_PTR]], [[CAST_NOTNULL]] ], [ null, [[ENTRY:%.*]] ]
; CHECK-NEXT:    ret i8* [[CAST_RESULT]]
;
entry:
  %call = tail call noalias i8* @_Znwm(i64 8)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %cast.end, label %cast.notnull

cast.notnull:                                     ; preds = %entry
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 4
  br label %cast.end

cast.end:                                         ; preds = %cast.notnull, %entry
  %cast.result = phi i8* [ %add.ptr, %cast.notnull ], [ null, %entry ]
  ret i8* %cast.result

}

declare nonnull noalias i8* @_Znwm(i64)

%"struct.std::nothrow_t" = type { i8 }
@_ZSt7nothrow = external global %"struct.std::nothrow_t"

define i8* @operator_new_nothrow_t() {
; CHECK-LABEL: @operator_new_nothrow_t(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CALL:%.*]] = tail call noalias i8* @_ZnamRKSt9nothrow_t(i64 8, %"struct.std::nothrow_t"* @_ZSt7nothrow)
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i8* [[CALL]], null
; CHECK-NEXT:    br i1 [[CMP]], label [[CAST_END:%.*]], label [[CAST_NOTNULL:%.*]]
; CHECK:       cast.notnull:
; CHECK-NEXT:    [[ADD_PTR:%.*]] = getelementptr inbounds i8, i8* [[CALL]], i64 4
; CHECK-NEXT:    br label [[CAST_END]]
; CHECK:       cast.end:
; CHECK-NEXT:    [[CAST_RESULT:%.*]] = phi i8* [ [[ADD_PTR]], [[CAST_NOTNULL]] ], [ null, [[ENTRY:%.*]] ]
; CHECK-NEXT:    ret i8* [[CAST_RESULT]]
;
entry:
  %call = tail call noalias i8* @_ZnamRKSt9nothrow_t(i64 8, %"struct.std::nothrow_t"* @_ZSt7nothrow)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %cast.end, label %cast.notnull

cast.notnull:                                     ; preds = %entry
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 4
  br label %cast.end

cast.end:                                         ; preds = %cast.notnull, %entry
  %cast.result = phi i8* [ %add.ptr, %cast.notnull ], [ null, %entry ]
  ret i8* %cast.result

}

declare i8* @_ZnamRKSt9nothrow_t(i64, %"struct.std::nothrow_t"*) nounwind

define i8* @malloc_can_return_null() {
; CHECK-LABEL: @malloc_can_return_null(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CALL:%.*]] = tail call noalias i8* @malloc(i64 8)
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i8* [[CALL]], null
; CHECK-NEXT:    br i1 [[CMP]], label [[CAST_END:%.*]], label [[CAST_NOTNULL:%.*]]
; CHECK:       cast.notnull:
; CHECK-NEXT:    [[ADD_PTR:%.*]] = getelementptr inbounds i8, i8* [[CALL]], i64 4
; CHECK-NEXT:    br label [[CAST_END]]
; CHECK:       cast.end:
; CHECK-NEXT:    [[CAST_RESULT:%.*]] = phi i8* [ [[ADD_PTR]], [[CAST_NOTNULL]] ], [ null, [[ENTRY:%.*]] ]
; CHECK-NEXT:    ret i8* [[CAST_RESULT]]
;
entry:
  %call = tail call noalias i8* @malloc(i64 8)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %cast.end, label %cast.notnull

cast.notnull:                                     ; preds = %entry
  %add.ptr = getelementptr inbounds i8, i8* %call, i64 4
  br label %cast.end

cast.end:                                         ; preds = %cast.notnull, %entry
  %cast.result = phi i8* [ %add.ptr, %cast.notnull ], [ null, %entry ]
  ret i8* %cast.result

}

define i32 @call_null() {
; CHECK-LABEL: @call_null(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 null()
; CHECK-NEXT:    ret i32 undef
;
entry:
  %call = call i32 null()
  ret i32 %call
}

define i32 @call_undef() {
; CHECK-LABEL: @call_undef(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CALL:%.*]] = call i32 undef()
; CHECK-NEXT:    ret i32 undef
;
entry:
  %call = call i32 undef()
  ret i32 %call
}

@GV = private constant [8 x i32] [i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49]

define <8 x i32> @partial_masked_load() {
; CHECK-LABEL: @partial_masked_load(
; CHECK-NEXT:    ret <8 x i32> <i32 undef, i32 undef, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
;
  %masked.load = call <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>* bitcast (i32* getelementptr ([8 x i32], [8 x i32]* @GV, i64 0, i64 -2) to <8 x i32>*), i32 4, <8 x i1> <i1 false, i1 false, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> undef)
  ret <8 x i32> %masked.load
}

define <8 x i32> @masked_load_undef_mask(<8 x i32>* %V) {
; CHECK-LABEL: @masked_load_undef_mask(
; CHECK-NEXT:    ret <8 x i32> <i32 1, i32 0, i32 1, i32 0, i32 1, i32 0, i32 1, i32 0>
;
  %masked.load = call <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>* %V, i32 4, <8 x i1> undef, <8 x i32> <i32 1, i32 0, i32 1, i32 0, i32 1, i32 0, i32 1, i32 0>)
  ret <8 x i32> %masked.load
}

declare noalias i8* @malloc(i64)

declare <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>*, i32, <8 x i1>, <8 x i32>)

declare double @llvm.powi.f64(double, i32)
declare <2 x double> @llvm.powi.v2f64(<2 x double>, i32)

define double @constant_fold_powi() {
; CHECK-LABEL: @constant_fold_powi(
; CHECK-NEXT:    ret double 9.000000e+00
;
  %t0 = call double @llvm.powi.f64(double 3.00000e+00, i32 2)
  ret double %t0
}

define <2 x double> @constant_fold_powi_vec() {
; CHECK-LABEL: @constant_fold_powi_vec(
; CHECK-NEXT:    ret <2 x double> <double 9.000000e+00, double 2.500000e+01>
;
  %t0 = call <2 x double> @llvm.powi.v2f64(<2 x double> <double 3.00000e+00, double 5.00000e+00>, i32 2)
  ret <2 x double> %t0
}

declare i8 @llvm.fshl.i8(i8, i8, i8)
declare i9 @llvm.fshr.i9(i9, i9, i9)
declare <2 x i7> @llvm.fshl.v2i7(<2 x i7>, <2 x i7>, <2 x i7>)
declare <2 x i8> @llvm.fshr.v2i8(<2 x i8>, <2 x i8>, <2 x i8>)

define i8 @fshl_no_shift(i8 %x, i8 %y) {
; CHECK-LABEL: @fshl_no_shift(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %z = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 0)
  ret i8 %z
}

define i9 @fshr_no_shift(i9 %x, i9 %y) {
; CHECK-LABEL: @fshr_no_shift(
; CHECK-NEXT:    ret i9 [[Y:%.*]]
;
  %z = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 0)
  ret i9 %z
}

define i8 @fshl_no_shift_modulo_bitwidth(i8 %x, i8 %y) {
; CHECK-LABEL: @fshl_no_shift_modulo_bitwidth(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %z = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 40)
  ret i8 %z
}

define i9 @fshr_no_shift_modulo_bitwidth(i9 %x, i9 %y) {
; CHECK-LABEL: @fshr_no_shift_modulo_bitwidth(
; CHECK-NEXT:    ret i9 [[Y:%.*]]
;
  %z = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 189)
  ret i9 %z
}

define <2 x i7> @fshl_no_shift_modulo_bitwidth_splat(<2 x i7> %x, <2 x i7> %y) {
; CHECK-LABEL: @fshl_no_shift_modulo_bitwidth_splat(
; CHECK-NEXT:    ret <2 x i7> [[X:%.*]]
;
  %z = call <2 x i7> @llvm.fshl.v2i7(<2 x i7> %x, <2 x i7> %y, <2 x i7> <i7 21, i7 21>)
  ret <2 x i7> %z
}

define <2 x i8> @fshr_no_shift_modulo_bitwidth_splat(<2 x i8> %x, <2 x i8> %y) {
; CHECK-LABEL: @fshr_no_shift_modulo_bitwidth_splat(
; CHECK-NEXT:    ret <2 x i8> [[Y:%.*]]
;
  %z = call <2 x i8> @llvm.fshr.v2i8(<2 x i8> %x, <2 x i8> %y, <2 x i8> <i8 72, i8 72>)
  ret <2 x i8> %z
}

; If y is poison, eliminating the guard is not safe.

define i8 @fshl_zero_shift_guard(i8 %x, i8 %y, i8 %sh) {
; CHECK-LABEL: @fshl_zero_shift_guard(
; CHECK-NEXT:    [[C:%.*]] = icmp eq i8 [[SH:%.*]], 0
; CHECK-NEXT:    [[F:%.*]] = call i8 @llvm.fshl.i8(i8 [[X:%.*]], i8 [[Y:%.*]], i8 [[SH]])
; CHECK-NEXT:    [[S:%.*]] = select i1 [[C]], i8 [[X]], i8 [[F]]
; CHECK-NEXT:    ret i8 [[S]]
;
  %c = icmp eq i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 %sh)
  %s = select i1 %c, i8 %x, i8 %f
  ret i8 %s
}

; If y is poison, eliminating the guard is not safe.

define i8 @fshl_zero_shift_guard_swapped(i8 %x, i8 %y, i8 %sh) {
; CHECK-LABEL: @fshl_zero_shift_guard_swapped(
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[SH:%.*]], 0
; CHECK-NEXT:    [[F:%.*]] = call i8 @llvm.fshl.i8(i8 [[X:%.*]], i8 [[Y:%.*]], i8 [[SH]])
; CHECK-NEXT:    [[S:%.*]] = select i1 [[C]], i8 [[F]], i8 [[X]]
; CHECK-NEXT:    ret i8 [[S]]
;
  %c = icmp ne i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 %sh)
  %s = select i1 %c, i8 %f, i8 %x
  ret i8 %s
}

; When the shift amount is 0, fshl returns its 1st parameter (x), so everything is deleted.

define i8 @fshl_zero_shift_guard_inverted(i8 %x, i8 %y, i8 %sh) {
; CHECK-LABEL: @fshl_zero_shift_guard_inverted(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %c = icmp eq i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 %sh)
  %s = select i1 %c, i8 %f, i8 %x
  ret i8 %s
}

; When the shift amount is 0, fshl returns its 1st parameter (x), so everything is deleted.

define i8 @fshl_zero_shift_guard_inverted_swapped(i8 %x, i8 %y, i8 %sh) {
; CHECK-LABEL: @fshl_zero_shift_guard_inverted_swapped(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %c = icmp ne i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 %sh)
  %s = select i1 %c, i8 %x, i8 %f
  ret i8 %s
}

; If x is poison, eliminating the guard is not safe.

define i9 @fshr_zero_shift_guard(i9 %x, i9 %y, i9 %sh) {
; CHECK-LABEL: @fshr_zero_shift_guard(
; CHECK-NEXT:    [[C:%.*]] = icmp eq i9 [[SH:%.*]], 0
; CHECK-NEXT:    [[F:%.*]] = call i9 @llvm.fshr.i9(i9 [[X:%.*]], i9 [[Y:%.*]], i9 [[SH]])
; CHECK-NEXT:    [[S:%.*]] = select i1 [[C]], i9 [[Y]], i9 [[F]]
; CHECK-NEXT:    ret i9 [[S]]
;
  %c = icmp eq i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 %sh)
  %s = select i1 %c, i9 %y, i9 %f
  ret i9 %s
}

; If x is poison, eliminating the guard is not safe.

define i9 @fshr_zero_shift_guard_swapped(i9 %x, i9 %y, i9 %sh) {
; CHECK-LABEL: @fshr_zero_shift_guard_swapped(
; CHECK-NEXT:    [[C:%.*]] = icmp ne i9 [[SH:%.*]], 0
; CHECK-NEXT:    [[F:%.*]] = call i9 @llvm.fshr.i9(i9 [[X:%.*]], i9 [[Y:%.*]], i9 [[SH]])
; CHECK-NEXT:    [[S:%.*]] = select i1 [[C]], i9 [[F]], i9 [[Y]]
; CHECK-NEXT:    ret i9 [[S]]
;
  %c = icmp ne i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 %sh)
  %s = select i1 %c, i9 %f, i9 %y
  ret i9 %s
}

; When the shift amount is 0, fshr returns its 2nd parameter (y), so everything is deleted.

define i9 @fshr_zero_shift_guard_inverted(i9 %x, i9 %y, i9 %sh) {
; CHECK-LABEL: @fshr_zero_shift_guard_inverted(
; CHECK-NEXT:    ret i9 [[Y:%.*]]
;
  %c = icmp eq i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 %sh)
  %s = select i1 %c, i9 %f, i9 %y
  ret i9 %s
}

; When the shift amount is 0, fshr returns its 2nd parameter (y), so everything is deleted.

define i9 @fshr_zero_shift_guard_inverted_swapped(i9 %x, i9 %y, i9 %sh) {
; CHECK-LABEL: @fshr_zero_shift_guard_inverted_swapped(
; CHECK-NEXT:    ret i9 [[Y:%.*]]
;
  %c = icmp ne i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 %sh)
  %s = select i1 %c, i9 %y, i9 %f
  ret i9 %s
}

; When the shift amount is 0, fshl returns its 1st parameter (x), so the guard is not needed.

define i8 @rotl_zero_shift_guard(i8 %x, i8 %sh) {
; CHECK-LABEL: @rotl_zero_shift_guard(
; CHECK-NEXT:    [[F:%.*]] = call i8 @llvm.fshl.i8(i8 [[X:%.*]], i8 [[X]], i8 [[SH:%.*]])
; CHECK-NEXT:    ret i8 [[F]]
;
  %c = icmp eq i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %x, i8 %sh)
  %s = select i1 %c, i8 %x, i8 %f
  ret i8 %s
}

; When the shift amount is 0, fshl returns its 1st parameter (x), so the guard is not needed.

define i8 @rotl_zero_shift_guard_swapped(i8 %x, i8 %sh) {
; CHECK-LABEL: @rotl_zero_shift_guard_swapped(
; CHECK-NEXT:    [[F:%.*]] = call i8 @llvm.fshl.i8(i8 [[X:%.*]], i8 [[X]], i8 [[SH:%.*]])
; CHECK-NEXT:    ret i8 [[F]]
;
  %c = icmp ne i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %x, i8 %sh)
  %s = select i1 %c, i8 %f, i8 %x
  ret i8 %s
}

; When the shift amount is 0, fshl returns its 1st parameter (x), so everything is deleted.

define i8 @rotl_zero_shift_guard_inverted(i8 %x, i8 %sh) {
; CHECK-LABEL: @rotl_zero_shift_guard_inverted(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %c = icmp eq i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %x, i8 %sh)
  %s = select i1 %c, i8 %f, i8 %x
  ret i8 %s
}

; When the shift amount is 0, fshl returns its 1st parameter (x), so everything is deleted.

define i8 @rotl_zero_shift_guard_inverted_swapped(i8 %x, i8 %sh) {
; CHECK-LABEL: @rotl_zero_shift_guard_inverted_swapped(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %c = icmp ne i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %x, i8 %sh)
  %s = select i1 %c, i8 %x, i8 %f
  ret i8 %s
}

; When the shift amount is 0, fshr returns its 2nd parameter (x), so the guard is not needed.

define i9 @rotr_zero_shift_guard(i9 %x, i9 %sh) {
; CHECK-LABEL: @rotr_zero_shift_guard(
; CHECK-NEXT:    [[F:%.*]] = call i9 @llvm.fshr.i9(i9 [[X:%.*]], i9 [[X]], i9 [[SH:%.*]])
; CHECK-NEXT:    ret i9 [[F]]
;
  %c = icmp eq i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %x, i9 %sh)
  %s = select i1 %c, i9 %x, i9 %f
  ret i9 %s
}

; When the shift amount is 0, fshr returns its 2nd parameter (x), so the guard is not needed.

define i9 @rotr_zero_shift_guard_swapped(i9 %x, i9 %sh) {
; CHECK-LABEL: @rotr_zero_shift_guard_swapped(
; CHECK-NEXT:    [[F:%.*]] = call i9 @llvm.fshr.i9(i9 [[X:%.*]], i9 [[X]], i9 [[SH:%.*]])
; CHECK-NEXT:    ret i9 [[F]]
;
  %c = icmp ne i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %x, i9 %sh)
  %s = select i1 %c, i9 %f, i9 %x
  ret i9 %s
}

; When the shift amount is 0, fshr returns its 2nd parameter (x), so everything is deleted.

define i9 @rotr_zero_shift_guard_inverted(i9 %x, i9 %sh) {
; CHECK-LABEL: @rotr_zero_shift_guard_inverted(
; CHECK-NEXT:    ret i9 [[X:%.*]]
;
  %c = icmp eq i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %x, i9 %sh)
  %s = select i1 %c, i9 %f, i9 %x
  ret i9 %s
}

; When the shift amount is 0, fshr returns its 2nd parameter (x), so everything is deleted.

define i9 @rotr_zero_shift_guard_inverted_swapped(i9 %x, i9 %sh) {
; CHECK-LABEL: @rotr_zero_shift_guard_inverted_swapped(
; CHECK-NEXT:    ret i9 [[X:%.*]]
;
  %c = icmp ne i9 %sh, 0
  %f = call i9 @llvm.fshr.i9(i9 %x, i9 %x, i9 %sh)
  %s = select i1 %c, i9 %x, i9 %f
  ret i9 %s
}

; Negative test - make sure we're matching the correct parameter of fshl.

define i8 @fshl_zero_shift_guard_wrong_select_op(i8 %x, i8 %y, i8 %sh) {
; CHECK-LABEL: @fshl_zero_shift_guard_wrong_select_op(
; CHECK-NEXT:    [[C:%.*]] = icmp eq i8 [[SH:%.*]], 0
; CHECK-NEXT:    [[F:%.*]] = call i8 @llvm.fshl.i8(i8 [[X:%.*]], i8 [[Y:%.*]], i8 [[SH]])
; CHECK-NEXT:    [[S:%.*]] = select i1 [[C]], i8 [[Y]], i8 [[F]]
; CHECK-NEXT:    ret i8 [[S]]
;
  %c = icmp eq i8 %sh, 0
  %f = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 %sh)
  %s = select i1 %c, i8 %y, i8 %f
  ret i8 %s
}

; Vector types work too.

define <2 x i8> @rotr_zero_shift_guard_splat(<2 x i8> %x, <2 x i8> %sh) {
; CHECK-LABEL: @rotr_zero_shift_guard_splat(
; CHECK-NEXT:    [[F:%.*]] = call <2 x i8> @llvm.fshr.v2i8(<2 x i8> [[X:%.*]], <2 x i8> [[X]], <2 x i8> [[SH:%.*]])
; CHECK-NEXT:    ret <2 x i8> [[F]]
;
  %c = icmp eq <2 x i8> %sh, zeroinitializer
  %f = call <2 x i8> @llvm.fshr.v2i8(<2 x i8> %x, <2 x i8> %x, <2 x i8> %sh)
  %s = select <2 x i1> %c, <2 x i8> %x, <2 x i8> %f
  ret <2 x i8> %s
}

; If first two operands of funnel shift are undef, the result is undef

define i8 @fshl_ops_undef(i8 %shamt) {
; CHECK-LABEL: @fshl_ops_undef(
; CHECK-NEXT:    ret i8 undef
;
  %r = call i8 @llvm.fshl.i8(i8 undef, i8 undef, i8 %shamt)
  ret i8 %r
}

define i9 @fshr_ops_undef(i9 %shamt) {
; CHECK-LABEL: @fshr_ops_undef(
; CHECK-NEXT:    ret i9 undef
;
  %r = call i9 @llvm.fshr.i9(i9 undef, i9 undef, i9 %shamt)
  ret i9 %r
}

; If shift amount is undef, treat it as zero, returning operand 0 or 1

define i8 @fshl_shift_undef(i8 %x, i8 %y) {
; CHECK-LABEL: @fshl_shift_undef(
; CHECK-NEXT:    ret i8 [[X:%.*]]
;
  %r = call i8 @llvm.fshl.i8(i8 %x, i8 %y, i8 undef)
  ret i8 %r
}

define i9 @fshr_shift_undef(i9 %x, i9 %y) {
; CHECK-LABEL: @fshr_shift_undef(
; CHECK-NEXT:    ret i9 [[Y:%.*]]
;
  %r = call i9 @llvm.fshr.i9(i9 %x, i9 %y, i9 undef)
  ret i9 %r
}

declare double @llvm.fma.f64(double,double,double)
declare double @llvm.fmuladd.f64(double,double,double)

define double @fma_undef_op0(double %x, double %y) {
; CHECK-LABEL: @fma_undef_op0(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fma.f64(double undef, double %x, double %y)
  ret double %r
}

define double @fma_undef_op1(double %x, double %y) {
; CHECK-LABEL: @fma_undef_op1(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fma.f64(double %x, double undef, double %y)
  ret double %r
}

define double @fma_undef_op2(double %x, double %y) {
; CHECK-LABEL: @fma_undef_op2(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fma.f64(double %x, double %y, double undef)
  ret double %r
}

define double @fmuladd_undef_op0(double %x, double %y) {
; CHECK-LABEL: @fmuladd_undef_op0(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fmuladd.f64(double undef, double %x, double %y)
  ret double %r
}

define double @fmuladd_undef_op1(double %x, double %y) {
; CHECK-LABEL: @fmuladd_undef_op1(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fmuladd.f64(double %x, double undef, double %y)
  ret double %r
}

define double @fmuladd_undef_op2(double %x, double %y) {
; CHECK-LABEL: @fmuladd_undef_op2(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fmuladd.f64(double %x, double %y, double undef)
  ret double %r
}

define double @fma_nan_op0(double %x, double %y) {
; CHECK-LABEL: @fma_nan_op0(
; CHECK-NEXT:    ret double 0x7FF8000000000000
;
  %r = call double @llvm.fma.f64(double 0x7ff8000000000000, double %x, double %y)
  ret double %r
}

define double @fma_nan_op1(double %x, double %y) {
; CHECK-LABEL: @fma_nan_op1(
; CHECK-NEXT:    ret double 0x7FF8000000000001
;
  %r = call double @llvm.fma.f64(double %x, double 0x7ff8000000000001, double %y)
  ret double %r
}

define double @fma_nan_op2(double %x, double %y) {
; CHECK-LABEL: @fma_nan_op2(
; CHECK-NEXT:    ret double 0x7FF8000000000002
;
  %r = call double @llvm.fma.f64(double %x, double %y, double 0x7ff8000000000002)
  ret double %r
}

define double @fmuladd_nan_op0_op1(double %x) {
; CHECK-LABEL: @fmuladd_nan_op0_op1(
; CHECK-NEXT:    ret double 0x7FF8000000001234
;
  %r = call double @llvm.fmuladd.f64(double 0x7ff8000000001234, double 0x7ff800000000dead, double %x)
  ret double %r
}

define double @fmuladd_nan_op0_op2(double %x) {
; CHECK-LABEL: @fmuladd_nan_op0_op2(
; CHECK-NEXT:    ret double 0x7FF8000000005678
;
  %r = call double @llvm.fmuladd.f64(double 0x7ff8000000005678, double %x, double 0x7ff800000000dead)
  ret double %r
}

define double @fmuladd_nan_op1_op2(double %x) {
; CHECK-LABEL: @fmuladd_nan_op1_op2(
; CHECK-NEXT:    ret double 0x7FF80000AAAAAAAA
;
  %r = call double @llvm.fmuladd.f64(double %x, double 0x7ff80000aaaaaaaa, double 0x7ff800000000dead)
  ret double %r
}

define double @fma_nan_multiplicand_inf_zero(double %x) {
; CHECK-LABEL: @fma_nan_multiplicand_inf_zero(
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fma.f64(double 0x7FF0000000000000, double 0.000000e+00, double [[X:%.*]])
; CHECK-NEXT:    ret double [[R]]
;
  %r = call double @llvm.fma.f64(double 0x7ff0000000000000, double 0.0, double %x)
  ret double %r
}

define double @fma_nan_multiplicand_zero_inf(double %x) {
; CHECK-LABEL: @fma_nan_multiplicand_zero_inf(
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fma.f64(double 0.000000e+00, double 0x7FF0000000000000, double [[X:%.*]])
; CHECK-NEXT:    ret double [[R]]
;
  %r = call double @llvm.fma.f64(double 0.0, double 0x7ff0000000000000, double %x)
  ret double %r
}

define double @fma_nan_addend_inf_neginf(double %x, i32 %y) {
; CHECK-LABEL: @fma_nan_addend_inf_neginf(
; CHECK-NEXT:    [[NOTNAN:%.*]] = uitofp i32 [[Y:%.*]] to double
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fma.f64(double 0x7FF0000000000000, double [[NOTNAN]], double 0xFFF0000000000000)
; CHECK-NEXT:    ret double [[R]]
;
  %notnan = uitofp i32 %y to double
  %r = call double @llvm.fma.f64(double 0x7ff0000000000000, double %notnan, double 0xfff0000000000000)
  ret double %r
}

define double @fma_nan_addend_neginf_inf(double %x, i1 %y) {
; CHECK-LABEL: @fma_nan_addend_neginf_inf(
; CHECK-NEXT:    [[NOTNAN:%.*]] = select i1 [[Y:%.*]], double 4.200000e+01, double -1.000000e-01
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fma.f64(double [[NOTNAN]], double 0xFFF0000000000000, double 0x7FF0000000000000)
; CHECK-NEXT:    ret double [[R]]
;
  %notnan = select i1 %y, double 42.0, double -0.1
  %r = call double @llvm.fma.f64(double %notnan, double 0xfff0000000000000, double 0x7ff0000000000000)
  ret double %r
}

define double @fmuladd_nan_multiplicand_neginf_zero(double %x) {
; CHECK-LABEL: @fmuladd_nan_multiplicand_neginf_zero(
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fmuladd.f64(double 0xFFF0000000000000, double 0.000000e+00, double [[X:%.*]])
; CHECK-NEXT:    ret double [[R]]
;
  %r = call double @llvm.fmuladd.f64(double 0xfff0000000000000, double 0.0, double %x)
  ret double %r
}

define double @fmuladd_nan_multiplicand_negzero_inf(double %x) {
; CHECK-LABEL: @fmuladd_nan_multiplicand_negzero_inf(
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fmuladd.f64(double -0.000000e+00, double 0x7FF0000000000000, double [[X:%.*]])
; CHECK-NEXT:    ret double [[R]]
;
  %r = call double @llvm.fmuladd.f64(double -0.0, double 0x7ff0000000000000, double %x)
  ret double %r
}

define double @fmuladd_nan_addend_inf_neginf(double %x, i32 %y) {
; CHECK-LABEL: @fmuladd_nan_addend_inf_neginf(
; CHECK-NEXT:    [[NOTNAN:%.*]] = sitofp i32 [[Y:%.*]] to double
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fmuladd.f64(double 0x7FF0000000000000, double [[NOTNAN]], double 0xFFF0000000000000)
; CHECK-NEXT:    ret double [[R]]
;
  %notnan = sitofp i32 %y to double
  %r = call double @llvm.fmuladd.f64(double 0x7ff0000000000000, double %notnan, double 0xfff0000000000000)
  ret double %r
}

define double @fmuladd_nan_addend_neginf_inf(double %x, i1 %y) {
; CHECK-LABEL: @fmuladd_nan_addend_neginf_inf(
; CHECK-NEXT:    [[NOTNAN:%.*]] = select i1 [[Y:%.*]], double 4.200000e+01, double -1.000000e-01
; CHECK-NEXT:    [[R:%.*]] = call double @llvm.fmuladd.f64(double [[NOTNAN]], double 0xFFF0000000000000, double 0x7FF0000000000000)
; CHECK-NEXT:    ret double [[R]]
;
  %notnan = select i1 %y, double 42.0, double -0.1
  %r = call double @llvm.fmuladd.f64(double %notnan, double 0xfff0000000000000, double 0x7ff0000000000000)
  ret double %r
}

declare float @llvm.copysign.f32(float, float)
declare <2 x double> @llvm.copysign.v2f64(<2 x double>, <2 x double>)

define float @copysign_same_operand(float %x) {
; CHECK-LABEL: @copysign_same_operand(
; CHECK-NEXT:    ret float [[X:%.*]]
;
  %r = call float @llvm.copysign.f32(float %x, float %x)
  ret float %r
}

define <2 x double> @copysign_same_operand_vec(<2 x double> %x) {
; CHECK-LABEL: @copysign_same_operand_vec(
; CHECK-NEXT:    ret <2 x double> [[X:%.*]]
;
  %r = call <2 x double> @llvm.copysign.v2f64(<2 x double> %x, <2 x double> %x)
  ret <2 x double> %r
}

define float @negated_sign_arg(float %x) {
; CHECK-LABEL: @negated_sign_arg(
; CHECK-NEXT:    [[NEGX:%.*]] = fsub ninf float -0.000000e+00, [[X:%.*]]
; CHECK-NEXT:    ret float [[NEGX]]
;
  %negx = fsub ninf float -0.0, %x
  %r = call arcp float @llvm.copysign.f32(float %x, float %negx)
  ret float %r
}

define <2 x double> @negated_sign_arg_vec(<2 x double> %x) {
; CHECK-LABEL: @negated_sign_arg_vec(
; CHECK-NEXT:    [[NEGX:%.*]] = fneg afn <2 x double> [[X:%.*]]
; CHECK-NEXT:    ret <2 x double> [[NEGX]]
;
  %negx = fneg afn <2 x double> %x
  %r = call arcp <2 x double> @llvm.copysign.v2f64(<2 x double> %x, <2 x double> %negx)
  ret <2 x double> %r
}

define float @negated_mag_arg(float %x) {
; CHECK-LABEL: @negated_mag_arg(
; CHECK-NEXT:    ret float [[X:%.*]]
;
  %negx = fneg nnan float %x
  %r = call ninf float @llvm.copysign.f32(float %negx, float %x)
  ret float %r
}

define <2 x double> @negated_mag_arg_vec(<2 x double> %x) {
; CHECK-LABEL: @negated_mag_arg_vec(
; CHECK-NEXT:    ret <2 x double> [[X:%.*]]
;
  %negx = fneg afn <2 x double> %x
  %r = call arcp <2 x double> @llvm.copysign.v2f64(<2 x double> %negx, <2 x double> %x)
  ret <2 x double> %r
}
