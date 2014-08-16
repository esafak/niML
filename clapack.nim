#_____________________________________________________________________________
#
# Manually patched after conversion from clapack.h 3.2.1 by c2nim 0.9.4
#
# Emre Safak (c) 2014
#
# Please refer to the source www.netlib.org/clapack/clapack.h when hunting bugs
# Users are also highly encouraged to read http://www.netlib.org/clapack/readme
# Doing so will teach you, for example, that since LAPACK is a Fortran library, 
# it column-major order rather than C's row-major order, and therefore that all
# matrices need to be transposed before being passed to any routine here.
#_____________________________________________________________________________

{.warning[SmallLshouldNotBeUsed]: off.}

when not defined(CLAPACK_H):
  const CLAPACK_H* = true
  type 
    integer* = clong
    address* = cstring
    shortint* = cshort
    real* = cfloat
    doublereal* = cdouble
    complex* = object 
      r*: real
      i*: real

    doublecomplex* = object 
      r*: doublereal
      i*: doublereal

    logical* = clong
    shortlogical* = cshort
    logical1* = char
    integer1* = char
    ftnlen* = cshort
    L_fp* = ref proc() : logical
    FArray* {.unchecked.} [T] = array[0..1, T]
    PArray*[T] = ref FArray[T] 

  {.push nodecl.}  

  #___________________________________________________________________________
  #
  # Complex, single precision
  #___________________________________________________________________________

  proc clapack_caxpy*(n: var integer; ca: ptr complex; cx: ptr complex;               incx: var integer; cy: ptr complex; incy: var integer): cint {.importc: "caxpy_".}
  
  proc clapack_ccopy*(n: var integer; cx: ptr complex; incx: var integer;               cy: ptr complex; incy: var integer): cint {.importc: "ccopy_".}
  
  proc clapack_cdotc*(ret_val: ptr complex; n: var integer; cx: ptr complex;               incx: var integer; cy: ptr complex; incy: var integer): void {.importc: "cdotc_".}
  
  proc clapack_cdotu*(ret_val: ptr complex; n: var integer; cx: ptr complex;               incx: var integer; cy: ptr complex; incy: var integer): void {.importc: "cdotu_".}
  
  proc clapack_cgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;               ku: var integer; alpha: ptr complex; a: ptr complex;               lda: var integer; x: ptr complex; incx: var integer;               beta: ptr complex; y: ptr complex; incy: var integer): cint {.importc: "cgbmv_".}
  
  proc clapack_cgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;               k: var integer; alpha: ptr complex; a: ptr complex;               lda: var integer; b: ptr complex; ldb: var integer;               beta: ptr complex; c: ptr complex; ldc: var integer): cint {.importc: "cgemm_".}
  
  proc clapack_cgemv*(trans: var cstring; m: var integer; n: var integer;               alpha: ptr complex; a: ptr complex; lda: var integer;               x: ptr complex; incx: var integer; beta: ptr complex;               y: ptr complex; incy: var integer): cint {.importc: "cgemv_".}
  
  proc clapack_cgerc*(m: var integer; n: var integer; alpha: ptr complex;               x: ptr complex; incx: var integer; y: ptr complex;               incy: var integer; a: ptr complex; lda: var integer): cint {.importc: "cgerc_".}
  
  proc clapack_cgeru*(m: var integer; n: var integer; alpha: ptr complex;               x: ptr complex; incx: var integer; y: ptr complex;               incy: var integer; a: ptr complex; lda: var integer): cint {.importc: "cgeru_".}
  
  proc clapack_chbmv*(uplo: var cstring; n: var integer; k: var integer;               alpha: ptr complex; a: ptr complex; lda: var integer;               x: ptr complex; incx: var integer; beta: ptr complex;               y: ptr complex; incy: var integer): cint {.importc: "chbmv_".}
  
  proc clapack_chemm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;               alpha: ptr complex; a: ptr complex; lda: var integer;               b: ptr complex; ldb: var integer; beta: ptr complex;               c: ptr complex; ldc: var integer): cint {.importc: "chemm_".}
  
  proc clapack_chemv*(uplo: var cstring; n: var integer; alpha: ptr complex;               a: ptr complex; lda: var integer; x: ptr complex;               incx: var integer; beta: ptr complex; y: ptr complex;               incy: var integer): cint {.importc: "chemv_".}
  
  proc clapack_cher*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr complex;              incx: var integer; a: ptr complex; lda: var integer): cint {.importc: "cher_".}
  
  proc clapack_cher2*(uplo: var cstring; n: var integer; alpha: ptr complex;               x: ptr complex; incx: var integer; y: ptr complex;               incy: var integer; a: ptr complex; lda: var integer): cint {.importc: "cher2_".}
  
  proc clapack_cher2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;                alpha: ptr complex; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; beta: ptr real;                c: ptr complex; ldc: var integer): cint {.importc: "cher2k_".}
  
  proc clapack_cherk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;               alpha: ptr real; a: ptr complex; lda: var integer;               beta: ptr real; c: ptr complex; ldc: var integer): cint {.importc: "cherk_".}
  
  proc clapack_chpmv*(uplo: var cstring; n: var integer; alpha: ptr complex;               ap: ptr complex; x: ptr complex; incx: var integer;               beta: ptr complex; y: ptr complex; incy: var integer): cint {.importc: "chpmv_".}
  
  proc clapack_chpr*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr complex;              incx: var integer; ap: ptr complex): cint {.importc: "chpr_".}
  
  proc clapack_chpr2*(uplo: var cstring; n: var integer; alpha: ptr complex;               x: ptr complex; incx: var integer; y: ptr complex;               incy: var integer; ap: ptr complex): cint {.importc: "chpr2_".}
  
  proc clapack_crotg*(ca: ptr complex; cb: ptr complex; c: ptr real; s: ptr complex): cint {.importc: "crotg_".}
  
  proc clapack_cscal*(n: var integer; ca: ptr complex; cx: ptr complex;               incx: var integer): cint {.importc: "cscal_".}
  
  proc clapack_csrot*(n: var integer; cx: ptr complex; incx: var integer;               cy: ptr complex; incy: var integer; c: ptr real; s: ptr real): cint {.importc: "csrot_".}
  
  proc clapack_csscal*(n: var integer; sa: ptr real; cx: ptr complex; incx: var integer): cint {.importc: "csscal_".}
  
  proc clapack_cswap*(n: var integer; cx: ptr complex; incx: var integer;               cy: ptr complex; incy: var integer): cint {.importc: "cswap_".}
  
  proc clapack_csymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;               alpha: ptr complex; a: ptr complex; lda: var integer;               b: ptr complex; ldb: var integer; beta: ptr complex;               c: ptr complex; ldc: var integer): cint {.importc: "csymm_".}
  
  proc clapack_csyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;                alpha: ptr complex; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; beta: ptr complex;                c: ptr complex; ldc: var integer): cint {.importc: "csyr2k_".}
  
  proc clapack_csyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;               alpha: ptr complex; a: ptr complex; lda: var integer;               beta: ptr complex; c: ptr complex; ldc: var integer): cint {.importc: "csyrk_".}
  
  proc clapack_ctbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr complex; lda: var integer; x: ptr complex;               incx: var integer): cint {.importc: "ctbmv_".}
  
  proc clapack_ctbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr complex; lda: var integer; x: ptr complex;               incx: var integer): cint {.importc: "ctbsv_".}
  
  proc clapack_ctpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr complex; x: ptr complex; incx: var integer): cint {.importc: "ctpmv_".}
  
  proc clapack_ctpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr complex; x: ptr complex; incx: var integer): cint {.importc: "ctpsv_".}
  
  proc clapack_ctrmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr complex;               a: ptr complex; lda: var integer; b: ptr complex;               ldb: var integer): cint {.importc: "ctrmm_".}
  
  proc clapack_ctrmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr complex; lda: var integer; x: ptr complex;               incx: var integer): cint {.importc: "ctrmv_".}
  
  proc clapack_ctrsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr complex;               a: ptr complex; lda: var integer; b: ptr complex;               ldb: var integer): cint {.importc: "ctrsm_".}
  
  proc clapack_ctrsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr complex; lda: var integer; x: ptr complex;               incx: var integer): cint {.importc: "ctrsv_".}

  #___________________________________________________________________________
  #
  # Real, double precision
  #___________________________________________________________________________

  proc clapack_dasum*(n: var integer; dx: ptr doublereal; incx: var integer): doublereal {.importc: "dasum_".}
  
  proc clapack_daxpy*(n: var integer; da: ptr doublereal; dx: ptr doublereal;               incx: var integer; dy: ptr doublereal; incy: var integer): cint {.importc: "daxpy_".}
  proc clapack_dcabs1*(z: ptr doublecomplex): doublereal {.importc: "dcabs1_".}
  
  proc clapack_dcopy*(n: var integer; dx: ptr doublereal; incx: var integer;               dy: ptr doublereal; incy: var integer): cint {.importc: "dcopy_".}
  proc clapack_ddot*(n: var integer; dx: ptr doublereal; incx: var integer;              dy: ptr doublereal; incy: var integer): doublereal {.importc: "ddot_".}
  
  proc clapack_dgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;               ku: var integer; alpha: ptr doublereal; a: ptr doublereal;               lda: var integer; x: ptr doublereal; incx: var integer;               beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "dgbmv_".}
  
  proc clapack_dgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;               k: var integer; alpha: ptr doublereal; a: ptr doublereal;               lda: var integer; b: ptr doublereal; ldb: var integer;               beta: ptr doublereal; c: ptr doublereal; ldc: var integer): cint {.importc: "dgemm_".}
  
  proc clapack_dgemv*(trans: var cstring; m: var integer; n: var integer;               alpha: ptr doublereal; a: ptr doublereal; lda: var integer;               x: ptr doublereal; incx: var integer; beta: ptr doublereal;               y: ptr doublereal; incy: var integer): cint {.importc: "dgemv_".}
  
  proc clapack_dger*(m: var integer; n: var integer; alpha: ptr doublereal;              x: ptr doublereal; incx: var integer; y: ptr doublereal;              incy: var integer; a: ptr doublereal; lda: var integer): cint {.importc: "dger_".}
  proc clapack_dnrm2*(n: var integer; x: ptr doublereal; incx: var integer): doublereal {.importc: "dnrm2_".}
  
  proc clapack_drot*(n: var integer; dx: ptr doublereal; incx: var integer;              dy: ptr doublereal; incy: var integer; c: ptr doublereal;              s: ptr doublereal): cint {.importc: "drot_".}
  
  proc clapack_drotg*(da: ptr doublereal; db: ptr doublereal; c: ptr doublereal;               s: ptr doublereal): cint {.importc: "drotg_".}
  
  proc clapack_drotm*(n: var integer; dx: ptr doublereal; incx: var integer;               dy: ptr doublereal; incy: var integer; dparam: ptr doublereal): cint {.importc: "drotm_".}
  
  proc clapack_drotmg*(dd1: ptr doublereal; dd2: ptr doublereal; dx1: ptr doublereal;                dy1: ptr doublereal; dparam: ptr doublereal): cint {.importc: "drotmg_".}
  
  proc clapack_dsbmv*(uplo: var cstring; n: var integer; k: var integer;               alpha: ptr doublereal; a: ptr doublereal; lda: var integer;               x: ptr doublereal; incx: var integer; beta: ptr doublereal;               y: ptr doublereal; incy: var integer): cint {.importc: "dsbmv_".}
  
  proc clapack_dscal*(n: var integer; da: ptr doublereal; dx: ptr doublereal;               incx: var integer): cint {.importc: "dscal_".}
  proc clapack_dsdot*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;               incy: var integer): doublereal {.importc: "dsdot_".}
  
  proc clapack_dspmv*(uplo: var cstring; n: var integer; alpha: ptr doublereal;               ap: ptr doublereal; x: ptr doublereal; incx: var integer;               beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "dspmv_".}
  
  proc clapack_dspr*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublereal; incx: var integer; ap: ptr doublereal): cint {.importc: "dspr_".}
  
  proc clapack_dspr2*(uplo: var cstring; n: var integer; alpha: ptr doublereal;               x: ptr doublereal; incx: var integer; y: ptr doublereal;               incy: var integer; ap: ptr doublereal): cint {.importc: "dspr2_".}
  
  proc clapack_dswap*(n: var integer; dx: ptr doublereal; incx: var integer;               dy: ptr doublereal; incy: var integer): cint {.importc: "dswap_".}
  
  proc clapack_dsymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;               alpha: ptr doublereal; a: ptr doublereal; lda: var integer;               b: ptr doublereal; ldb: var integer; beta: ptr doublereal;               c: ptr doublereal; ldc: var integer): cint {.importc: "dsymm_".}
  
  proc clapack_dsymv*(uplo: var cstring; n: var integer; alpha: ptr doublereal;               a: ptr doublereal; lda: var integer; x: ptr doublereal;               incx: var integer; beta: ptr doublereal; y: ptr doublereal;               incy: var integer): cint {.importc: "dsymv_".}
  
  proc clapack_dsyr*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublereal; incx: var integer; a: ptr doublereal;              lda: var integer): cint {.importc: "dsyr_".}
  
  proc clapack_dsyr2*(uplo: var cstring; n: var integer; alpha: ptr doublereal;               x: ptr doublereal; incx: var integer; y: ptr doublereal;               incy: var integer; a: ptr doublereal; lda: var integer): cint {.importc: "dsyr2_".}
  
  proc clapack_dsyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;                alpha: ptr doublereal; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; beta: ptr doublereal;                c: ptr doublereal; ldc: var integer): cint {.importc: "dsyr2k_".}
  
  proc clapack_dsyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;               alpha: ptr doublereal; a: ptr doublereal; lda: var integer;               beta: ptr doublereal; c: ptr doublereal; ldc: var integer): cint {.importc: "dsyrk_".}
  
  proc clapack_dtbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr doublereal; lda: var integer;               x: ptr doublereal; incx: var integer): cint {.importc: "dtbmv_".}
  
  proc clapack_dtbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr doublereal; lda: var integer;               x: ptr doublereal; incx: var integer): cint {.importc: "dtbsv_".}
  
  proc clapack_dtpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr doublereal; x: ptr doublereal; incx: var integer): cint {.importc: "dtpmv_".}
  
  proc clapack_dtpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr doublereal; x: ptr doublereal; incx: var integer): cint {.importc: "dtpsv_".}
  
  proc clapack_dtrmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr doublereal;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer): cint {.importc: "dtrmm_".}
  
  proc clapack_dtrmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; x: ptr doublereal;               incx: var integer): cint {.importc: "dtrmv_".}
  
  proc clapack_dtrsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr doublereal;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer): cint {.importc: "dtrsm_".}
  
  proc clapack_dtrsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; x: ptr doublereal;               incx: var integer): cint {.importc: "dtrsv_".}
  proc clapack_dzasum*(n: var integer; zx: ptr doublecomplex; incx: var integer): doublereal {.importc: "dzasum_".}
  proc clapack_dznrm2*(n: var integer; x: ptr doublecomplex; incx: var integer): doublereal {.importc: "dznrm2_".}

  #___________________________________________________________________________
  #
  # Integer
  #___________________________________________________________________________

  proc clapack_icamax*(n: var integer; cx: ptr complex; incx: var integer): integer {.importc: "icamax_".}
  proc clapack_idamax*(n: var integer; dx: ptr doublereal; incx: var integer): integer {.importc: "idamax_".}
  proc clapack_isamax*(n: var integer; sx: ptr real; incx: var integer): integer {.importc: "isamax_".}
  proc clapack_izamax*(n: var integer; zx: ptr doublecomplex; incx: var integer): integer {.importc: "izamax_".}
  proc clapack_lsame*(ca: var cstring; cb: var cstring): logical {.importc: "lsame_".}

  proc clapack_xerbla*(srname: var cstring; info: var integer): cint {.importc: "xerbla_".}
  
  proc clapack_xerbla_array*(srname_array: var cstring; srname_len: var integer;                       info: var integer; srname_array_len: ftnlen): cint {.importc: "xerbla_array__".}

  #___________________________________________________________________________
  #
  # Real, single precision
  #___________________________________________________________________________

  proc clapack_sasum*(n: var integer; sx: ptr real; incx: var integer): doublereal {.importc: "sasum_".}
  
  proc clapack_saxpy*(n: var integer; sa: ptr real; sx: ptr real; incx: var integer;               sy: ptr real; incy: var integer): cint {.importc: "saxpy_".}
  proc clapack_scabs1*(z: ptr complex): doublereal {.importc: "scabs1_".}
  proc clapack_scasum*(n: var integer; cx: ptr complex; incx: var integer): doublereal {.importc: "scasum_".}
  proc clapack_scnrm2*(n: var integer; x: ptr complex; incx: var integer): doublereal {.importc: "scnrm2_".}
  
  proc clapack_scopy*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;               incy: var integer): cint {.importc: "scopy_".}
  proc clapack_sdot*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;              incy: var integer): doublereal {.importc: "sdot_".}
  proc clapack_sdsdot*(n: var integer; sb: ptr real; sx: ptr real; incx: var integer;                sy: ptr real; incy: var integer): doublereal {.importc: "sdsdot_".}
  
  proc clapack_sgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;               ku: var integer; alpha: ptr real; a: ptr real; lda: var integer;               x: ptr real; incx: var integer; beta: ptr real; y: ptr real;               incy: var integer): cint {.importc: "sgbmv_".}
  
  proc clapack_sgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;               k: var integer; alpha: ptr real; a: ptr real; lda: var integer;               b: ptr real; ldb: var integer; beta: ptr real; c: ptr real;               ldc: var integer): cint {.importc: "sgemm_".}
  
  proc clapack_sgemv*(trans: var cstring; m: var integer; n: var integer; alpha: ptr real;               a: ptr real; lda: var integer; x: ptr real; incx: var integer;               beta: ptr real; y: ptr real; incy: var integer): cint {.importc: "sgemv_".}
  
  proc clapack_sger*(m: var integer; n: var integer; alpha: ptr real; x: ptr real;              incx: var integer; y: ptr real; incy: var integer; a: ptr real;              lda: var integer): cint {.importc: "sger_".}
  proc clapack_snrm2*(n: var integer; x: ptr real; incx: var integer): doublereal {.importc: "snrm2_".}
  
  proc clapack_srot*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;              incy: var integer; c: ptr real; s: ptr real): cint {.importc: "srot_".}
  
  proc clapack_srotg*(sa: ptr real; sb: ptr real; c: ptr real; s: ptr real): cint {.importc: "srotg_".}
  
  proc clapack_srotm*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;               incy: var integer; sparam: ptr real): cint {.importc: "srotm_".}
  
  proc clapack_srotmg*(sd1: ptr real; sd2: ptr real; sx1: ptr real; sy1: ptr real;                sparam: ptr real): cint {.importc: "srotmg_".}
  
  proc clapack_ssbmv*(uplo: var cstring; n: var integer; k: var integer; alpha: ptr real;               a: ptr real; lda: var integer; x: ptr real; incx: var integer;               beta: ptr real; y: ptr real; incy: var integer): cint {.importc: "ssbmv_".}
  
  proc clapack_sscal*(n: var integer; sa: ptr real; sx: ptr real; incx: var integer): cint {.importc: "sscal_".}
  
  proc clapack_sspmv*(uplo: var cstring; n: var integer; alpha: ptr real; ap: ptr real;               x: ptr real; incx: var integer; beta: ptr real; y: ptr real;               incy: var integer): cint {.importc: "sspmv_".}
  
  proc clapack_sspr*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;              incx: var integer; ap: ptr real): cint {.importc: "sspr_".}
  
  proc clapack_sspr2*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;               incx: var integer; y: ptr real; incy: var integer; ap: ptr real): cint {.importc: "sspr2_".}
  
  proc clapack_sswap*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;               incy: var integer): cint {.importc: "sswap_".}
  
  proc clapack_ssymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;               alpha: ptr real; a: ptr real; lda: var integer; b: ptr real;               ldb: var integer; beta: ptr real; c: ptr real; ldc: var integer): cint {.importc: "ssymm_".}
  
  proc clapack_ssymv*(uplo: var cstring; n: var integer; alpha: ptr real; a: ptr real;               lda: var integer; x: ptr real; incx: var integer; beta: ptr real;               y: ptr real; incy: var integer): cint {.importc: "ssymv_".}
  
  proc clapack_ssyr*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;              incx: var integer; a: ptr real; lda: var integer): cint {.importc: "ssyr_".}
  
  proc clapack_ssyr2*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;               incx: var integer; y: ptr real; incy: var integer; a: ptr real;               lda: var integer): cint {.importc: "ssyr2_".}
  
  proc clapack_ssyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;                alpha: ptr real; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; beta: ptr real; c: ptr real;                ldc: var integer): cint {.importc: "ssyr2k_".}
  
  proc clapack_ssyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;               alpha: ptr real; a: ptr real; lda: var integer; beta: ptr real;               c: ptr real; ldc: var integer): cint {.importc: "ssyrk_".}
  
  proc clapack_stbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr real; lda: var integer; x: ptr real;               incx: var integer): cint {.importc: "stbmv_".}
  
  proc clapack_stbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr real; lda: var integer; x: ptr real;               incx: var integer): cint {.importc: "stbsv_".}
  
  proc clapack_stpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr real; x: ptr real; incx: var integer): cint {.importc: "stpmv_".}
  
  proc clapack_stpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr real; x: ptr real; incx: var integer): cint {.importc: "stpsv_".}
  
  proc clapack_strmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr real; a: ptr real;               lda: var integer; b: ptr real; ldb: var integer): cint {.importc: "strmm_".}
  
  proc clapack_strmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr real; lda: var integer; x: ptr real; incx: var integer): cint {.importc: "strmv_".}
  
  proc clapack_strsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr real; a: ptr real;               lda: var integer; b: ptr real; ldb: var integer): cint {.importc: "strsm_".}
  
  proc clapack_strsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr real; lda: var integer; x: ptr real; incx: var integer): cint {.importc: "strsv_".}
  
  #___________________________________________________________________________
  #
  # Complex, double precision
  #___________________________________________________________________________

  proc clapack_zaxpy*(n: var integer; za: ptr doublecomplex; zx: ptr doublecomplex;               incx: var integer; zy: ptr doublecomplex; incy: var integer): cint {.importc: "zaxpy_".}
  
  proc clapack_zcopy*(n: var integer; zx: ptr doublecomplex; incx: var integer;               zy: ptr doublecomplex; incy: var integer): cint {.importc: "zcopy_".}
  # Double Complex 
  proc clapack_zdotc*(ret_val: ptr doublecomplex; n: var integer;               zx: ptr doublecomplex; incx: var integer; zy: ptr doublecomplex;               incy: var integer): void {.importc: "zdotc_".}
  # Double Complex 
  proc clapack_zdotu*(ret_val: ptr doublecomplex; n: var integer;               zx: ptr doublecomplex; incx: var integer; zy: ptr doublecomplex;               incy: var integer): void {.importc: "zdotu_".}
  
  proc clapack_zdrot*(n: var integer; cx: ptr doublecomplex; incx: var integer;               cy: ptr doublecomplex; incy: var integer; c: ptr doublereal;               s: ptr doublereal): cint {.importc: "zdrot_".}
  
  proc clapack_zdscal*(n: var integer; da: ptr doublereal; zx: ptr doublecomplex;                incx: var integer): cint {.importc: "zdscal_".}
  
  proc clapack_zgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;               ku: var integer; alpha: ptr doublecomplex; a: ptr doublecomplex;               lda: var integer; x: ptr doublecomplex; incx: var integer;               beta: ptr doublecomplex; y: ptr doublecomplex; incy: var integer): cint {.importc: "zgbmv_".}
  
  proc clapack_zgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;               k: var integer; alpha: ptr doublecomplex; a: ptr doublecomplex;               lda: var integer; b: ptr doublecomplex; ldb: var integer;               beta: ptr doublecomplex; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zgemm_".}
  
  proc clapack_zgemv*(trans: var cstring; m: var integer; n: var integer;               alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;               x: ptr doublecomplex; incx: var integer; beta: ptr doublecomplex;               y: ptr doublecomplex; incy: var integer): cint {.importc: "zgemv_".}
  
  proc clapack_zgerc*(m: var integer; n: var integer; alpha: ptr doublecomplex;               x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;               incy: var integer; a: ptr doublecomplex; lda: var integer): cint {.importc: "zgerc_".}
  
  proc clapack_zgeru*(m: var integer; n: var integer; alpha: ptr doublecomplex;               x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;               incy: var integer; a: ptr doublecomplex; lda: var integer): cint {.importc: "zgeru_".}
  
  proc clapack_zhbmv*(uplo: var cstring; n: var integer; k: var integer;               alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;               x: ptr doublecomplex; incx: var integer; beta: ptr doublecomplex;               y: ptr doublecomplex; incy: var integer): cint {.importc: "zhbmv_".}
  
  proc clapack_zhemm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;               alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;               b: ptr doublecomplex; ldb: var integer; beta: ptr doublecomplex;               c: ptr doublecomplex; ldc: var integer): cint {.importc: "zhemm_".}
  
  proc clapack_zhemv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;               a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;               incx: var integer; beta: ptr doublecomplex; y: ptr doublecomplex;               incy: var integer): cint {.importc: "zhemv_".}
  
  proc clapack_zher*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublecomplex; incx: var integer; a: ptr doublecomplex;              lda: var integer): cint {.importc: "zher_".}
  
  proc clapack_zher2*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;               x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;               incy: var integer; a: ptr doublecomplex; lda: var integer): cint {.importc: "zher2_".}
  
  proc clapack_zher2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;                alpha: ptr doublecomplex; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                beta: ptr doublereal; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zher2k_".}
  
  proc clapack_zherk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;               alpha: ptr doublereal; a: ptr doublecomplex; lda: var integer;               beta: ptr doublereal; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zherk_".}
  
  proc clapack_zhpmv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;               ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer;               beta: ptr doublecomplex; y: ptr doublecomplex; incy: var integer): cint {.importc: "zhpmv_".}
  
  proc clapack_zhpr*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublecomplex; incx: var integer; ap: ptr doublecomplex): cint {.importc: "zhpr_".}
  
  proc clapack_zhpr2*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;               x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;               incy: var integer; ap: ptr doublecomplex): cint {.importc: "zhpr2_".}
  
  proc clapack_zrotg*(ca: ptr doublecomplex; cb: ptr doublecomplex;               c: ptr doublereal; s: ptr doublecomplex): cint {.importc: "zrotg_".}
  
  proc clapack_zscal*(n: var integer; za: ptr doublecomplex; zx: ptr doublecomplex;               incx: var integer): cint {.importc: "zscal_".}
  
  proc clapack_zswap*(n: var integer; zx: ptr doublecomplex; incx: var integer;               zy: ptr doublecomplex; incy: var integer): cint {.importc: "zswap_".}
  
  proc clapack_zsymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;               alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;               b: ptr doublecomplex; ldb: var integer; beta: ptr doublecomplex;               c: ptr doublecomplex; ldc: var integer): cint {.importc: "zsymm_".}
  
  proc clapack_zsyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;                alpha: ptr doublecomplex; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                beta: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer): cint {.importc: "zsyr2k_".}
  
  proc clapack_zsyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;               alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;               beta: ptr doublecomplex; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zsyrk_".}
  
  proc clapack_ztbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr doublecomplex; lda: var integer;               x: ptr doublecomplex; incx: var integer): cint {.importc: "ztbmv_".}
  
  proc clapack_ztbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               k: var integer; a: ptr doublecomplex; lda: var integer;               x: ptr doublecomplex; incx: var integer): cint {.importc: "ztbsv_".}
  
  proc clapack_ztpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer): cint {.importc: "ztpmv_".}
  
  proc clapack_ztpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer): cint {.importc: "ztpsv_".}
  
  proc clapack_ztrmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr doublecomplex;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer): cint {.importc: "ztrmm_".}
  
  proc clapack_ztrmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;               incx: var integer): cint {.importc: "ztrmv_".}
  
  proc clapack_ztrsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;               m: var integer; n: var integer; alpha: ptr doublecomplex;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer): cint {.importc: "ztrsm_".}
  
  proc clapack_ztrsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;               incx: var integer): cint {.importc: "ztrsv_".}
  
  #___________________________________________________________________________
  #
  # Complex, single precision
  #___________________________________________________________________________

  proc clapack_cbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;                nru: var integer; ncc: var integer; d: ptr real; e: ptr real;                vt: ptr complex; ldvt: var integer; u: ptr complex;                ldu: var integer; c: ptr complex; ldc: var integer;                rwork: ptr real; info: var integer): cint {.importc: "cbdsqr_".}
  
  proc clapack_cgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;                kl: var integer; ku: var integer; ab: ptr complex;                ldab: var integer; d: ptr real; e: ptr real; q: ptr complex;                ldq: var integer; pt: ptr complex; ldpt: var integer;                c: ptr complex; ldc: var integer; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cgbbrd_".}
  
  proc clapack_cgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr complex; ldab: var integer; ipiv: var cint;                anorm: ptr real; rcond: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cgbcon_".}
  
  proc clapack_cgbequ*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr complex; ldab: var integer;                r: ptr real; c: ptr real; rowcnd: ptr real;                colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "cgbequ_".}
  
  proc clapack_cgbequb*(m: var integer; n: var integer; kl: var integer;                 ku: var integer; ab: ptr complex; ldab: var integer;                 r: ptr real; c: ptr real; rowcnd: ptr real;                 colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "cgbequb_".}
  
  proc clapack_cgbrfs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr complex;                ldab: var integer; afb: ptr complex; ldafb: var integer;                ipiv: var cint; b: ptr complex; ldb: var integer;                x: ptr complex; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cgbrfs_".}
  
  proc clapack_cgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;                 kl: var integer; ku: var integer; nrhs: var integer;                 ab: ptr complex; ldab: var integer; afb: ptr complex;                 ldafb: var integer; ipiv: var cint; r: ptr real;                 c: ptr real; b: ptr complex; ldb: var integer;                 x: ptr complex; ldx: var integer; rcond: ptr real;                 berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr complex;                 rwork: ptr real; info: var integer): cint {.importc: "cgbrfsx_".}
  
  proc clapack_cgbsv*(n: var integer; kl: var integer; ku: var integer;               nrhs: var integer; ab: ptr complex; ldab: var integer;               ipiv: var cint; b: ptr complex; ldb: var integer;               info: var integer): cint {.importc: "cgbsv_".}
  
  proc clapack_cgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr complex;                ldab: var integer; afb: ptr complex; ldafb: var integer;                ipiv: var cint; equed: var cstring; r: ptr real; c: ptr real;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cgbsvx_".}
  
  proc clapack_cgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                 ku: var integer; nrhs: var integer; ab: ptr complex;                 ldab: var integer; afb: ptr complex; ldafb: var integer;                 ipiv: var cint; equed: var cstring; r: ptr real;                 c: ptr real; b: ptr complex; ldb: var integer;                 x: ptr complex; ldx: var integer; rcond: ptr real;                 rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr complex;                 rwork: ptr real; info: var integer): cint {.importc: "cgbsvxx_".}
  
  proc clapack_cgbtf2*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr complex; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "cgbtf2_".}
  
  proc clapack_cgbtrf*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr complex; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "cgbtrf_".}
  
  proc clapack_cgbtrs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr complex;                ldab: var integer; ipiv: var cint; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "cgbtrs_".}
  
  proc clapack_cgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; scale: ptr real; m: var integer;                v: ptr complex; ldv: var integer; info: var integer): cint {.importc: "cgebak_".}
  
  proc clapack_cgebal*(job: var cstring; n: var integer; a: ptr complex; lda: var integer;                ilo: var integer; ihi: var integer; scale: ptr real;                info: var integer): cint {.importc: "cgebal_".}
  
  proc clapack_cgebd2*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; d: ptr real; e: ptr real; tauq: ptr complex;                taup: ptr complex; work: ptr complex; info: var integer): cint {.importc: "cgebd2_".}
  
  proc clapack_cgebrd*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; d: ptr real; e: ptr real; tauq: ptr complex;                taup: ptr complex; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "cgebrd_".}
  
  proc clapack_cgecon*(norm: var cstring; n: var integer; a: ptr complex; lda: var integer;                anorm: ptr real; rcond: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cgecon_".}
  
  proc clapack_cgeequ*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; r: ptr real; c: ptr real;                rowcnd: ptr real; colcnd: ptr real; amax: ptr real;                info: var integer): cint {.importc: "cgeequ_".}
  
  proc clapack_cgeequb*(m: var integer; n: var integer; a: ptr complex;                 lda: var integer; r: ptr real; c: ptr real;                 rowcnd: ptr real; colcnd: ptr real; amax: ptr real;                 info: var integer): cint {.importc: "cgeequb_".}
  
  proc clapack_cgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;               a: ptr complex; lda: var integer; sdim: var integer;               w: ptr complex; vs: ptr complex; ldvs: var integer;               work: ptr complex; lwork: var integer; rwork: ptr real;               bwork: ptr logical; info: var integer): cint {.importc: "cgees_".}
  
  proc clapack_cgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;                n: var integer; a: ptr complex; lda: var integer;                sdim: var integer; w: ptr complex; vs: ptr complex;                ldvs: var integer; rconde: ptr real; rcondv: ptr real;                work: ptr complex; lwork: var integer; rwork: ptr real;                bwork: ptr logical; info: var integer): cint {.importc: "cgeesx_".}
  
  proc clapack_cgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr complex;               lda: var integer; w: ptr complex; vl: ptr complex;               ldvl: var integer; vr: ptr complex; ldvr: var integer;               work: ptr complex; lwork: var integer; rwork: ptr real;               info: var integer): cint {.importc: "cgeev_".}
  
  proc clapack_cgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr complex; lda: var integer;                w: ptr complex; vl: ptr complex; ldvl: var integer;                vr: ptr complex; ldvr: var integer; ilo: var integer;                ihi: var integer; scale: ptr real; abnrm: ptr real;                rconde: ptr real; rcondv: ptr real; work: ptr complex;                lwork: var integer; rwork: ptr real; info: var integer): cint {.importc: "cgeevx_".}
  
  proc clapack_cgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer; a: ptr complex;               lda: var integer; b: ptr complex; ldb: var integer;               alpha: ptr complex; beta: ptr complex; vsl: ptr complex;               ldvsl: var integer; vsr: ptr complex; ldvsr: var integer;               work: ptr complex; lwork: var integer; rwork: ptr real;               info: var integer): cint {.importc: "cgegs_".}
  
  proc clapack_cgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr complex;               lda: var integer; b: ptr complex; ldb: var integer;               alpha: ptr complex; beta: ptr complex; vl: ptr complex;               ldvl: var integer; vr: ptr complex; ldvr: var integer;               work: ptr complex; lwork: var integer; rwork: ptr real;               info: var integer): cint {.importc: "cgegv_".}
  
  proc clapack_cgehd2*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr complex; lda: var integer; tau: ptr complex;                work: ptr complex; info: var integer): cint {.importc: "cgehd2_".}
  
  proc clapack_cgehrd*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr complex; lda: var integer; tau: ptr complex;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cgehrd_".}
  
  proc clapack_cgelq2*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cgelq2_".}
  
  proc clapack_cgelqf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cgelqf_".}
  
  proc clapack_cgels*(trans: var cstring; m: var integer; n: var integer;               nrhs: var integer; a: ptr complex; lda: var integer;               b: ptr complex; ldb: var integer; work: ptr complex;               lwork: var integer; info: var integer): cint {.importc: "cgels_".}
  
  proc clapack_cgelsd*(m: var integer; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; s: ptr real; rcond: ptr real;                rank: var integer; work: ptr complex; lwork: var integer;                rwork: ptr real; iwork: var integer; info: var integer): cint {.importc: "cgelsd_".}
  
  proc clapack_cgelss*(m: var integer; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; s: ptr real; rcond: ptr real;                rank: var integer; work: ptr complex; lwork: var integer;                rwork: ptr real; info: var integer): cint {.importc: "cgelss_".}
  
  proc clapack_cgelsx*(m: var integer; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; jpvt: var integer; rcond: ptr real;                rank: var integer; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cgelsx_".}
  
  proc clapack_cgelsy*(m: var integer; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; jpvt: var integer; rcond: ptr real;                rank: var integer; work: ptr complex; lwork: var integer;                rwork: ptr real; info: var integer): cint {.importc: "cgelsy_".}
  
  proc clapack_cgeql2*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cgeql2_".}
  
  proc clapack_cgeqlf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cgeqlf_".}
  
  proc clapack_cgeqp3*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; jpvt: var integer; tau: ptr complex;                work: ptr complex; lwork: var integer; rwork: ptr real;                info: var integer): cint {.importc: "cgeqp3_".}
  
  proc clapack_cgeqpf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; jpvt: var integer; tau: ptr complex;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cgeqpf_".}
  
  proc clapack_cgeqr2*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cgeqr2_".}
  
  proc clapack_cgeqrf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cgeqrf_".}
  
  proc clapack_cgerfs*(trans: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; ipiv: var cint; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cgerfs_".}
  
  proc clapack_cgerfsx*(trans: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; ipiv: var cint;                 r: ptr real; c: ptr real; b: ptr complex; ldb: var integer;                 x: ptr complex; ldx: var integer; rcond: ptr real;                 berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr complex;                 rwork: ptr real; info: var integer): cint {.importc: "cgerfsx_".}
  
  proc clapack_cgerq2*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cgerq2_".}
  
  proc clapack_cgerqf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cgerqf_".}
  
  proc clapack_cgesc2*(n: var integer; a: ptr complex; lda: var integer;                rhs: ptr complex; ipiv: var cint; jpiv: var cint;                scale: ptr real): cint {.importc: "cgesc2_".}
  
  proc clapack_cgesdd*(jobz: var cstring; m: var integer; n: var integer; a: ptr complex;                lda: var integer; s: ptr real; u: ptr complex; ldu: var integer;                vt: ptr complex; ldvt: var integer; work: ptr complex;                lwork: var integer; rwork: ptr real; iwork: var integer;                info: var integer): cint {.importc: "cgesdd_".}
  
  proc clapack_cgesv*(n: var integer; nrhs: var integer; a: ptr complex;               lda: var integer; ipiv: var cint; b: ptr complex;               ldb: var integer; info: var integer): cint {.importc: "cgesv_".}
  
  proc clapack_cgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;                a: ptr complex; lda: var integer; s: ptr real; u: ptr complex;                ldu: var integer; vt: ptr complex; ldvt: var integer;                work: ptr complex; lwork: var integer; rwork: ptr real;                info: var integer): cint {.importc: "cgesvd_".}
  
  proc clapack_cgesvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; a: ptr complex; lda: var integer;                af: ptr complex; ldaf: var integer; ipiv: var cint;                equed: var cstring; r: ptr real; c: ptr real; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cgesvx_".}
  
  proc clapack_cgesvxx*(fact: var cstring; trans: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; ipiv: var cint;                 equed: var cstring; r: ptr real; c: ptr real; b: ptr complex;                 ldb: var integer; x: ptr complex; ldx: var integer;                 rcond: ptr real; rpvgrw: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr complex; rwork: ptr real;                 info: var integer): cint {.importc: "cgesvxx_".}
  
  proc clapack_cgetc2*(n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "cgetc2_".}
  
  proc clapack_cgetf2*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "cgetf2_".}
  
  proc clapack_cgetrf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "cgetrf_".}
  
  proc clapack_cgetri*(n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "cgetri_".}
  
  proc clapack_cgetrs*(trans: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; ipiv: var cint;                b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cgetrs_".}
  
  proc clapack_cggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; lscale: ptr real; rscale: ptr real;                m: var integer; v: ptr complex; ldv: var integer;                info: var integer): cint {.importc: "cggbak_".}
  
  proc clapack_cggbal*(job: var cstring; n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; ilo: var integer;                ihi: var integer; lscale: ptr real; rscale: ptr real;                work: ptr real; info: var integer): cint {.importc: "cggbal_".}
  
  proc clapack_cgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;               n: var integer; a: ptr complex; lda: var integer; b: ptr complex;               ldb: var integer; sdim: var integer; alpha: ptr complex;               beta: ptr complex; vsl: ptr complex; ldvsl: var integer;               vsr: ptr complex; ldvsr: var integer; work: ptr complex;               lwork: var integer; rwork: ptr real; bwork: ptr logical;               info: var integer): cint {.importc: "cgges_".}
  
  proc clapack_cggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;                sense: var cstring; n: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                sdim: var integer; alpha: ptr complex; beta: ptr complex;                vsl: ptr complex; ldvsl: var integer; vsr: ptr complex;                ldvsr: var integer; rconde: ptr real; rcondv: ptr real;                work: ptr complex; lwork: var integer; rwork: ptr real;                iwork: var integer; liwork: var integer; bwork: ptr logical;                info: var integer): cint {.importc: "cggesx_".}
  
  proc clapack_cggev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr complex;               lda: var integer; b: ptr complex; ldb: var integer;               alpha: ptr complex; beta: ptr complex; vl: ptr complex;               ldvl: var integer; vr: ptr complex; ldvr: var integer;               work: ptr complex; lwork: var integer; rwork: ptr real;               info: var integer): cint {.importc: "cggev_".}
  
  proc clapack_cggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; alpha: ptr complex;                beta: ptr complex; vl: ptr complex; ldvl: var integer;                vr: ptr complex; ldvr: var integer; ilo: var integer;                ihi: var integer; lscale: ptr real; rscale: ptr real;                abnrm: ptr real; bbnrm: ptr real; rconde: ptr real;                rcondv: ptr real; work: ptr complex; lwork: var integer;                rwork: ptr real; iwork: var integer; bwork: ptr logical;                info: var integer): cint {.importc: "cggevx_".}
  
  proc clapack_cggglm*(n: var integer; m: var integer; p: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                d: ptr complex; x: ptr complex; y: ptr complex;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cggglm_".}
  
  proc clapack_cgghrd*(compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                q: ptr complex; ldq: var integer; z: ptr complex;                ldz: var integer; info: var integer): cint {.importc: "cgghrd_".}
  
  proc clapack_cgglse*(m: var integer; n: var integer; p: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                c: ptr complex; d: ptr complex; x: ptr complex;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cgglse_".}
  
  proc clapack_cggqrf*(n: var integer; m: var integer; p: var integer; a: ptr complex;                lda: var integer; taua: ptr complex; b: ptr complex;                ldb: var integer; taub: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cggqrf_".}
  
  proc clapack_cggrqf*(m: var integer; p: var integer; n: var integer; a: ptr complex;                lda: var integer; taua: ptr complex; b: ptr complex;                ldb: var integer; taub: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cggrqf_".}
  
  proc clapack_cggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                n: var integer; p: var integer; k: var integer; l: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; alpha: ptr real; beta: ptr real;                u: ptr complex; ldu: var integer; v: ptr complex;                ldv: var integer; q: ptr complex; ldq: var integer;                work: ptr complex; rwork: ptr real; iwork: var integer;                info: var integer): cint {.importc: "cggsvd_".}
  
  proc clapack_cggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                tola: ptr real; tolb: ptr real; k: var integer; l: var integer;                u: ptr complex; ldu: var integer; v: ptr complex;                ldv: var integer; q: ptr complex; ldq: var integer;                iwork: var integer; rwork: ptr real; tau: ptr complex;                work: ptr complex; info: var integer): cint {.importc: "cggsvp_".}
  
  proc clapack_cgtcon*(norm: var cstring; n: var integer; dl: ptr complex;                d: ptr complex; du: ptr complex; du2: ptr complex;                ipiv: var cint; anorm: ptr real; rcond: ptr real;                work: ptr complex; info: var integer): cint {.importc: "cgtcon_".}
  
  proc clapack_cgtrfs*(trans: var cstring; n: var integer; nrhs: var integer;                dl: ptr complex; d: ptr complex; du: ptr complex;                dlf: ptr complex; df: ptr complex; duf: ptr complex;                du2: ptr complex; ipiv: var cint; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cgtrfs_".}
  
  proc clapack_cgtsv*(n: var integer; nrhs: var integer; dl: ptr complex;               d: ptr complex; du: ptr complex; b: ptr complex;               ldb: var integer; info: var integer): cint {.importc: "cgtsv_".}
  
  proc clapack_cgtsvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; dl: ptr complex; d: ptr complex;                du: ptr complex; dlf: ptr complex; df: ptr complex;                duf: ptr complex; du2: ptr complex; ipiv: var cint;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cgtsvx_".}
  
  proc clapack_cgttrf*(n: var integer; dl: ptr complex; d: ptr complex;                du: ptr complex; du2: ptr complex; ipiv: var cint;                info: var integer): cint {.importc: "cgttrf_".}
  
  proc clapack_cgttrs*(trans: var cstring; n: var integer; nrhs: var integer;                dl: ptr complex; d: ptr complex; du: ptr complex;                du2: ptr complex; ipiv: var cint; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "cgttrs_".}
  
  proc clapack_cgtts2*(itrans: var integer; n: var integer; nrhs: var integer;                dl: ptr complex; d: ptr complex; du: ptr complex;                du2: ptr complex; ipiv: var cint; b: ptr complex;                ldb: var integer): cint {.importc: "cgtts2_".}
  
  proc clapack_chbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;               ab: ptr complex; ldab: var integer; w: ptr real;               z: ptr complex; ldz: var integer; work: ptr complex;               rwork: ptr real; info: var integer): cint {.importc: "chbev_".}
  
  proc clapack_chbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr complex; ldab: var integer; w: ptr real;                z: ptr complex; ldz: var integer; work: ptr complex;                lwork: var integer; rwork: ptr real; lrwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "chbevd_".}
  
  proc clapack_chbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                kd: var integer; ab: ptr complex; ldab: var integer;                q: ptr complex; ldq: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr complex; ldz: var integer;                work: ptr complex; rwork: ptr real; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "chbevx_".}
  
  proc clapack_chbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr complex; ldab: var integer;                bb: ptr complex; ldbb: var integer; x: ptr complex;                ldx: var integer; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "chbgst_".}
  
  proc clapack_chbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;               kb: var integer; ab: ptr complex; ldab: var integer;               bb: ptr complex; ldbb: var integer; w: ptr real;               z: ptr complex; ldz: var integer; work: ptr complex;               rwork: ptr real; info: var integer): cint {.importc: "chbgv_".}
  
  proc clapack_chbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr complex; ldab: var integer;                bb: ptr complex; ldbb: var integer; w: ptr real;                z: ptr complex; ldz: var integer; work: ptr complex;                lwork: var integer; rwork: ptr real; lrwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "chbgvd_".}
  
  proc clapack_chbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ka: var integer; kb: var integer; ab: ptr complex;                ldab: var integer; bb: ptr complex; ldbb: var integer;                q: ptr complex; ldq: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr complex; ldz: var integer;                work: ptr complex; rwork: ptr real; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "chbgvx_".}
  
  proc clapack_chbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr complex; ldab: var integer; d: ptr real; e: ptr real;                q: ptr complex; ldq: var integer; work: ptr complex;                info: var integer): cint {.importc: "chbtrd_".}
  
  proc clapack_checon*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; anorm: ptr real; rcond: ptr real;                work: ptr complex; info: var integer): cint {.importc: "checon_".}
  
  proc clapack_cheequb*(uplo: var cstring; n: var integer; a: ptr complex;                 lda: var integer; s: ptr real; scond: ptr real; amax: ptr real;                 work: ptr complex; info: var integer): cint {.importc: "cheequb_".}
  
  proc clapack_cheev*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr complex;               lda: var integer; w: ptr real; work: ptr complex;               lwork: var integer; rwork: ptr real; info: var integer): cint {.importc: "cheev_".}
  
  proc clapack_cheevd*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr complex;                lda: var integer; w: ptr real; work: ptr complex;                lwork: var integer; rwork: ptr real; lrwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "cheevd_".}
  
  proc clapack_cheevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr complex; lda: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr complex; ldz: var integer;                isuppz: var integer; work: ptr complex; lwork: var integer;                rwork: ptr real; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "cheevr_".}
  
  proc clapack_cheevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr complex; lda: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; rwork: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "cheevx_".}
  
  proc clapack_chegs2*(itype: var integer; uplo: var cstring; n: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "chegs2_".}
  
  proc clapack_chegst*(itype: var integer; uplo: var cstring; n: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "chegst_".}
  
  proc clapack_chegv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               a: ptr complex; lda: var integer; b: ptr complex;               ldb: var integer; w: ptr real; work: ptr complex;               lwork: var integer; rwork: ptr real; info: var integer): cint {.importc: "chegv_".}
  
  proc clapack_chegvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; w: ptr real;                work: ptr complex; lwork: var integer; rwork: ptr real;                lrwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "chegvd_".}
  
  proc clapack_chegvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; rwork: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "chegvx_".}
  
  proc clapack_cherfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; ipiv: var cint; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cherfs_".}
  
  proc clapack_cherfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; ipiv: var cint;                 s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;                 ldx: var integer; rcond: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr complex; rwork: ptr real;                 info: var integer): cint {.importc: "cherfsx_".}
  
  proc clapack_chesv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr complex;               lda: var integer; ipiv: var cint; b: ptr complex;               ldb: var integer; work: ptr complex; lwork: var integer;               info: var integer): cint {.importc: "chesv_".}
  
  proc clapack_chesvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; ipiv: var cint; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real;                work: ptr complex; lwork: var integer; rwork: ptr real;                info: var integer): cint {.importc: "chesvx_".}
  
  proc clapack_chesvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; ipiv: var cint;                 equed: var cstring; s: ptr real; b: ptr complex; ldb: var integer;                 x: ptr complex; ldx: var integer; rcond: ptr real;                 rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr complex;                 rwork: ptr real; info: var integer): cint {.importc: "chesvxx_".}
  
  proc clapack_chetd2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                d: ptr real; e: ptr real; tau: ptr complex; info: var integer): cint {.importc: "chetd2_".}
  
  proc clapack_chetf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; info: var integer): cint {.importc: "chetf2_".}
  
  proc clapack_chetrd*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                d: ptr real; e: ptr real; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "chetrd_".}
  
  proc clapack_chetrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "chetrf_".}
  
  proc clapack_chetri*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "chetri_".}
  
  proc clapack_chetrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; ipiv: var cint;                b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "chetrs_".}
  
  proc clapack_chfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;               k: var integer; alpha: ptr real; a: ptr complex;               lda: var integer; beta: ptr real; c: ptr complex): cint {.importc: "chfrk_".}
  
  proc clapack_chgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; h: ptr complex;                ldh: var integer; t: ptr complex; ldt: var integer;                alpha: ptr complex; beta: ptr complex; q: ptr complex;                ldq: var integer; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; rwork: ptr real;                info: var integer): cint {.importc: "chgeqz_".}
  # Character 
  proc clapack_chla_transtype*(ret_val: var cstring; ret_val_len: ftnlen;                         trans: var integer): void {.importc: "chla_transtype__".}
  
  proc clapack_chpcon*(uplo: var cstring; n: var integer; ap: ptr complex;                ipiv: var cint; anorm: ptr real; rcond: ptr real;                work: ptr complex; info: var integer): cint {.importc: "chpcon_".}
  
  proc clapack_chpev*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;               w: ptr real; z: ptr complex; ldz: var integer;               work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "chpev_".}
  
  proc clapack_chpevd*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;                w: ptr real; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; rwork: ptr real;                lrwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "chpevd_".}
  
  proc clapack_chpevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ap: ptr complex; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr complex; ldz: var integer; work: ptr complex;                rwork: ptr real; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "chpevx_".}
  
  proc clapack_chpgst*(itype: var integer; uplo: var cstring; n: var integer;                ap: ptr complex; bp: ptr complex; info: var integer): cint {.importc: "chpgst_".}
  
  proc clapack_chpgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               ap: ptr complex; bp: ptr complex; w: ptr real; z: ptr complex;               ldz: var integer; work: ptr complex; rwork: ptr real;               info: var integer): cint {.importc: "chpgv_".}
  
  proc clapack_chpgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; ap: ptr complex; bp: ptr complex; w: ptr real;                z: ptr complex; ldz: var integer; work: ptr complex;                lwork: var integer; rwork: ptr real; lrwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "chpgvd_".}
  
  proc clapack_chpgvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; ap: ptr complex; bp: ptr complex;                vl: ptr real; vu: ptr real; il: var integer; iu: var integer;                abstol: ptr real; m: var integer; w: ptr real; z: ptr complex;                ldz: var integer; work: ptr complex; rwork: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "chpgvx_".}
  
  proc clapack_chprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; afp: ptr complex; ipiv: var cint;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "chprfs_".}
  
  proc clapack_chpsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr complex; ipiv: var cint; b: ptr complex;               ldb: var integer; info: var integer): cint {.importc: "chpsv_".}
  
  proc clapack_chpsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; afp: ptr complex; ipiv: var cint;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "chpsvx_".}
  
  proc clapack_chptrd*(uplo: var cstring; n: var integer; ap: ptr complex; d: ptr real;                e: ptr real; tau: ptr complex; info: var integer): cint {.importc: "chptrd_".}
  
  proc clapack_chptrf*(uplo: var cstring; n: var integer; ap: ptr complex;                ipiv: var cint; info: var integer): cint {.importc: "chptrf_".}
  
  proc clapack_chptri*(uplo: var cstring; n: var integer; ap: ptr complex;                ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "chptri_".}
  
  proc clapack_chptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; ipiv: var cint; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "chptrs_".}
  
  proc clapack_chsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;                select: ptr logical; n: var integer; h: ptr complex;                ldh: var integer; w: ptr complex; vl: ptr complex;                ldvl: var integer; vr: ptr complex; ldvr: var integer;                mm: var integer; m: var integer; work: ptr complex;                rwork: ptr real; ifaill: var integer; ifailr: var integer;                info: var integer): cint {.importc: "chsein_".}
  
  proc clapack_chseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;                ihi: var integer; h: ptr complex; ldh: var integer;                w: ptr complex; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "chseqr_".}
  
  proc clapack_cla_gbamv*(trans: var integer; m: var integer; n: var integer;                    kl: var integer; ku: var integer; alpha: ptr real;                    ab: ptr complex; ldab: var integer; x: ptr complex;                    incx: var integer; beta: ptr real; y: ptr real;                    incy: var integer): cint {.importc: "cla_gbamv__".}

  proc clapack_cla_gbrcond_c*(trans: var cstring; n: var integer; kl: var integer;                        ku: var integer; ab: ptr complex; ldab: var integer;                        afb: ptr complex; ldafb: var integer; ipiv: var cint;                        c: ptr real; capply: ptr logical; info: var integer;                        work: ptr complex; rwork: ptr real; trans_len: ftnlen): doublereal {.importc: "cla_gbrcond_c__".}

  proc clapack_cla_gbrcond_x*(trans: var cstring; n: var integer; kl: var integer;                        ku: var integer; ab: ptr complex; ldab: var integer;                        afb: ptr complex; ldafb: var integer; ipiv: var cint;                        x: ptr complex; info: var integer; work: ptr complex;                        rwork: ptr real; trans_len: ftnlen): doublereal {.importc: "cla_gbrcond_x__".}
  
  proc clapack_cla_gbrfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              kl: var integer; ku: var integer;                              nrhs: var integer; ab: ptr complex;                              ldab: var integer; afb: ptr complex;                              ldafb: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr real;                              b: ptr complex; ldb: var integer; y: ptr complex;                              ldy: var integer; berr_out: ptr real;                              n_norms: var integer; errs_n: ptr real;                              errs_c: ptr real; res: ptr complex;                              ayb: ptr real; dy: ptr complex;                              y_tail: ptr complex; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer): cint {.importc: "cla_gbrfsx_extended__".}

  proc clapack_cla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;                       ncols: var integer; ab: ptr complex; ldab: var integer;                       afb: ptr complex; ldafb: var integer): doublereal {.importc: "cla_gbrpvgrw__".}
  
  proc clapack_cla_geamv*(trans: var integer; m: var integer; n: var integer;                    alpha: ptr real; a: ptr complex; lda: var integer;                    x: ptr complex; incx: var integer; beta: ptr real;                    y: ptr real; incy: var integer): cint {.importc: "cla_geamv__".}
  proc clapack_cla_gercond_c*(trans: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        ipiv: var cint; c: ptr real; capply: ptr logical;                        info: var integer; work: ptr complex; rwork: ptr real;                        trans_len: ftnlen): doublereal {.importc: "cla_gercond_c__".}
  proc clapack_cla_gercond_x*(trans: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        ipiv: var cint; x: ptr complex; info: var integer;                        work: ptr complex; rwork: ptr real; trans_len: ftnlen): doublereal {.importc: "cla_gercond_x__".}
  
  proc clapack_cla_gerfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              nrhs: var integer; a: ptr complex;                              lda: var integer; af: ptr complex;                              ldaf: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr real;                              b: ptr complex; ldb: var integer; y: ptr complex;                              ldy: var integer; berr_out: ptr real;                              n_norms: var integer; errs_n: ptr real;                              errs_c: ptr real; res: ptr complex;                              ayb: ptr real; dy: ptr complex;                              y_tail: ptr complex; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer): cint {.importc: "cla_gerfsx_extended__".}
  
  proc clapack_cla_heamv*(uplo: var integer; n: var integer; alpha: ptr real;                    a: ptr complex; lda: var integer; x: ptr complex;                    incx: var integer; beta: ptr real; y: ptr real;                    incy: var integer): cint {.importc: "cla_heamv__".}
  proc clapack_cla_hercond_c*(uplo: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        ipiv: var cint; c: ptr real; capply: ptr logical;                        info: var integer; work: ptr complex; rwork: ptr real;                        uplo_len: ftnlen): doublereal {.importc: "cla_hercond_c__".}
  proc clapack_cla_hercond_x*(uplo: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        ipiv: var cint; x: ptr complex; info: var integer;                        work: ptr complex; rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_hercond_x__".}
  
  proc clapack_cla_herfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer; a: ptr complex;                              lda: var integer; af: ptr complex;                              ldaf: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr real;                              b: ptr complex; ldb: var integer; y: ptr complex;                              ldy: var integer; berr_out: ptr real;                              n_norms: var integer; errs_n: ptr real;                              errs_c: ptr real; res: ptr complex;                              ayb: ptr real; dy: ptr complex;                              y_tail: ptr complex; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer; uplo_len: ftnlen): cint {.importc: "cla_herfsx_extended__".}
  proc clapack_cla_herpvgrw*(uplo: var cstring; n: var integer; info: var integer;                       a: ptr complex; lda: var integer; af: ptr complex;                       ldaf: var integer; ipiv: var cint; work: ptr real;                       uplo_len: ftnlen): doublereal {.importc: "cla_herpvgrw__".}
  
  proc clapack_cla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;                       res: ptr complex; ayb: ptr real; berr: ptr real): cint {.importc: "cla_lin_berr__".}
  proc clapack_cla_porcond_c*(uplo: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        c: ptr real; capply: ptr logical; info: var integer;                        work: ptr complex; rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_porcond_c__".}
  proc clapack_cla_porcond_x*(uplo: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        x: ptr complex; info: var integer; work: ptr complex;                        rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_porcond_x__".}
  
  proc clapack_cla_porfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer; a: ptr complex;                              lda: var integer; af: ptr complex;                              ldaf: var integer; colequ: ptr logical;                              c: ptr real; b: ptr complex; ldb: var integer;                              y: ptr complex; ldy: var integer;                              berr_out: ptr real; n_norms: var integer;                              errs_n: ptr real; errs_c: ptr real;                              res: ptr complex; ayb: ptr real; dy: ptr complex;                              y_tail: ptr complex; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer; uplo_len: ftnlen): cint {.importc: "cla_porfsx_extended__".}
  proc clapack_cla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr complex;                       lda: var integer; af: ptr complex; ldaf: var integer;                       work: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_porpvgrw__".}
  proc clapack_cla_rpvgrw*(n: var integer; ncols: var integer; a: ptr complex;                     lda: var integer; af: ptr complex; ldaf: var integer): doublereal {.importc: "cla_rpvgrw__".}
  
  proc clapack_cla_syamv*(uplo: var integer; n: var integer; alpha: ptr real;                    a: ptr complex; lda: var integer; x: ptr complex;                    incx: var integer; beta: ptr real; y: ptr real;                    incy: var integer): cint {.importc: "cla_syamv__".}
  proc clapack_cla_syrcond_c*(uplo: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        ipiv: var cint; c: ptr real; capply: ptr logical;                        info: var integer; work: ptr complex; rwork: ptr real;                        uplo_len: ftnlen): doublereal {.importc: "cla_syrcond_c__".}
  proc clapack_cla_syrcond_x*(uplo: var cstring; n: var integer; a: ptr complex;                        lda: var integer; af: ptr complex; ldaf: var integer;                        ipiv: var cint; x: ptr complex; info: var integer;                        work: ptr complex; rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_syrcond_x__".}
  
  proc clapack_cla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer; a: ptr complex;                              lda: var integer; af: ptr complex;                              ldaf: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr real;                              b: ptr complex; ldb: var integer; y: ptr complex;                              ldy: var integer; berr_out: ptr real;                              n_norms: var integer; errs_n: ptr real;                              errs_c: ptr real; res: ptr complex;                              ayb: ptr real; dy: ptr complex;                              y_tail: ptr complex; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer; uplo_len: ftnlen): cint {.importc: "cla_syrfsx_extended__".}
  proc clapack_cla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;                       a: ptr complex; lda: var integer; af: ptr complex;                       ldaf: var integer; ipiv: var cint; work: ptr real;                       uplo_len: ftnlen): doublereal {.importc: "cla_syrpvgrw__".}
  
  proc clapack_cla_wwaddw*(n: var integer; x: ptr complex; y: ptr complex;                     w: ptr complex): cint {.importc: "cla_wwaddw__".}
  
  proc clapack_clabrd*(m: var integer; n: var integer; nb: var integer; a: ptr complex;                lda: var integer; d: ptr real; e: ptr real; tauq: ptr complex;                taup: ptr complex; x: ptr complex; ldx: var integer;                y: ptr complex; ldy: var integer): cint {.importc: "clabrd_".}
  
  proc clapack_clacgv*(n: var integer; x: ptr complex; incx: var integer): cint {.importc: "clacgv_".}
  
  proc clapack_clacn2*(n: var integer; v: ptr complex; x: ptr complex; est: ptr real;                kase: var integer; isave: var integer): cint {.importc: "clacn2_".}
  
  proc clapack_clacon*(n: var integer; v: ptr complex; x: ptr complex; est: ptr real;                kase: var integer): cint {.importc: "clacon_".}
  
  proc clapack_clacp2*(uplo: var cstring; m: var integer; n: var integer; a: ptr real;                lda: var integer; b: ptr complex; ldb: var integer): cint {.importc: "clacp2_".}
  
  proc clapack_clacpy*(uplo: var cstring; m: var integer; n: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer): cint {.importc: "clacpy_".}
  
  proc clapack_clacrm*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; b: ptr real; ldb: var integer;                c: ptr complex; ldc: var integer; rwork: ptr real): cint {.importc: "clacrm_".}
  
  proc clapack_clacrt*(n: var integer; cx: ptr complex; incx: var integer;                cy: ptr complex; incy: var integer; c: ptr complex;                s: ptr complex): cint {.importc: "clacrt_".}
  # Complex 
  proc clapack_cladiv*(ret_val: ptr complex; x: ptr complex; y: ptr complex): void {.importc: "cladiv_".}
  
  proc clapack_claed0*(qsiz: var integer; n: var integer; d: ptr real; e: ptr real;                q: ptr complex; ldq: var integer; qstore: ptr complex;                ldqs: var integer; rwork: ptr real; iwork: var integer;                info: var integer): cint {.importc: "claed0_".}
  
  proc clapack_claed7*(n: var integer; cutpnt: var integer; qsiz: var integer;                tlvls: var integer; curlvl: var integer; curpbm: var integer;                d: ptr real; q: ptr complex; ldq: var integer; rho: ptr real;                indxq: var integer; qstore: ptr real; qptr: var integer;                prmptr: var integer; perm: var integer; givptr: var integer;                givcol: var integer; givnum: ptr real; work: ptr complex;                rwork: ptr real; iwork: var integer; info: var integer): cint {.importc: "claed7_".}
  
  proc clapack_claed8*(k: var integer; n: var integer; qsiz: var integer;                q: ptr complex; ldq: var integer; d: ptr real; rho: ptr real;                cutpnt: var integer; z: ptr real; dlamda: ptr real;                q2: ptr complex; ldq2: var integer; w: ptr real;                indxp: var integer; indx: var integer; indxq: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                givnum: ptr real; info: var integer): cint {.importc: "claed8_".}
  
  proc clapack_claein*(rightv: ptr logical; noinit: ptr logical; n: var integer;                h: ptr complex; ldh: var integer; w: ptr complex;                v: ptr complex; b: ptr complex; ldb: var integer;                rwork: ptr real; eps3: ptr real; smlnum: ptr real;                info: var integer): cint {.importc: "claein_".}
  
  proc clapack_claesy*(a: ptr complex; b: ptr complex; c: ptr complex;                rt1: ptr complex; rt2: ptr complex; evscal: ptr complex;                cs1: ptr complex; sn1: ptr complex): cint {.importc: "claesy_".}
  
  proc clapack_claev2*(a: ptr complex; b: ptr complex; c: ptr complex; rt1: ptr real;                rt2: ptr real; cs1: ptr real; sn1: ptr complex): cint {.importc: "claev2_".}
  
  proc clapack_clag2z*(m: var integer; n: var integer; sa: ptr complex;                ldsa: var integer; a: ptr doublecomplex; lda: var integer;                info: var integer): cint {.importc: "clag2z_".}
  
  proc clapack_clags2*(upper: ptr logical; a1: ptr real; a2: ptr complex; a3: ptr real;                b1: ptr real; b2: ptr complex; b3: ptr real; csu: ptr real;                snu: ptr complex; csv: ptr real; snv: ptr complex;                csq: ptr real; snq: ptr complex): cint {.importc: "clags2_".}
  
  proc clapack_clagtm*(trans: var cstring; n: var integer; nrhs: var integer;                alpha: ptr real; dl: ptr complex; d: ptr complex;                du: ptr complex; x: ptr complex; ldx: var integer;                beta: ptr real; b: ptr complex; ldb: var integer): cint {.importc: "clagtm_".}
  
  proc clapack_clahef*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;                a: ptr complex; lda: var integer; ipiv: var cint;                w: ptr complex; ldw: var integer; info: var integer): cint {.importc: "clahef_".}
  
  proc clapack_clahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr complex;                ldh: var integer; w: ptr complex; iloz: var integer;                ihiz: var integer; z: ptr complex; ldz: var integer;                info: var integer): cint {.importc: "clahqr_".}
  
  proc clapack_clahr2*(n: var integer; k: var integer; nb: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; t: ptr complex;                ldt: var integer; y: ptr complex; ldy: var integer): cint {.importc: "clahr2_".}
  
  proc clapack_clahrd*(n: var integer; k: var integer; nb: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; t: ptr complex;                ldt: var integer; y: ptr complex; ldy: var integer): cint {.importc: "clahrd_".}
  
  proc clapack_claic1*(job: var integer; j: var integer; x: ptr complex;                sest: ptr real; w: ptr complex; gamma: ptr complex;                sestpr: ptr real; s: ptr complex; c: ptr complex): cint {.importc: "claic1_".}
  
  proc clapack_clals0*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; nrhs: var integer; b: ptr complex;                ldb: var integer; bx: ptr complex; ldbx: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                ldgcol: var integer; givnum: ptr real; ldgnum: var integer;                poles: ptr real; difl: ptr real; difr: ptr real; z: ptr real;                k: var integer; c: ptr real; s: ptr real; rwork: ptr real;                info: var integer): cint {.importc: "clals0_".}
  
  proc clapack_clalsa*(icompq: var integer; smlsiz: var integer; n: var integer;                nrhs: var integer; b: ptr complex; ldb: var integer;                bx: ptr complex; ldbx: var integer; u: ptr real;                ldu: var integer; vt: ptr real; k: var integer; difl: ptr real;                difr: ptr real; z: ptr real; poles: ptr real;                givptr: var integer; givcol: var integer; ldgcol: var integer;                perm: var integer; givnum: ptr real; c: ptr real; s: ptr real;                rwork: ptr real; iwork: var integer; info: var integer): cint {.importc: "clalsa_".}
  
  proc clapack_clalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;                nrhs: var integer; d: ptr real; e: ptr real; b: ptr complex;                ldb: var integer; rcond: ptr real; rank: var integer;                work: ptr complex; rwork: ptr real; iwork: var integer;                info: var integer): cint {.importc: "clalsd_".}
  proc clapack_clangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr complex; ldab: var integer; work: ptr real): doublereal {.importc: "clangb_".}
  proc clapack_clange*(norm: var cstring; m: var integer; n: var integer; a: ptr complex;                lda: var integer; work: ptr real): doublereal {.importc: "clange_".}
  proc clapack_clangt*(norm: var cstring; n: var integer; dl: ptr complex;                d: ptr complex; du: ptr complex): doublereal {.importc: "clangt_".}
  proc clapack_clanhb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;                ab: ptr complex; ldab: var integer; work: ptr real): doublereal {.importc: "clanhb_".}
  proc clapack_clanhe*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr complex;                lda: var integer; work: ptr real): doublereal {.importc: "clanhe_".}
  proc clapack_clanhf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;                a: ptr complex; work: ptr real): doublereal {.importc: "clanhf_".}
  proc clapack_clanhp*(norm: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;                work: ptr real): doublereal {.importc: "clanhp_".}
  proc clapack_clanhs*(norm: var cstring; n: var integer; a: ptr complex; lda: var integer;                work: ptr real): doublereal {.importc: "clanhs_".}
  proc clapack_clanht*(norm: var cstring; n: var integer; d: ptr real; e: ptr complex): doublereal {.importc: "clanht_".}
  proc clapack_clansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;                ab: ptr complex; ldab: var integer; work: ptr real): doublereal {.importc: "clansb_".}
  proc clapack_clansp*(norm: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;                work: ptr real): doublereal {.importc: "clansp_".}
  proc clapack_clansy*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr complex;                lda: var integer; work: ptr real): doublereal {.importc: "clansy_".}
  proc clapack_clantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                k: var integer; ab: ptr complex; ldab: var integer;                work: ptr real): doublereal {.importc: "clantb_".}
  proc clapack_clantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr complex; work: ptr real): doublereal {.importc: "clantp_".}
  proc clapack_clantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;                n: var integer; a: ptr complex; lda: var integer; work: ptr real): doublereal {.importc: "clantr_".}
  
  proc clapack_clapll*(n: var integer; x: ptr complex; incx: var integer;                y: ptr complex; incy: var integer; ssmin: ptr real): cint {.importc: "clapll_".}
  
  proc clapack_clapmt*(forwrd: ptr logical; m: var integer; n: var integer;                x: ptr complex; ldx: var integer; k: var integer): cint {.importc: "clapmt_".}
  
  proc clapack_claqgb*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr complex; ldab: var integer;                r: ptr real; c: ptr real; rowcnd: ptr real;                colcnd: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqgb_".}
  
  proc clapack_claqge*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; r: ptr real; c: ptr real;                rowcnd: ptr real; colcnd: ptr real; amax: ptr real;                equed: var cstring): cint {.importc: "claqge_".}
  
  proc clapack_claqhb*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;                equed: var cstring): cint {.importc: "claqhb_".}
  
  proc clapack_claqhe*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                s: ptr real; scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqhe_".}
  
  proc clapack_claqhp*(uplo: var cstring; n: var integer; ap: ptr complex; s: ptr real;                scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqhp_".}
  
  proc clapack_claqp2*(m: var integer; n: var integer; offset: var integer;                a: ptr complex; lda: var integer; jpvt: var integer;                tau: ptr complex; vn1: ptr real; vn2: ptr real;                work: ptr complex): cint {.importc: "claqp2_".}
  
  proc clapack_claqps*(m: var integer; n: var integer; offset: var integer;                nb: var integer; kb: var integer; a: ptr complex;                lda: var integer; jpvt: var integer; tau: ptr complex;                vn1: ptr real; vn2: ptr real; auxv: ptr complex; f: ptr complex;                ldf: var integer): cint {.importc: "claqps_".}
  
  proc clapack_claqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr complex;                ldh: var integer; w: ptr complex; iloz: var integer;                ihiz: var integer; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "claqr0_".}
  
  proc clapack_claqr1*(n: var integer; h: ptr complex; ldh: var integer;                s1: ptr complex; s2: ptr complex; v: ptr complex): cint {.importc: "claqr1_".}
  
  proc clapack_claqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr complex; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr complex; ldz: var integer;                ns: var integer; nd: var integer; sh: ptr complex;                v: ptr complex; ldv: var integer; nh: var integer;                t: ptr complex; ldt: var integer; nv: var integer;                wv: ptr complex; ldwv: var integer; work: ptr complex;                lwork: var integer): cint {.importc: "claqr2_".}
  
  proc clapack_claqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr complex; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr complex; ldz: var integer;                ns: var integer; nd: var integer; sh: ptr complex;                v: ptr complex; ldv: var integer; nh: var integer;                t: ptr complex; ldt: var integer; nv: var integer;                wv: ptr complex; ldwv: var integer; work: ptr complex;                lwork: var integer): cint {.importc: "claqr3_".}
  
  proc clapack_claqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr complex;                ldh: var integer; w: ptr complex; iloz: var integer;                ihiz: var integer; z: ptr complex; ldz: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "claqr4_".}
  
  proc clapack_claqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;                n: var integer; ktop: var integer; kbot: var integer;                nshfts: var integer; s: ptr complex; h: ptr complex;                ldh: var integer; iloz: var integer; ihiz: var integer;                z: ptr complex; ldz: var integer; v: ptr complex;                ldv: var integer; u: ptr complex; ldu: var integer;                nv: var integer; wv: ptr complex; ldwv: var integer;                nh: var integer; wh: ptr complex; ldwh: var integer): cint {.importc: "claqr5_".}
  
  proc clapack_claqsb*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;                equed: var cstring): cint {.importc: "claqsb_".}
  
  proc clapack_claqsp*(uplo: var cstring; n: var integer; ap: ptr complex; s: ptr real;                scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqsp_".}
  
  proc clapack_claqsy*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                s: ptr real; scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqsy_".}
  
  proc clapack_clar1v*(n: var integer; b1: var integer; bn: var integer;                lambdas: ptr real; d: ptr real; l: ptr real; ld: ptr real;                lld: ptr real; pivmin: ptr real; gaptol: ptr real;                z: ptr complex; wantnc: ptr logical; negcnt: var integer;                ztz: ptr real; mingma: ptr real; r: var integer;                isuppz: var integer; nrminv: ptr real; resid: ptr real;                rqcorr: ptr real; work: ptr real): cint {.importc: "clar1v_".}
  
  proc clapack_clar2v*(n: var integer; x: ptr complex; y: ptr complex;                z: ptr complex; incx: var integer; c: ptr real;                s: ptr complex; incc: var integer): cint {.importc: "clar2v_".}
  
  proc clapack_clarcm*(m: var integer; n: var integer; a: ptr real; lda: var integer;                b: ptr complex; ldb: var integer; c: ptr complex;                ldc: var integer; rwork: ptr real): cint {.importc: "clarcm_".}
  
  proc clapack_clarf*(side: var cstring; m: var integer; n: var integer; v: ptr complex;               incv: var integer; tau: ptr complex; c: ptr complex;               ldc: var integer; work: ptr complex): cint {.importc: "clarf_".}
  
  proc clapack_clarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer; v: ptr complex;                ldv: var integer; t: ptr complex; ldt: var integer;                c: ptr complex; ldc: var integer; work: ptr complex;                ldwork: var integer): cint {.importc: "clarfb_".}
  
  proc clapack_clarfg*(n: var integer; alpha: ptr complex; x: ptr complex;                incx: var integer; tau: ptr complex): cint {.importc: "clarfg_".}
  
  proc clapack_clarfp*(n: var integer; alpha: ptr complex; x: ptr complex;                incx: var integer; tau: ptr complex): cint {.importc: "clarfp_".}
  
  proc clapack_clarft*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr complex; ldv: var integer;                tau: ptr complex; t: ptr complex; ldt: var integer): cint {.importc: "clarft_".}
  
  proc clapack_clarfx*(side: var cstring; m: var integer; n: var integer; v: ptr complex;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex): cint {.importc: "clarfx_".}
  
  proc clapack_clargv*(n: var integer; x: ptr complex; incx: var integer;                y: ptr complex; incy: var integer; c: ptr real;                incc: var integer): cint {.importc: "clargv_".}
  
  proc clapack_clarnv*(idist: var integer; iseed: var integer; n: var integer;                x: ptr complex): cint {.importc: "clarnv_".}
  
  proc clapack_clarrv*(n: var integer; vl: ptr real; vu: ptr real; d: ptr real;                l: ptr real; pivmin: ptr real; isplit: var integer;                m: var integer; dol: var integer; dou: var integer;                minrgp: ptr real; rtol1: ptr real; rtol2: ptr real; w: ptr real;                werr: ptr real; wgap: ptr real; iblock: var integer;                indexw: var integer; gers: ptr real; z: ptr complex;                ldz: var integer; isuppz: var integer; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "clarrv_".}
  
  proc clapack_clarscl2*(m: var integer; n: var integer; d: ptr real; x: ptr complex;                  ldx: var integer): cint {.importc: "clarscl2_".}
  
  proc clapack_clartg*(f: ptr complex; g: ptr complex; cs: ptr real; sn: ptr complex;                r: ptr complex): cint {.importc: "clartg_".}
  
  proc clapack_clartv*(n: var integer; x: ptr complex; incx: var integer;                y: ptr complex; incy: var integer; c: ptr real;                s: ptr complex; incc: var integer): cint {.importc: "clartv_".}
  
  proc clapack_clarz*(side: var cstring; m: var integer; n: var integer; l: var integer;               v: ptr complex; incv: var integer; tau: ptr complex;               c: ptr complex; ldc: var integer; work: ptr complex): cint {.importc: "clarz_".}
  
  proc clapack_clarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer; l: var integer;                v: ptr complex; ldv: var integer; t: ptr complex;                ldt: var integer; c: ptr complex; ldc: var integer;                work: ptr complex; ldwork: var integer): cint {.importc: "clarzb_".}
  
  proc clapack_clarzt*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr complex; ldv: var integer;                tau: ptr complex; t: ptr complex; ldt: var integer): cint {.importc: "clarzt_".}
  
  proc clapack_clascl*(ctype: var cstring; kl: var integer; ku: var integer;                cfrom: ptr real; cto: ptr real; m: var integer; n: var integer;                a: ptr complex; lda: var integer; info: var integer): cint {.importc: "clascl_".}
  
  proc clapack_clascl2*(m: var integer; n: var integer; d: ptr real; x: ptr complex;                 ldx: var integer): cint {.importc: "clascl2_".}
  
  proc clapack_claset*(uplo: var cstring; m: var integer; n: var integer;                alpha: ptr complex; beta: ptr complex; a: ptr complex;                lda: var integer): cint {.importc: "claset_".}
  
  proc clapack_clasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;               n: var integer; c: ptr real; s: ptr real; a: ptr complex;               lda: var integer): cint {.importc: "clasr_".}
  
  proc clapack_classq*(n: var integer; x: ptr complex; incx: var integer;                scale: ptr real; sumsq: ptr real): cint {.importc: "classq_".}
  
  proc clapack_claswp*(n: var integer; a: ptr complex; lda: var integer;                k1: var integer; k2: var integer; ipiv: var cint;                incx: var integer): cint {.importc: "claswp_".}
  
  proc clapack_clasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;                a: ptr complex; lda: var integer; ipiv: var cint;                w: ptr complex; ldw: var integer; info: var integer): cint {.importc: "clasyf_".}
  
  proc clapack_clatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; x: ptr complex; scale: ptr real;                cnorm: ptr real; info: var integer): cint {.importc: "clatbs_".}
  
  proc clapack_clatdf*(ijob: var integer; n: var integer; z: ptr complex;                ldz: var integer; rhs: ptr complex; rdsum: ptr real;                rdscal: ptr real; ipiv: var cint; jpiv: var cint): cint {.importc: "clatdf_".}
  
  proc clapack_clatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; ap: ptr complex; x: ptr complex;                scale: ptr real; cnorm: ptr real; info: var integer): cint {.importc: "clatps_".}
  
  proc clapack_clatrd*(uplo: var cstring; n: var integer; nb: var integer; a: ptr complex;                lda: var integer; e: ptr real; tau: ptr complex; w: ptr complex;                ldw: var integer): cint {.importc: "clatrd_".}
  
  proc clapack_clatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; a: ptr complex; lda: var integer;                x: ptr complex; scale: ptr real; cnorm: ptr real;                info: var integer): cint {.importc: "clatrs_".}
  
  proc clapack_clatrz*(m: var integer; n: var integer; l: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex): cint {.importc: "clatrz_".}
  
  proc clapack_clatzm*(side: var cstring; m: var integer; n: var integer; v: ptr complex;                incv: var integer; tau: ptr complex; c1: ptr complex;                c2: ptr complex; ldc: var integer; work: ptr complex): cint {.importc: "clatzm_".}
  
  proc clapack_clauu2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                info: var integer): cint {.importc: "clauu2_".}
  
  proc clapack_clauum*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                info: var integer): cint {.importc: "clauum_".}
  
  proc clapack_cpbcon*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; anorm: ptr real; rcond: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cpbcon_".}
  
  proc clapack_cpbequ*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;                info: var integer): cint {.importc: "cpbequ_".}
  
  proc clapack_cpbrfs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr complex; ldab: var integer;                afb: ptr complex; ldafb: var integer; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cpbrfs_".}
  
  proc clapack_cpbstf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; info: var integer): cint {.importc: "cpbstf_".}
  
  proc clapack_cpbsv*(uplo: var cstring; n: var integer; kd: var integer;               nrhs: var integer; ab: ptr complex; ldab: var integer;               b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cpbsv_".}
  
  proc clapack_cpbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr complex; ldab: var integer;                afb: ptr complex; ldafb: var integer; equed: var cstring;                s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cpbsvx_".}
  
  proc clapack_cpbtf2*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; info: var integer): cint {.importc: "cpbtf2_".}
  
  proc clapack_cpbtrf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;                ldab: var integer; info: var integer): cint {.importc: "cpbtrf_".}
  
  proc clapack_cpbtrs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr complex; ldab: var integer;                b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cpbtrs_".}
  
  proc clapack_cpftrf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr complex;                info: var integer): cint {.importc: "cpftrf_".}
  
  proc clapack_cpftri*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr complex;                info: var integer): cint {.importc: "cpftri_".}
  
  proc clapack_cpftrs*(transr: var cstring; uplo: var cstring; n: var integer;                nrhs: var integer; a: ptr complex; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "cpftrs_".}
  
  proc clapack_cpocon*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                anorm: ptr real; rcond: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cpocon_".}
  
  proc clapack_cpoequ*(n: var integer; a: ptr complex; lda: var integer; s: ptr real;                scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "cpoequ_".}
  
  proc clapack_cpoequb*(n: var integer; a: ptr complex; lda: var integer; s: ptr real;                 scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "cpoequb_".}
  
  proc clapack_cporfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; b: ptr complex; ldb: var integer;                x: ptr complex; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cporfs_".}
  
  proc clapack_cporfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; s: ptr real;                 b: ptr complex; ldb: var integer; x: ptr complex;                 ldx: var integer; rcond: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr complex; rwork: ptr real;                 info: var integer): cint {.importc: "cporfsx_".}
  
  proc clapack_cposv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr complex;               lda: var integer; b: ptr complex; ldb: var integer;               info: var integer): cint {.importc: "cposv_".}
  
  proc clapack_cposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; equed: var cstring; s: ptr real; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cposvx_".}
  
  proc clapack_cposvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; equed: var cstring;                 s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;                 ldx: var integer; rcond: ptr real; rpvgrw: ptr real;                 berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr complex;                 rwork: ptr real; info: var integer): cint {.importc: "cposvxx_".}
  
  proc clapack_cpotf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                info: var integer): cint {.importc: "cpotf2_".}
  
  proc clapack_cpotrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                info: var integer): cint {.importc: "cpotrf_".}
  
  proc clapack_cpotri*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                info: var integer): cint {.importc: "cpotri_".}
  
  proc clapack_cpotrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "cpotrs_".}
  
  proc clapack_cppcon*(uplo: var cstring; n: var integer; ap: ptr complex; anorm: ptr real;                rcond: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cppcon_".}
  
  proc clapack_cppequ*(uplo: var cstring; n: var integer; ap: ptr complex; s: ptr real;                scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "cppequ_".}
  
  proc clapack_cpprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; afp: ptr complex; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cpprfs_".}
  
  proc clapack_cppsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr complex; b: ptr complex; ldb: var integer;               info: var integer): cint {.importc: "cppsv_".}
  
  proc clapack_cppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; afp: ptr complex; equed: var cstring; s: ptr real;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cppsvx_".}
  
  proc clapack_cpptrf*(uplo: var cstring; n: var integer; ap: ptr complex;                info: var integer): cint {.importc: "cpptrf_".}
  
  proc clapack_cpptri*(uplo: var cstring; n: var integer; ap: ptr complex;                info: var integer): cint {.importc: "cpptri_".}
  
  proc clapack_cpptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; b: ptr complex; ldb: var integer;                info: var integer): cint {.importc: "cpptrs_".}
  
  proc clapack_cpstf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                piv: var integer; rank: var integer; tol: ptr real;                work: ptr real; info: var integer): cint {.importc: "cpstf2_".}
  
  proc clapack_cpstrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                piv: var integer; rank: var integer; tol: ptr real;                work: ptr real; info: var integer): cint {.importc: "cpstrf_".}
  
  proc clapack_cptcon*(n: var integer; d: ptr real; e: ptr complex; anorm: ptr real;                rcond: ptr real; rwork: ptr real; info: var integer): cint {.importc: "cptcon_".}
  
  proc clapack_cpteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr complex; ldz: var integer; work: ptr real;                info: var integer): cint {.importc: "cpteqr_".}
  
  proc clapack_cptrfs*(uplo: var cstring; n: var integer; nrhs: var integer; d: ptr real;                e: ptr complex; df: ptr real; ef: ptr complex; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "cptrfs_".}
  
  proc clapack_cptsv*(n: var integer; nrhs: var integer; d: ptr real; e: ptr complex;               b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cptsv_".}
  
  proc clapack_cptsvx*(fact: var cstring; n: var integer; nrhs: var integer; d: ptr real;                e: ptr complex; df: ptr real; ef: ptr complex; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cptsvx_".}
  
  proc clapack_cpttrf*(n: var integer; d: ptr real; e: ptr complex; info: var integer): cint {.importc: "cpttrf_".}
  
  proc clapack_cpttrs*(uplo: var cstring; n: var integer; nrhs: var integer; d: ptr real;                e: ptr complex; b: ptr complex; ldb: var integer;                info: var integer): cint {.importc: "cpttrs_".}
  
  proc clapack_cptts2*(iuplo: var integer; n: var integer; nrhs: var integer;                d: ptr real; e: ptr complex; b: ptr complex; ldb: var integer): cint {.importc: "cptts2_".}
  
  proc clapack_crot*(n: var integer; cx: ptr complex; incx: var integer;              cy: ptr complex; incy: var integer; c: ptr real; s: ptr complex): cint {.importc: "crot_".}
  
  proc clapack_cspcon*(uplo: var cstring; n: var integer; ap: ptr complex;                ipiv: var cint; anorm: ptr real; rcond: ptr real;                work: ptr complex; info: var integer): cint {.importc: "cspcon_".}
  
  proc clapack_cspmv*(uplo: var cstring; n: var integer; alpha: ptr complex;               ap: ptr complex; x: ptr complex; incx: var integer;               beta: ptr complex; y: ptr complex; incy: var integer): cint {.importc: "cspmv_".}
  
  proc clapack_cspr*(uplo: var cstring; n: var integer; alpha: ptr complex; x: ptr complex;              incx: var integer; ap: ptr complex): cint {.importc: "cspr_".}
  
  proc clapack_csprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; afp: ptr complex; ipiv: var cint;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "csprfs_".}
  
  proc clapack_cspsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr complex; ipiv: var cint; b: ptr complex;               ldb: var integer; info: var integer): cint {.importc: "cspsv_".}
  
  proc clapack_cspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; afp: ptr complex; ipiv: var cint;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "cspsvx_".}
  
  proc clapack_csptrf*(uplo: var cstring; n: var integer; ap: ptr complex;                ipiv: var cint; info: var integer): cint {.importc: "csptrf_".}
  
  proc clapack_csptri*(uplo: var cstring; n: var integer; ap: ptr complex;                ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "csptri_".}
  
  proc clapack_csptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr complex; ipiv: var cint; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "csptrs_".}
  
  proc clapack_csrscl*(n: var integer; sa: ptr real; sx: ptr complex; incx: var integer): cint {.importc: "csrscl_".}
  
  proc clapack_cstedc*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr complex; ldz: var integer; work: ptr complex;                lwork: var integer; rwork: ptr real; lrwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "cstedc_".}
  
  proc clapack_cstegr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;                e: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr complex; ldz: var integer; isuppz: var integer;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "cstegr_".}
  
  proc clapack_cstein*(n: var integer; d: ptr real; e: ptr real; m: var integer;                w: ptr real; iblock: var integer; isplit: var integer;                z: ptr complex; ldz: var integer; work: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "cstein_".}
  
  proc clapack_cstemr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;                e: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; m: var integer; w: ptr real; z: ptr complex;                ldz: var integer; nzc: var integer; isuppz: var integer;                tryrac: ptr logical; work: ptr real; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "cstemr_".}
  
  proc clapack_csteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr complex; ldz: var integer; work: ptr real;                info: var integer): cint {.importc: "csteqr_".}
  
  proc clapack_csycon*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; anorm: ptr real; rcond: ptr real;                work: ptr complex; info: var integer): cint {.importc: "csycon_".}
  
  proc clapack_csyequb*(uplo: var cstring; n: var integer; a: ptr complex;                 lda: var integer; s: ptr real; scond: ptr real; amax: ptr real;                 work: ptr complex; info: var integer): cint {.importc: "csyequb_".}
  
  proc clapack_csymv*(uplo: var cstring; n: var integer; alpha: ptr complex;               a: ptr complex; lda: var integer; x: ptr complex;               incx: var integer; beta: ptr complex; y: ptr complex;               incy: var integer): cint {.importc: "csymv_".}
  
  proc clapack_csyr*(uplo: var cstring; n: var integer; alpha: ptr complex; x: ptr complex;              incx: var integer; a: ptr complex; lda: var integer): cint {.importc: "csyr_".}
  
  proc clapack_csyrfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; ipiv: var cint; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "csyrfs_".}
  
  proc clapack_csyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; ipiv: var cint;                 s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;                 ldx: var integer; rcond: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr complex; rwork: ptr real;                 info: var integer): cint {.importc: "csyrfsx_".}
  
  proc clapack_csysv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr complex;               lda: var integer; ipiv: var cint; b: ptr complex;               ldb: var integer; work: ptr complex; lwork: var integer;               info: var integer): cint {.importc: "csysv_".}
  
  proc clapack_csysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; af: ptr complex;                ldaf: var integer; ipiv: var cint; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real;                work: ptr complex; lwork: var integer; rwork: ptr real;                info: var integer): cint {.importc: "csysvx_".}
  
  proc clapack_csysvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr complex; lda: var integer;                 af: ptr complex; ldaf: var integer; ipiv: var cint;                 equed: var cstring; s: ptr real; b: ptr complex; ldb: var integer;                 x: ptr complex; ldx: var integer; rcond: ptr real;                 rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr complex;                 rwork: ptr real; info: var integer): cint {.importc: "csysvxx_".}
  
  proc clapack_csytf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; info: var integer): cint {.importc: "csytf2_".}
  
  proc clapack_csytrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "csytrf_".}
  
  proc clapack_csytri*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "csytri_".}
  
  proc clapack_csytrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr complex; lda: var integer; ipiv: var cint;                b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "csytrs_".}
  
  proc clapack_ctbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                kd: var integer; ab: ptr complex; ldab: var integer;                rcond: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "ctbcon_".}
  
  proc clapack_ctbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr complex;                ldab: var integer; b: ptr complex; ldb: var integer;                x: ptr complex; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr complex; rwork: ptr real;                info: var integer): cint {.importc: "ctbrfs_".}
  
  proc clapack_ctbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr complex;                ldab: var integer; b: ptr complex; ldb: var integer;                info: var integer): cint {.importc: "ctbtrs_".}
  
  proc clapack_ctfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;               diag: var cstring; m: var integer; n: var integer;               alpha: ptr complex; a: ptr complex; b: ptr complex;               ldb: var integer): cint {.importc: "ctfsm_".}
  
  proc clapack_ctftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr complex; info: var integer): cint {.importc: "ctftri_".}
  
  proc clapack_ctfttp*(transr: var cstring; uplo: var cstring; n: var integer;                arf: ptr complex; ap: ptr complex; info: var integer): cint {.importc: "ctfttp_".}
  
  proc clapack_ctfttr*(transr: var cstring; uplo: var cstring; n: var integer;                arf: ptr complex; a: ptr complex; lda: var integer;                info: var integer): cint {.importc: "ctfttr_".}
  
  proc clapack_ctgevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; s: ptr complex; lds: var integer;                p: ptr complex; ldp: var integer; vl: ptr complex;                ldvl: var integer; vr: ptr complex; ldvr: var integer;                mm: var integer; m: var integer; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "ctgevc_".}
  
  proc clapack_ctgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; q: ptr complex; ldq: var integer;                z: ptr complex; ldz: var integer; j1: var integer;                info: var integer): cint {.importc: "ctgex2_".}
  
  proc clapack_ctgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; q: ptr complex; ldq: var integer;                z: ptr complex; ldz: var integer; ifst: var integer;                ilst: var integer; info: var integer): cint {.importc: "ctgexc_".}
  
  proc clapack_ctgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;                select: ptr logical; n: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                alpha: ptr complex; beta: ptr complex; q: ptr complex;                ldq: var integer; z: ptr complex; ldz: var integer;                m: var integer; pl: ptr real; pr: ptr real; dif: ptr real;                work: ptr complex; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "ctgsen_".}
  
  proc clapack_ctgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; k: var integer; l: var integer;                a: ptr complex; lda: var integer; b: ptr complex;                ldb: var integer; tola: ptr real; tolb: ptr real;                alpha: ptr real; beta: ptr real; u: ptr complex;                ldu: var integer; v: ptr complex; ldv: var integer;                q: ptr complex; ldq: var integer; work: ptr complex;                ncycle: var integer; info: var integer): cint {.importc: "ctgsja_".}
  
  proc clapack_ctgsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; vl: ptr complex;                ldvl: var integer; vr: ptr complex; ldvr: var integer;                s: ptr real; dif: ptr real; mm: var integer; m: var integer;                work: ptr complex; lwork: var integer; iwork: var integer;                info: var integer): cint {.importc: "ctgsna_".}
  
  proc clapack_ctgsy2*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; c: ptr complex;                ldc: var integer; d: ptr complex; ldd: var integer;                e: ptr complex; lde: var integer; f: ptr complex;                ldf: var integer; scale: ptr real; rdsum: ptr real;                rdscal: ptr real; info: var integer): cint {.importc: "ctgsy2_".}
  
  proc clapack_ctgsyl*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; c: ptr complex;                ldc: var integer; d: ptr complex; ldd: var integer;                e: ptr complex; lde: var integer; f: ptr complex;                ldf: var integer; scale: ptr real; dif: ptr real;                work: ptr complex; lwork: var integer; iwork: var integer;                info: var integer): cint {.importc: "ctgsyl_".}
  
  proc clapack_ctpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr complex; rcond: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "ctpcon_".}
  
  proc clapack_ctprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr complex; b: ptr complex;                ldb: var integer; x: ptr complex; ldx: var integer;                ferr: ptr real; berr: ptr real; work: ptr complex;                rwork: ptr real; info: var integer): cint {.importc: "ctprfs_".}
  
  proc clapack_ctptri*(uplo: var cstring; diag: var cstring; n: var integer; ap: ptr complex;                info: var integer): cint {.importc: "ctptri_".}
  
  proc clapack_ctptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr complex; b: ptr complex;                ldb: var integer; info: var integer): cint {.importc: "ctptrs_".}
  
  proc clapack_ctpttf*(transr: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;                arf: ptr complex; info: var integer): cint {.importc: "ctpttf_".}
  
  proc clapack_ctpttr*(uplo: var cstring; n: var integer; ap: ptr complex; a: ptr complex;                lda: var integer; info: var integer): cint {.importc: "ctpttr_".}
  
  proc clapack_ctrcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr complex; lda: var integer; rcond: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "ctrcon_".}
  
  proc clapack_ctrevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr complex; ldt: var integer;                vl: ptr complex; ldvl: var integer; vr: ptr complex;                ldvr: var integer; mm: var integer; m: var integer;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "ctrevc_".}
  
  proc clapack_ctrexc*(compq: var cstring; n: var integer; t: ptr complex;                ldt: var integer; q: ptr complex; ldq: var integer;                ifst: var integer; ilst: var integer; info: var integer): cint {.importc: "ctrexc_".}
  
  proc clapack_ctrrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; x: ptr complex;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "ctrrfs_".}
  
  proc clapack_ctrsen*(job: var cstring; compq: var cstring; select: ptr logical;                n: var integer; t: ptr complex; ldt: var integer;                q: ptr complex; ldq: var integer; w: ptr complex;                m: var integer; s: ptr real; sep: ptr real; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "ctrsen_".}
  
  proc clapack_ctrsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr complex; ldt: var integer;                vl: ptr complex; ldvl: var integer; vr: ptr complex;                ldvr: var integer; s: ptr real; sep: ptr real; mm: var integer;                m: var integer; work: ptr complex; ldwork: var integer;                rwork: ptr real; info: var integer): cint {.importc: "ctrsna_".}
  
  proc clapack_ctrsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;                m: var integer; n: var integer; a: ptr complex;                lda: var integer; b: ptr complex; ldb: var integer;                c: ptr complex; ldc: var integer; scale: ptr real;                info: var integer): cint {.importc: "ctrsyl_".}
  
  proc clapack_ctrti2*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr complex;                lda: var integer; info: var integer): cint {.importc: "ctrti2_".}
  
  proc clapack_ctrtri*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr complex;                lda: var integer; info: var integer): cint {.importc: "ctrtri_".}
  
  proc clapack_ctrtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr complex; lda: var integer;                b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "ctrtrs_".}
  
  proc clapack_ctrttf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr complex;                lda: var integer; arf: ptr complex; info: var integer): cint {.importc: "ctrttf_".}
  
  proc clapack_ctrttp*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                ap: ptr complex; info: var integer): cint {.importc: "ctrttp_".}
  
  proc clapack_ctzrqf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; info: var integer): cint {.importc: "ctzrqf_".}
  
  proc clapack_ctzrzf*(m: var integer; n: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "ctzrzf_".}
  
  proc clapack_cung2l*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cung2l_".}
  
  proc clapack_cung2r*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cung2r_".}
  
  proc clapack_cungbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;                a: ptr complex; lda: var integer; tau: ptr complex;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cungbr_".}
  
  proc clapack_cunghr*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr complex; lda: var integer; tau: ptr complex;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunghr_".}
  
  proc clapack_cungl2*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cungl2_".}
  
  proc clapack_cunglq*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cunglq_".}
  
  proc clapack_cungql*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cungql_".}
  
  proc clapack_cungqr*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cungqr_".}
  
  proc clapack_cungr2*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                info: var integer): cint {.importc: "cungr2_".}
  
  proc clapack_cungrq*(m: var integer; n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; work: ptr complex;                lwork: var integer; info: var integer): cint {.importc: "cungrq_".}
  
  proc clapack_cungtr*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "cungtr_".}
  
  proc clapack_cunm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; info: var integer): cint {.importc: "cunm2l_".}
  
  proc clapack_cunm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; info: var integer): cint {.importc: "cunm2r_".}
  
  proc clapack_cunmbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;                n: var integer; k: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; c: ptr complex;                ldc: var integer; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "cunmbr_".}
  
  proc clapack_cunmhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                ilo: var integer; ihi: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; c: ptr complex;                ldc: var integer; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "cunmhr_".}
  
  proc clapack_cunml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; info: var integer): cint {.importc: "cunml2_".}
  
  proc clapack_cunmlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmlq_".}
  
  proc clapack_cunmql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmql_".}
  
  proc clapack_cunmqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmqr_".}
  
  proc clapack_cunmr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; info: var integer): cint {.importc: "cunmr2_".}
  
  proc clapack_cunmr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; c: ptr complex;                ldc: var integer; work: ptr complex; info: var integer): cint {.importc: "cunmr3_".}
  
  proc clapack_cunmrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmrq_".}
  
  proc clapack_cunmrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr complex;                lda: var integer; tau: ptr complex; c: ptr complex;                ldc: var integer; work: ptr complex; lwork: var integer;                info: var integer): cint {.importc: "cunmrz_".}
  
  proc clapack_cunmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; a: ptr complex; lda: var integer;                tau: ptr complex; c: ptr complex; ldc: var integer;                work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmtr_".}
  
  proc clapack_cupgtr*(uplo: var cstring; n: var integer; ap: ptr complex;                tau: ptr complex; q: ptr complex; ldq: var integer;                work: ptr complex; info: var integer): cint {.importc: "cupgtr_".}
  
  proc clapack_cupmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; ap: ptr complex; tau: ptr complex;                c: ptr complex; ldc: var integer; work: ptr complex;                info: var integer): cint {.importc: "cupmtr_".}
  
  #___________________________________________________________________________
  #
  # Real, double precision
  #___________________________________________________________________________

  proc clapack_dbdsdc*(uplo: var cstring; compq: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; u: ptr doublereal;                ldu: var integer; vt: ptr doublereal; ldvt: var integer;                q: ptr doublereal; iq: var integer; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dbdsdc_".}
  
  proc clapack_dbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;                nru: var integer; ncc: var integer; d: ptr doublereal;                e: ptr doublereal; vt: ptr doublereal; ldvt: var integer;                u: ptr doublereal; ldu: var integer; c: ptr doublereal;                ldc: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dbdsqr_".}
  
  proc clapack_ddisna*(job: var cstring; m: var integer; n: var integer;                d: ptr doublereal; sep: ptr doublereal; info: var integer): cint {.importc: "ddisna_".}
  
  proc clapack_dgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;                kl: var integer; ku: var integer; ab: ptr doublereal;                ldab: var integer; d: ptr doublereal; e: ptr doublereal;                q: ptr doublereal; ldq: var integer; pt: ptr doublereal;                ldpt: var integer; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dgbbrd_".}
  
  proc clapack_dgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr doublereal; ldab: var integer; ipiv: var cint;                anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgbcon_".}
  
  proc clapack_dgbequ*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublereal; ldab: var integer;                r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; info: var integer): cint {.importc: "dgbequ_".}
  
  proc clapack_dgbequb*(m: var integer; n: var integer; kl: var integer;                 ku: var integer; ab: ptr doublereal; ldab: var integer;                 r: ptr doublereal; c: ptr doublereal;                 rowcnd: ptr doublereal; colcnd: ptr doublereal;                 amax: ptr doublereal; info: var integer): cint {.importc: "dgbequb_".}
  
  proc clapack_dgbrfs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr doublereal;                ldab: var integer; afb: ptr doublereal; ldafb: var integer;                ipiv: var cint; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dgbrfs_".}
  
  proc clapack_dgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;                 kl: var integer; ku: var integer; nrhs: var integer;                 ab: ptr doublereal; ldab: var integer; afb: ptr doublereal;                 ldafb: var integer; ipiv: var cint; r: ptr doublereal;                 c: ptr doublereal; b: ptr doublereal; ldb: var integer;                 x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dgbrfsx_".}
  
  proc clapack_dgbsv*(n: var integer; kl: var integer; ku: var integer;               nrhs: var integer; ab: ptr doublereal; ldab: var integer;               ipiv: var cint; b: ptr doublereal; ldb: var integer;               info: var integer): cint {.importc: "dgbsv_".}
  
  proc clapack_dgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr doublereal;                ldab: var integer; afb: ptr doublereal; ldafb: var integer;                ipiv: var cint; equed: var cstring; r: ptr doublereal;                c: ptr doublereal; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgbsvx_".}
  
  proc clapack_dgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                 ku: var integer; nrhs: var integer; ab: ptr doublereal;                 ldab: var integer; afb: ptr doublereal; ldafb: var integer;                 ipiv: var cint; equed: var cstring; r: ptr doublereal;                 c: ptr doublereal; b: ptr doublereal; ldb: var integer;                 x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                 rpvgrw: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dgbsvxx_".}
  
  proc clapack_dgbtf2*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublereal; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "dgbtf2_".}
  
  proc clapack_dgbtrf*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublereal; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "dgbtrf_".}
  
  proc clapack_dgbtrs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr doublereal;                ldab: var integer; ipiv: var cint; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dgbtrs_".}
  
  proc clapack_dgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; scale: ptr doublereal; m: var integer;                v: ptr doublereal; ldv: var integer; info: var integer): cint {.importc: "dgebak_".}
  
  proc clapack_dgebal*(job: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; ilo: var integer; ihi: var integer;                scale: ptr doublereal; info: var integer): cint {.importc: "dgebal_".}
  
  proc clapack_dgebd2*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tauq: ptr doublereal; taup: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dgebd2_".}
  
  proc clapack_dgebrd*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tauq: ptr doublereal; taup: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dgebrd_".}
  
  proc clapack_dgecon*(norm: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgecon_".}
  
  proc clapack_dgeequ*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; info: var integer): cint {.importc: "dgeequ_".}
  
  proc clapack_dgeequb*(m: var integer; n: var integer; a: ptr doublereal;                 lda: var integer; r: ptr doublereal; c: ptr doublereal;                 rowcnd: ptr doublereal; colcnd: ptr doublereal;                 amax: ptr doublereal; info: var integer): cint {.importc: "dgeequb_".}
  
  proc clapack_dgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;               a: ptr doublereal; lda: var integer; sdim: var integer;               wr: ptr doublereal; wi: ptr doublereal; vs: ptr doublereal;               ldvs: var integer; work: ptr doublereal; lwork: var integer;               bwork: ptr logical; info: var integer): cint {.importc: "dgees_".}
  
  proc clapack_dgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;                n: var integer; a: ptr doublereal; lda: var integer;                sdim: var integer; wr: ptr doublereal; wi: ptr doublereal;                vs: ptr doublereal; ldvs: var integer; rconde: ptr doublereal;                rcondv: ptr doublereal; work: ptr doublereal;                lwork: var integer; iwork: var integer; liwork: var integer;                bwork: ptr logical; info: var integer): cint {.importc: "dgeesx_".}
  
  proc clapack_dgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; wr: ptr doublereal;               wi: ptr doublereal; vl: ptr doublereal; ldvl: var integer;               vr: ptr doublereal; ldvr: var integer; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dgeev_".}
  
  proc clapack_dgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr doublereal; lda: var integer;                wr: ptr doublereal; wi: ptr doublereal; vl: ptr doublereal;                ldvl: var integer; vr: ptr doublereal; ldvr: var integer;                ilo: var integer; ihi: var integer; scale: ptr doublereal;                abnrm: ptr doublereal; rconde: ptr doublereal;                rcondv: ptr doublereal; work: ptr doublereal;                lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "dgeevx_".}
  
  proc clapack_dgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer; alphar: ptr doublereal; alphai: ptr doublereal;               beta: ptr doublereal; vsl: ptr doublereal; ldvsl: var integer;               vsr: ptr doublereal; ldvsr: var integer; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dgegs_".}
  
  proc clapack_dgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer; alphar: ptr doublereal; alphai: ptr doublereal;               beta: ptr doublereal; vl: ptr doublereal; ldvl: var integer;               vr: ptr doublereal; ldvr: var integer; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dgegv_".}
  
  proc clapack_dgehd2*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dgehd2_".}
  
  proc clapack_dgehrd*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dgehrd_".}
  
  proc clapack_dgejsv*(joba: var cstring; jobu: var cstring; jobv: var cstring; jobr: var cstring;                jobt: var cstring; jobp: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; sva: ptr doublereal;                u: ptr doublereal; ldu: var integer; v: ptr doublereal;                ldv: var integer; work: ptr doublereal; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "dgejsv_".}
  
  proc clapack_dgelq2*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                info: var integer): cint {.importc: "dgelq2_".}
  
  proc clapack_dgelqf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dgelqf_".}
  
  proc clapack_dgels*(trans: var cstring; m: var integer; n: var integer;               nrhs: var integer; a: ptr doublereal; lda: var integer;               b: ptr doublereal; ldb: var integer; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dgels_".}
  
  proc clapack_dgelsd*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;                rank: var integer; work: ptr doublereal; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "dgelsd_".}
  
  proc clapack_dgelss*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;                rank: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dgelss_".}
  
  proc clapack_dgelsx*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; jpvt: var integer; rcond: ptr doublereal;                rank: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dgelsx_".}
  
  proc clapack_dgelsy*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; jpvt: var integer; rcond: ptr doublereal;                rank: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dgelsy_".}
  
  proc clapack_dgeql2*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                info: var integer): cint {.importc: "dgeql2_".}
  
  proc clapack_dgeqlf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dgeqlf_".}
  
  proc clapack_dgeqp3*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; jpvt: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dgeqp3_".}
  
  proc clapack_dgeqpf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; jpvt: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dgeqpf_".}
  
  proc clapack_dgeqr2*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                info: var integer): cint {.importc: "dgeqr2_".}
  
  proc clapack_dgeqrf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dgeqrf_".}
  
  proc clapack_dgerfs*(trans: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; af: ptr doublereal;                ldaf: var integer; ipiv: var cint; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgerfs_".}
  
  proc clapack_dgerfsx*(trans: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublereal; lda: var integer;                 af: ptr doublereal; ldaf: var integer; ipiv: var cint;                 r: ptr doublereal; c: ptr doublereal; b: ptr doublereal;                 ldb: var integer; x: ptr doublereal; ldx: var integer;                 rcond: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dgerfsx_".}
  
  proc clapack_dgerq2*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                info: var integer): cint {.importc: "dgerq2_".}
  
  proc clapack_dgerqf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dgerqf_".}
  
  proc clapack_dgesc2*(n: var integer; a: ptr doublereal; lda: var integer;                rhs: ptr doublereal; ipiv: var cint; jpiv: var cint;                scale: ptr doublereal): cint {.importc: "dgesc2_".}
  
  proc clapack_dgesdd*(jobz: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; s: ptr doublereal;                u: ptr doublereal; ldu: var integer; vt: ptr doublereal;                ldvt: var integer; work: ptr doublereal; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "dgesdd_".}
  
  proc clapack_dgesv*(n: var integer; nrhs: var integer; a: ptr doublereal;               lda: var integer; ipiv: ptr cint; b: ptr doublereal;               ldb: var integer; info: var integer): cint {.importc: "dgesv_".}
  
  proc clapack_dgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; s: ptr doublereal;                u: ptr doublereal; ldu: var integer; vt: ptr doublereal;                ldvt: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dgesvd_".}
  
  proc clapack_dgesvj*(joba: var cstring; jobu: var cstring; jobv: var cstring; m: var integer;                n: var integer; a: ptr doublereal; lda: var integer;                sva: ptr doublereal; mv: var integer; v: ptr doublereal;                ldv: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dgesvj_".}
  
  proc clapack_dgesvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; a: ptr doublereal; lda: var integer;                af: ptr doublereal; ldaf: var integer; ipiv: var cint;                equed: var cstring; r: ptr doublereal; c: ptr doublereal;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dgesvx_".}
  
  proc clapack_dgesvxx*(fact: var cstring; trans: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublereal; lda: var integer;                 af: ptr doublereal; ldaf: var integer; ipiv: var cint;                 equed: var cstring; r: ptr doublereal; c: ptr doublereal;                 b: ptr doublereal; ldb: var integer; x: ptr doublereal;                 ldx: var integer; rcond: ptr doublereal;                 rpvgrw: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dgesvxx_".}
  
  proc clapack_dgetc2*(n: var integer; a: ptr doublereal; lda: var integer;                ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "dgetc2_".}
  
  proc clapack_dgetf2*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "dgetf2_".}
  
  proc clapack_dgetrf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "dgetrf_".}
  
  proc clapack_dgetri*(n: var integer; a: ptr doublereal; lda: var integer;                ipiv: var cint; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dgetri_".}
  
  proc clapack_dgetrs*(trans: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; ipiv: var cint;                b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dgetrs_".}
  
  proc clapack_dggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; lscale: ptr doublereal;                rscale: ptr doublereal; m: var integer; v: ptr doublereal;                ldv: var integer; info: var integer): cint {.importc: "dggbak_".}
  
  proc clapack_dggbal*(job: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                ilo: var integer; ihi: var integer; lscale: ptr doublereal;                rscale: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dggbal_".}
  
  proc clapack_dgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;               n: var integer; a: ptr doublereal; lda: var integer;               b: ptr doublereal; ldb: var integer; sdim: var integer;               alphar: ptr doublereal; alphai: ptr doublereal;               beta: ptr doublereal; vsl: ptr doublereal; ldvsl: var integer;               vsr: ptr doublereal; ldvsr: var integer; work: ptr doublereal;               lwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "dgges_".}
  
  proc clapack_dggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;                sense: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                sdim: var integer; alphar: ptr doublereal;                alphai: ptr doublereal; beta: ptr doublereal;                vsl: ptr doublereal; ldvsl: var integer; vsr: ptr doublereal;                ldvsr: var integer; rconde: ptr doublereal;                rcondv: ptr doublereal; work: ptr doublereal;                lwork: var integer; iwork: var integer; liwork: var integer;                bwork: ptr logical; info: var integer): cint {.importc: "dggesx_".}
  
  proc clapack_dggev*(jobvl: var cstring; jobvr: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer; alphar: ptr doublereal; alphai: ptr doublereal;               beta: ptr doublereal; vl: ptr doublereal; ldvl: var integer;               vr: ptr doublereal; ldvr: var integer; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dggev_".}
  
  proc clapack_dggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; alphar: ptr doublereal;                alphai: ptr doublereal; beta: ptr doublereal;                vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;                ldvr: var integer; ilo: var integer; ihi: var integer;                lscale: ptr doublereal; rscale: ptr doublereal;                abnrm: ptr doublereal; bbnrm: ptr doublereal;                rconde: ptr doublereal; rcondv: ptr doublereal;                work: ptr doublereal; lwork: var integer; iwork: var integer;                bwork: ptr logical; info: var integer): cint {.importc: "dggevx_".}
  
  proc clapack_dggglm*(n: var integer; m: var integer; p: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; d: ptr doublereal; x: ptr doublereal;                y: ptr doublereal; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dggglm_".}
  
  proc clapack_dgghrd*(compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                q: ptr doublereal; ldq: var integer; z: ptr doublereal;                ldz: var integer; info: var integer): cint {.importc: "dgghrd_".}
  
  proc clapack_dgglse*(m: var integer; n: var integer; p: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; c: ptr doublereal; d: ptr doublereal;                x: ptr doublereal; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dgglse_".}
  
  proc clapack_dggqrf*(n: var integer; m: var integer; p: var integer;                a: ptr doublereal; lda: var integer; taua: ptr doublereal;                b: ptr doublereal; ldb: var integer; taub: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dggqrf_".}
  
  proc clapack_dggrqf*(m: var integer; p: var integer; n: var integer;                a: ptr doublereal; lda: var integer; taua: ptr doublereal;                b: ptr doublereal; ldb: var integer; taub: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dggrqf_".}
  
  proc clapack_dggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                n: var integer; p: var integer; k: var integer; l: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; alpha: ptr doublereal; beta: ptr doublereal;                u: ptr doublereal; ldu: var integer; v: ptr doublereal;                ldv: var integer; q: ptr doublereal; ldq: var integer;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dggsvd_".}
  
  proc clapack_dggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                tola: ptr doublereal; tolb: ptr doublereal; k: var integer;                l: var integer; u: ptr doublereal; ldu: var integer;                v: ptr doublereal; ldv: var integer; q: ptr doublereal;                ldq: var integer; iwork: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dggsvp_".}
  
  proc clapack_dgsvj0*(jobv: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; d: ptr doublereal;                sva: ptr doublereal; mv: var integer; v: ptr doublereal;                ldv: var integer; eps: ptr doublereal; sfmin: ptr doublereal;                tol: ptr doublereal; nsweep: var integer; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dgsvj0_".}
  
  proc clapack_dgsvj1*(jobv: var cstring; m: var integer; n: var integer; n1: var integer;                a: ptr doublereal; lda: var integer; d: ptr doublereal;                sva: ptr doublereal; mv: var integer; v: ptr doublereal;                ldv: var integer; eps: ptr doublereal; sfmin: ptr doublereal;                tol: ptr doublereal; nsweep: var integer; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dgsvj1_".}
  
  proc clapack_dgtcon*(norm: var cstring; n: var integer; dl: ptr doublereal;                d: ptr doublereal; du: ptr doublereal; du2: ptr doublereal;                ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgtcon_".}
  
  proc clapack_dgtrfs*(trans: var cstring; n: var integer; nrhs: var integer;                dl: ptr doublereal; d: ptr doublereal; du: ptr doublereal;                dlf: ptr doublereal; df: ptr doublereal; duf: ptr doublereal;                du2: ptr doublereal; ipiv: var cint; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgtrfs_".}
  
  proc clapack_dgtsv*(n: var integer; nrhs: var integer; dl: ptr doublereal;               d: ptr doublereal; du: ptr doublereal; b: ptr doublereal;               ldb: var integer; info: var integer): cint {.importc: "dgtsv_".}
  
  proc clapack_dgtsvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; dl: ptr doublereal; d: ptr doublereal;                du: ptr doublereal; dlf: ptr doublereal; df: ptr doublereal;                duf: ptr doublereal; du2: ptr doublereal; ipiv: var cint;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dgtsvx_".}
  
  proc clapack_dgttrf*(n: var integer; dl: ptr doublereal; d: ptr doublereal;                du: ptr doublereal; du2: ptr doublereal; ipiv: var cint;                info: var integer): cint {.importc: "dgttrf_".}
  
  proc clapack_dgttrs*(trans: var cstring; n: var integer; nrhs: var integer;                dl: ptr doublereal; d: ptr doublereal; du: ptr doublereal;                du2: ptr doublereal; ipiv: var cint; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dgttrs_".}
  
  proc clapack_dgtts2*(itrans: var integer; n: var integer; nrhs: var integer;                dl: ptr doublereal; d: ptr doublereal; du: ptr doublereal;                du2: ptr doublereal; ipiv: var cint; b: ptr doublereal;                ldb: var integer): cint {.importc: "dgtts2_".}
  
  proc clapack_dhgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublereal;                ldh: var integer; t: ptr doublereal; ldt: var integer;                alphar: ptr doublereal; alphai: ptr doublereal;                beta: ptr doublereal; q: ptr doublereal; ldq: var integer;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dhgeqz_".}
  
  proc clapack_dhsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;                select: ptr logical; n: var integer; h: ptr doublereal;                ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;                vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;                ldvr: var integer; mm: var integer; m: var integer;                work: ptr doublereal; ifaill: var integer; ifailr: var integer;                info: var integer): cint {.importc: "dhsein_".}
  
  proc clapack_dhseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;                ihi: var integer; h: ptr doublereal; ldh: var integer;                wr: ptr doublereal; wi: ptr doublereal; z: ptr doublereal;                ldz: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dhseqr_".}
  proc clapack_disnan*(din: ptr doublereal): logical {.importc: "disnan_".}
  
  proc clapack_dla_gbamv*(trans: var integer; m: var integer; n: var integer;                    kl: var integer; ku: var integer; alpha: ptr doublereal;                    ab: ptr doublereal; ldab: var integer; x: ptr doublereal;                    incx: var integer; beta: ptr doublereal; y: ptr doublereal;                    incy: var integer): cint {.importc: "dla_gbamv__".}
  proc clapack_dla_gbrcond*(trans: var cstring; n: var integer; kl: var integer;                      ku: var integer; ab: ptr doublereal; ldab: var integer;                      afb: ptr doublereal; ldafb: var integer;                      ipiv: var cint; cmode: var integer;                      c: ptr doublereal; info: var integer;                      work: ptr doublereal; iwork: var integer;                      trans_len: ftnlen): doublereal {.importc: "dla_gbrcond__".}
  
  proc clapack_dla_gbrfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              kl: var integer; ku: var integer;                              nrhs: var integer; ab: ptr doublereal;                              ldab: var integer; afb: ptr doublereal;                              ldafb: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr doublereal;                              b: ptr doublereal; ldb: var integer;                              y: ptr doublereal; ldy: var integer;                              berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublereal;                              ayb: ptr doublereal; dy: ptr doublereal;                              y_tail: ptr doublereal; rcond: ptr doublereal;                              ithresh: var integer; rthresh: ptr doublereal;                              dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer): cint {.importc: "dla_gbrfsx_extended__".}
  proc clapack_dla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;                       ncols: var integer; ab: ptr doublereal;                       ldab: var integer; afb: ptr doublereal;                       ldafb: var integer): doublereal {.importc: "dla_gbrpvgrw__".}
  
  proc clapack_dla_geamv*(trans: var integer; m: var integer; n: var integer;                    alpha: ptr doublereal; a: ptr doublereal; lda: var integer;                    x: ptr doublereal; incx: var integer; beta: ptr doublereal;                    y: ptr doublereal; incy: var integer): cint {.importc: "dla_geamv__".}
  proc clapack_dla_gercond*(trans: var cstring; n: var integer; a: ptr doublereal;                      lda: var integer; af: ptr doublereal; ldaf: var integer;                      ipiv: var cint; cmode: var integer;                      c: ptr doublereal; info: var integer;                      work: ptr doublereal; iwork: var integer;                      trans_len: ftnlen): doublereal {.importc: "dla_gercond__".}
  
  proc clapack_dla_gerfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              nrhs: var integer; a: ptr doublereal;                              lda: var integer; af: ptr doublereal;                              ldaf: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr doublereal;                              b: ptr doublereal; ldb: var integer;                              y: ptr doublereal; ldy: var integer;                              berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublereal;                              ayb: ptr doublereal; dy: ptr doublereal;                              y_tail: ptr doublereal; rcond: ptr doublereal;                              ithresh: var integer; rthresh: ptr doublereal;                              dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer): cint {.importc: "dla_gerfsx_extended__".}
  
  proc clapack_dla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;                       res: ptr doublereal; ayb: ptr doublereal;                       berr: ptr doublereal): cint {.importc: "dla_lin_berr__".}
  proc clapack_dla_porcond*(uplo: var cstring; n: var integer; a: ptr doublereal;                      lda: var integer; af: ptr doublereal; ldaf: var integer;                      cmode: var integer; c: ptr doublereal;                      info: var integer; work: ptr doublereal;                      iwork: var integer; uplo_len: ftnlen): doublereal {.importc: "dla_porcond__".}
  
  proc clapack_dla_porfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer;                              a: ptr doublereal; lda: var integer;                              af: ptr doublereal; ldaf: var integer;                              colequ: ptr logical; c: ptr doublereal;                              b: ptr doublereal; ldb: var integer;                              y: ptr doublereal; ldy: var integer;                              berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublereal;                              ayb: ptr doublereal; dy: ptr doublereal;                              y_tail: ptr doublereal; rcond: ptr doublereal;                              ithresh: var integer; rthresh: ptr doublereal;                              dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer;                              uplo_len: ftnlen): cint {.importc: "dla_porfsx_extended__".}
  proc clapack_dla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr doublereal;                       lda: var integer; af: ptr doublereal; ldaf: var integer;                       work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "dla_porpvgrw__".}
  proc clapack_dla_rpvgrw*(n: var integer; ncols: var integer; a: ptr doublereal;                     lda: var integer; af: ptr doublereal; ldaf: var integer): doublereal {.importc: "dla_rpvgrw__".}
  
  proc clapack_dla_syamv*(uplo: var integer; n: var integer; alpha: ptr doublereal;                    a: ptr doublereal; lda: var integer; x: ptr doublereal;                    incx: var integer; beta: ptr doublereal; y: ptr doublereal;                    incy: var integer): cint {.importc: "dla_syamv__".}
  proc clapack_dla_syrcond*(uplo: var cstring; n: var integer; a: ptr doublereal;                      lda: var integer; af: ptr doublereal; ldaf: var integer;                      ipiv: var cint; cmode: var integer;                      c: ptr doublereal; info: var integer;                      work: ptr doublereal; iwork: var integer; uplo_len: ftnlen): doublereal {.importc: "dla_syrcond__".}
  
  proc clapack_dla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer;                              a: ptr doublereal; lda: var integer;                              af: ptr doublereal; ldaf: var integer;                              ipiv: var cint; colequ: ptr logical;                              c: ptr doublereal; b: ptr doublereal;                              ldb: var integer; y: ptr doublereal;                              ldy: var integer; berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublereal;                              ayb: ptr doublereal; dy: ptr doublereal;                              y_tail: ptr doublereal; rcond: ptr doublereal;                              ithresh: var integer; rthresh: ptr doublereal;                              dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer;                              uplo_len: ftnlen): cint {.importc: "dla_syrfsx_extended__".}
  proc clapack_dla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;                       a: ptr doublereal; lda: var integer; af: ptr doublereal;                       ldaf: var integer; ipiv: var cint;                       work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "dla_syrpvgrw__".}
  
  proc clapack_dla_wwaddw*(n: var integer; x: ptr doublereal; y: ptr doublereal;                     w: ptr doublereal): cint {.importc: "dla_wwaddw__".}
  
  proc clapack_dlabad*(small: ptr doublereal; large: ptr doublereal): cint {.importc: "dlabad_".}
  
  proc clapack_dlabrd*(m: var integer; n: var integer; nb: var integer;                a: ptr doublereal; lda: var integer; d: ptr doublereal;                e: ptr doublereal; tauq: ptr doublereal; taup: ptr doublereal;                x: ptr doublereal; ldx: var integer; y: ptr doublereal;                ldy: var integer): cint {.importc: "dlabrd_".}
  
  proc clapack_dlacn2*(n: var integer; v: ptr doublereal; x: ptr doublereal;                isgn: var integer; est: ptr doublereal; kase: var integer;                isave: var integer): cint {.importc: "dlacn2_".}
  
  proc clapack_dlacon*(n: var integer; v: ptr doublereal; x: ptr doublereal;                isgn: var integer; est: ptr doublereal; kase: var integer): cint {.importc: "dlacon_".}
  
  proc clapack_dlacpy*(uplo: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer): cint {.importc: "dlacpy_".}
  
  proc clapack_dladiv*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;                d: ptr doublereal; p: ptr doublereal; q: ptr doublereal): cint {.importc: "dladiv_".}
  
  proc clapack_dlae2*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;               rt1: ptr doublereal; rt2: ptr doublereal): cint {.importc: "dlae2_".}
  
  proc clapack_dlaebz*(ijob: var integer; nitmax: var integer; n: var integer;                mmax: var integer; minp: var integer; nbmin: var integer;                abstol: ptr doublereal; reltol: ptr doublereal;                pivmin: ptr doublereal; d: ptr doublereal; e: ptr doublereal;                e2: ptr doublereal; nval: var integer; ab: ptr doublereal;                c: ptr doublereal; mout: var integer; nab: var integer;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dlaebz_".}
  
  proc clapack_dlaed0*(icompq: var integer; qsiz: var integer; n: var integer;                d: ptr doublereal; e: ptr doublereal; q: ptr doublereal;                ldq: var integer; qstore: ptr doublereal; ldqs: var integer;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dlaed0_".}
  
  proc clapack_dlaed1*(n: var integer; d: ptr doublereal; q: ptr doublereal;                ldq: var integer; indxq: var integer; rho: ptr doublereal;                cutpnt: var integer; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dlaed1_".}
  
  proc clapack_dlaed2*(k: var integer; n: var integer; n1: var integer;                d: ptr doublereal; q: ptr doublereal; ldq: var integer;                indxq: var integer; rho: ptr doublereal; z: ptr doublereal;                dlamda: ptr doublereal; w: ptr doublereal; q2: ptr doublereal;                indx: var integer; indxc: var integer; indxp: var integer;                coltyp: var integer; info: var integer): cint {.importc: "dlaed2_".}
  
  proc clapack_dlaed3*(k: var integer; n: var integer; n1: var integer;                d: ptr doublereal; q: ptr doublereal; ldq: var integer;                rho: ptr doublereal; dlamda: ptr doublereal; q2: ptr doublereal;                indx: var integer; ctot: var integer; w: ptr doublereal;                s: ptr doublereal; info: var integer): cint {.importc: "dlaed3_".}
  
  proc clapack_dlaed4*(n: var integer; i: var integer; d: ptr doublereal;                z: ptr doublereal; delta: ptr doublereal; rho: ptr doublereal;                dlam: ptr doublereal; info: var integer): cint {.importc: "dlaed4_".}
  
  proc clapack_dlaed5*(i: var integer; d: ptr doublereal; z: ptr doublereal;                delta: ptr doublereal; rho: ptr doublereal; dlam: ptr doublereal): cint {.importc: "dlaed5_".}
  
  proc clapack_dlaed6*(kniter: var integer; orgati: ptr logical; rho: ptr doublereal;                d: ptr doublereal; z: ptr doublereal; finit: ptr doublereal;                tau: ptr doublereal; info: var integer): cint {.importc: "dlaed6_".}
  
  proc clapack_dlaed7*(icompq: var integer; n: var integer; qsiz: var integer;                tlvls: var integer; curlvl: var integer; curpbm: var integer;                d: ptr doublereal; q: ptr doublereal; ldq: var integer;                indxq: var integer; rho: ptr doublereal; cutpnt: var integer;                qstore: ptr doublereal; qptr: var integer; prmptr: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                givnum: ptr doublereal; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dlaed7_".}
  
  proc clapack_dlaed8*(icompq: var integer; k: var integer; n: var integer;                qsiz: var integer; d: ptr doublereal; q: ptr doublereal;                ldq: var integer; indxq: var integer; rho: ptr doublereal;                cutpnt: var integer; z: ptr doublereal;                dlamda: ptr doublereal; q2: ptr doublereal; ldq2: var integer;                w: ptr doublereal; perm: var integer; givptr: var integer;                givcol: var integer; givnum: ptr doublereal; indxp: var integer;                indx: var integer; info: var integer): cint {.importc: "dlaed8_".}
  
  proc clapack_dlaed9*(k: var integer; kstart: var integer; kstop: var integer;                n: var integer; d: ptr doublereal; q: ptr doublereal;                ldq: var integer; rho: ptr doublereal; dlamda: ptr doublereal;                w: ptr doublereal; s: ptr doublereal; lds: var integer;                info: var integer): cint {.importc: "dlaed9_".}
  
  proc clapack_dlaeda*(n: var integer; tlvls: var integer; curlvl: var integer;                curpbm: var integer; prmptr: var integer; perm: var integer;                givptr: var integer; givcol: var integer;                givnum: ptr doublereal; q: ptr doublereal; qptr: var integer;                z: ptr doublereal; ztemp: ptr doublereal; info: var integer): cint {.importc: "dlaeda_".}
  
  proc clapack_dlaein*(rightv: ptr logical; noinit: ptr logical; n: var integer;                h: ptr doublereal; ldh: var integer; wr: ptr doublereal;                wi: ptr doublereal; vr: ptr doublereal; vi: ptr doublereal;                b: ptr doublereal; ldb: var integer; work: ptr doublereal;                eps3: ptr doublereal; smlnum: ptr doublereal;                bignum: ptr doublereal; info: var integer): cint {.importc: "dlaein_".}
  
  proc clapack_dlaev2*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;                rt1: ptr doublereal; rt2: ptr doublereal; cs1: ptr doublereal;                sn1: ptr doublereal): cint {.importc: "dlaev2_".}
  
  proc clapack_dlaexc*(wantq: ptr logical; n: var integer; t: ptr doublereal;                ldt: var integer; q: ptr doublereal; ldq: var integer;                j1: var integer; n1: var integer; n2: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dlaexc_".}
  
  proc clapack_dlag2*(a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer; safmin: ptr doublereal; scale1: ptr doublereal;               scale2: ptr doublereal; wr1: ptr doublereal; wr2: ptr doublereal;               wi: ptr doublereal): cint {.importc: "dlag2_".}
  
  proc clapack_dlag2s*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; sa: ptr real; ldsa: var integer;                info: var integer): cint {.importc: "dlag2s_".}
  
  proc clapack_dlags2*(upper: ptr logical; a1: ptr doublereal; a2: ptr doublereal;                a3: ptr doublereal; b1: ptr doublereal; b2: ptr doublereal;                b3: ptr doublereal; csu: ptr doublereal; snu: ptr doublereal;                csv: ptr doublereal; snv: ptr doublereal; csq: ptr doublereal;                snq: ptr doublereal): cint {.importc: "dlags2_".}
  
  proc clapack_dlagtf*(n: var integer; a: ptr doublereal; lambdas: ptr doublereal;                b: ptr doublereal; c: ptr doublereal; tol: ptr doublereal;                d: ptr doublereal; pm: var integer; info: var integer): cint {.importc: "dlagtf_".}
  
  proc clapack_dlagtm*(trans: var cstring; n: var integer; nrhs: var integer;                alpha: ptr doublereal; dl: ptr doublereal; d: ptr doublereal;                du: ptr doublereal; x: ptr doublereal; ldx: var integer;                beta: ptr doublereal; b: ptr doublereal; ldb: var integer): cint {.importc: "dlagtm_".}
  
  proc clapack_dlagts*(job: var integer; n: var integer; a: ptr doublereal;                b: ptr doublereal; c: ptr doublereal; d: ptr doublereal;                pm: var integer; y: ptr doublereal; tol: ptr doublereal;                info: var integer): cint {.importc: "dlagts_".}
  
  proc clapack_dlagv2*(a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; alphar: ptr doublereal;                alphai: ptr doublereal; beta: ptr doublereal;                csl: ptr doublereal; snl: ptr doublereal; csr: ptr doublereal;                snr: ptr doublereal): cint {.importc: "dlagv2_".}
  
  proc clapack_dlahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublereal;                ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;                iloz: var integer; ihiz: var integer; z: ptr doublereal;                ldz: var integer; info: var integer): cint {.importc: "dlahqr_".}
  
  proc clapack_dlahr2*(n: var integer; k: var integer; nb: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                t: ptr doublereal; ldt: var integer; y: ptr doublereal;                ldy: var integer): cint {.importc: "dlahr2_".}
  
  proc clapack_dlahrd*(n: var integer; k: var integer; nb: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                t: ptr doublereal; ldt: var integer; y: ptr doublereal;                ldy: var integer): cint {.importc: "dlahrd_".}
  
  proc clapack_dlaic1*(job: var integer; j: var integer; x: ptr doublereal;                sest: ptr doublereal; w: ptr doublereal; gamma: ptr doublereal;                sestpr: ptr doublereal; s: ptr doublereal; c: ptr doublereal): cint {.importc: "dlaic1_".}
  proc clapack_dlaisnan*(din1: ptr doublereal; din2: ptr doublereal): logical {.importc: "dlaisnan_".}
  
  proc clapack_dlaln2*(ltrans: ptr logical; na: var integer; nw: var integer;                smin: ptr doublereal; ca: ptr doublereal; a: ptr doublereal;                lda: var integer; d1: ptr doublereal; d2: ptr doublereal;                b: ptr doublereal; ldb: var integer; wr: ptr doublereal;                wi: ptr doublereal; x: ptr doublereal; ldx: var integer;                scale: ptr doublereal; xnorm: ptr doublereal; info: var integer): cint {.importc: "dlaln2_".}
  
  proc clapack_dlals0*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; nrhs: var integer; b: ptr doublereal;                ldb: var integer; bx: ptr doublereal; ldbx: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                ldgcol: var integer; givnum: ptr doublereal;                ldgnum: var integer; poles: ptr doublereal;                difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;                k: var integer; c: ptr doublereal; s: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dlals0_".}
  
  proc clapack_dlalsa*(icompq: var integer; smlsiz: var integer; n: var integer;                nrhs: var integer; b: ptr doublereal; ldb: var integer;                bx: ptr doublereal; ldbx: var integer; u: ptr doublereal;                ldu: var integer; vt: ptr doublereal; k: var integer;                difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;                poles: ptr doublereal; givptr: var integer; givcol: var integer;                ldgcol: var integer; perm: var integer; givnum: ptr doublereal;                c: ptr doublereal; s: ptr doublereal; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dlalsa_".}
  
  proc clapack_dlalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;                nrhs: var integer; d: ptr doublereal; e: ptr doublereal;                b: ptr doublereal; ldb: var integer; rcond: ptr doublereal;                rank: var integer; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dlalsd_".}
  
  proc clapack_dlamrg*(n1: var integer; n2: var integer; a: ptr doublereal;                dtrd1: var integer; dtrd2: var integer; index: var integer): cint {.importc: "dlamrg_".}
  proc clapack_dlaneg*(n: var integer; d: ptr doublereal; lld: ptr doublereal;                sigma: ptr doublereal; pivmin: ptr doublereal; r: var integer): integer {.importc: "dlaneg_".}
  proc clapack_dlangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr doublereal; ldab: var integer; work: ptr doublereal): doublereal {.importc: "dlangb_".}
  proc clapack_dlange*(norm: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; work: ptr doublereal): doublereal {.importc: "dlange_".}
  proc clapack_dlangt*(norm: var cstring; n: var integer; dl: ptr doublereal;                d: ptr doublereal; du: ptr doublereal): doublereal {.importc: "dlangt_".}
  proc clapack_dlanhs*(norm: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; work: ptr doublereal): doublereal {.importc: "dlanhs_".}
  proc clapack_dlansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;                ab: ptr doublereal; ldab: var integer; work: ptr doublereal): doublereal {.importc: "dlansb_".}
  proc clapack_dlansf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublereal; work: ptr doublereal): doublereal {.importc: "dlansf_".}
  proc clapack_dlansp*(norm: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublereal; work: ptr doublereal): doublereal {.importc: "dlansp_".}
  proc clapack_dlanst*(norm: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal): doublereal {.importc: "dlanst_".}
  proc clapack_dlansy*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; work: ptr doublereal): doublereal {.importc: "dlansy_".}
  proc clapack_dlantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                k: var integer; ab: ptr doublereal; ldab: var integer;                work: ptr doublereal): doublereal {.importc: "dlantb_".}
  proc clapack_dlantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr doublereal; work: ptr doublereal): doublereal {.importc: "dlantp_".}
  proc clapack_dlantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;                n: var integer; a: ptr doublereal; lda: var integer;                work: ptr doublereal): doublereal {.importc: "dlantr_".}
  
  proc clapack_dlanv2*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;                d: ptr doublereal; rt1r: ptr doublereal; rt1i: ptr doublereal;                rt2r: ptr doublereal; rt2i: ptr doublereal; cs: ptr doublereal;                sn: ptr doublereal): cint {.importc: "dlanv2_".}
  
  proc clapack_dlapll*(n: var integer; x: ptr doublereal; incx: var integer;                y: ptr doublereal; incy: var integer; ssmin: ptr doublereal): cint {.importc: "dlapll_".}
  
  proc clapack_dlapmt*(forwrd: ptr logical; m: var integer; n: var integer;                x: ptr doublereal; ldx: var integer; k: var integer): cint {.importc: "dlapmt_".}
  proc clapack_dlapy2*(x: ptr doublereal; y: ptr doublereal): doublereal {.importc: "dlapy2_".}
  proc clapack_dlapy3*(x: ptr doublereal; y: ptr doublereal; z: ptr doublereal): doublereal {.importc: "dlapy3_".}
  
  proc clapack_dlaqgb*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublereal; ldab: var integer;                r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqgb_".}
  
  proc clapack_dlaqge*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqge_".}
  
  proc clapack_dlaqp2*(m: var integer; n: var integer; offset: var integer;                a: ptr doublereal; lda: var integer; jpvt: var integer;                tau: ptr doublereal; vn1: ptr doublereal; vn2: ptr doublereal;                work: ptr doublereal): cint {.importc: "dlaqp2_".}
  
  proc clapack_dlaqps*(m: var integer; n: var integer; offset: var integer;                nb: var integer; kb: var integer; a: ptr doublereal;                lda: var integer; jpvt: var integer; tau: ptr doublereal;                vn1: ptr doublereal; vn2: ptr doublereal; auxv: ptr doublereal;                f: ptr doublereal; ldf: var integer): cint {.importc: "dlaqps_".}
  
  proc clapack_dlaqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublereal;                ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;                iloz: var integer; ihiz: var integer; z: ptr doublereal;                ldz: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dlaqr0_".}
  
  proc clapack_dlaqr1*(n: var integer; h: ptr doublereal; ldh: var integer;                sr1: ptr doublereal; si1: ptr doublereal; sr2: ptr doublereal;                si2: ptr doublereal; v: ptr doublereal): cint {.importc: "dlaqr1_".}
  
  proc clapack_dlaqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr doublereal; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr doublereal; ldz: var integer;                ns: var integer; nd: var integer; sr: ptr doublereal;                si: ptr doublereal; v: ptr doublereal; ldv: var integer;                nh: var integer; t: ptr doublereal; ldt: var integer;                nv: var integer; wv: ptr doublereal; ldwv: var integer;                work: ptr doublereal; lwork: var integer): cint {.importc: "dlaqr2_".}
  
  proc clapack_dlaqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr doublereal; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr doublereal; ldz: var integer;                ns: var integer; nd: var integer; sr: ptr doublereal;                si: ptr doublereal; v: ptr doublereal; ldv: var integer;                nh: var integer; t: ptr doublereal; ldt: var integer;                nv: var integer; wv: ptr doublereal; ldwv: var integer;                work: ptr doublereal; lwork: var integer): cint {.importc: "dlaqr3_".}
  
  proc clapack_dlaqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublereal;                ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;                iloz: var integer; ihiz: var integer; z: ptr doublereal;                ldz: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dlaqr4_".}
  
  proc clapack_dlaqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;                n: var integer; ktop: var integer; kbot: var integer;                nshfts: var integer; sr: ptr doublereal; si: ptr doublereal;                h: ptr doublereal; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr doublereal; ldz: var integer;                v: ptr doublereal; ldv: var integer; u: ptr doublereal;                ldu: var integer; nv: var integer; wv: ptr doublereal;                ldwv: var integer; nh: var integer; wh: ptr doublereal;                ldwh: var integer): cint {.importc: "dlaqr5_".}
  
  proc clapack_dlaqsb*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; s: ptr doublereal;                scond: ptr doublereal; amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqsb_".}
  
  proc clapack_dlaqsp*(uplo: var cstring; n: var integer; ap: ptr doublereal;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                equed: var cstring): cint {.importc: "dlaqsp_".}
  
  proc clapack_dlaqsy*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; s: ptr doublereal; scond: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqsy_".}
  
  proc clapack_dlaqtr*(ltran: ptr logical; lreal: ptr logical; n: var integer;                t: ptr doublereal; ldt: var integer; b: ptr doublereal;                w: ptr doublereal; scale: ptr doublereal; x: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dlaqtr_".}
  
  proc clapack_dlar1v*(n: var integer; b1: var integer; bn: var integer;                lambdas: ptr doublereal; d: ptr doublereal; l: ptr doublereal;                ld: ptr doublereal; lld: ptr doublereal; pivmin: ptr doublereal;                gaptol: ptr doublereal; z: ptr doublereal;                wantnc: ptr logical; negcnt: var integer; ztz: ptr doublereal;                mingma: ptr doublereal; r: var integer; isuppz: var integer;                nrminv: ptr doublereal; resid: ptr doublereal;                rqcorr: ptr doublereal; work: ptr doublereal): cint {.importc: "dlar1v_".}
  
  proc clapack_dlar2v*(n: var integer; x: ptr doublereal; y: ptr doublereal;                z: ptr doublereal; incx: var integer; c: ptr doublereal;                s: ptr doublereal; incc: var integer): cint {.importc: "dlar2v_".}
  
  proc clapack_dlarf*(side: var cstring; m: var integer; n: var integer; v: ptr doublereal;               incv: var integer; tau: ptr doublereal; c: ptr doublereal;               ldc: var integer; work: ptr doublereal): cint {.importc: "dlarf_".}
  
  proc clapack_dlarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer;                v: ptr doublereal; ldv: var integer; t: ptr doublereal;                ldt: var integer; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; ldwork: var integer): cint {.importc: "dlarfb_".}
  
  proc clapack_dlarfg*(n: var integer; alpha: ptr doublereal; x: ptr doublereal;                incx: var integer; tau: ptr doublereal): cint {.importc: "dlarfg_".}
  
  proc clapack_dlarfp*(n: var integer; alpha: ptr doublereal; x: ptr doublereal;                incx: var integer; tau: ptr doublereal): cint {.importc: "dlarfp_".}
  
  proc clapack_dlarft*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr doublereal; ldv: var integer;                tau: ptr doublereal; t: ptr doublereal; ldt: var integer): cint {.importc: "dlarft_".}
  
  proc clapack_dlarfx*(side: var cstring; m: var integer; n: var integer;                v: ptr doublereal; tau: ptr doublereal; c: ptr doublereal;                ldc: var integer; work: ptr doublereal): cint {.importc: "dlarfx_".}
  
  proc clapack_dlargv*(n: var integer; x: ptr doublereal; incx: var integer;                y: ptr doublereal; incy: var integer; c: ptr doublereal;                incc: var integer): cint {.importc: "dlargv_".}
  
  proc clapack_dlarnv*(idist: var integer; iseed: var integer; n: var integer;                x: ptr doublereal): cint {.importc: "dlarnv_".}
  
  proc clapack_dlarra*(n: var integer; d: ptr doublereal; e: ptr doublereal;                e2: ptr doublereal; spltol: ptr doublereal;                tnrm: ptr doublereal; nsplit: var integer; isplit: var integer;                info: var integer): cint {.importc: "dlarra_".}
  
  proc clapack_dlarrb*(n: var integer; d: ptr doublereal; lld: ptr doublereal;                ifirst: var integer; ilast: var integer; rtol1: ptr doublereal;                rtol2: ptr doublereal; offset: var integer; w: ptr doublereal;                wgap: ptr doublereal; werr: ptr doublereal;                work: ptr doublereal; iwork: var integer;                pivmin: ptr doublereal; spdiam: ptr doublereal;                twist: var integer; info: var integer): cint {.importc: "dlarrb_".}
  
  proc clapack_dlarrc*(jobt: var cstring; n: var integer; vl: ptr doublereal;                vu: ptr doublereal; d: ptr doublereal; e: ptr doublereal;                pivmin: ptr doublereal; eigcnt: var integer; lcnt: var integer;                rcnt: var integer; info: var integer): cint {.importc: "dlarrc_".}
  
  proc clapack_dlarrd*(range: var cstring; order: var cstring; n: var integer;                vl: ptr doublereal; vu: ptr doublereal; il: var integer;                iu: var integer; gers: ptr doublereal; reltol: ptr doublereal;                d: ptr doublereal; e: ptr doublereal; e2: ptr doublereal;                pivmin: ptr doublereal; nsplit: var integer;                isplit: var integer; m: var integer; w: ptr doublereal;                werr: ptr doublereal; wl: ptr doublereal; wu: ptr doublereal;                iblock: var integer; indexw: var integer; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dlarrd_".}
  
  proc clapack_dlarre*(range: var cstring; n: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                d: ptr doublereal; e: ptr doublereal; e2: ptr doublereal;                rtol1: ptr doublereal; rtol2: ptr doublereal;                spltol: ptr doublereal; nsplit: var integer;                isplit: var integer; m: var integer; w: ptr doublereal;                werr: ptr doublereal; wgap: ptr doublereal; iblock: var integer;                indexw: var integer; gers: ptr doublereal;                pivmin: ptr doublereal; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dlarre_".}
  
  proc clapack_dlarrf*(n: var integer; d: ptr doublereal; l: ptr doublereal;                ld: ptr doublereal; clstrt: var integer; clend: var integer;                w: ptr doublereal; wgap: ptr doublereal; werr: ptr doublereal;                spdiam: ptr doublereal; clgapl: ptr doublereal;                clgapr: ptr doublereal; pivmin: ptr doublereal;                sigma: ptr doublereal; dplus: ptr doublereal;                lplus: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dlarrf_".}
  
  proc clapack_dlarrj*(n: var integer; d: ptr doublereal; e2: ptr doublereal;                ifirst: var integer; ilast: var integer; rtol: ptr doublereal;                offset: var integer; w: ptr doublereal; werr: ptr doublereal;                work: ptr doublereal; iwork: var integer;                pivmin: ptr doublereal; spdiam: ptr doublereal;                info: var integer): cint {.importc: "dlarrj_".}
  
  proc clapack_dlarrk*(n: var integer; iw: var integer; gl: ptr doublereal;                gu: ptr doublereal; d: ptr doublereal; e2: ptr doublereal;                pivmin: ptr doublereal; reltol: ptr doublereal;                w: ptr doublereal; werr: ptr doublereal; info: var integer): cint {.importc: "dlarrk_".}
  
  proc clapack_dlarrr*(n: var integer; d: ptr doublereal; e: ptr doublereal;                info: var integer): cint {.importc: "dlarrr_".}
  
  proc clapack_dlarrv*(n: var integer; vl: ptr doublereal; vu: ptr doublereal;                d: ptr doublereal; l: ptr doublereal; pivmin: ptr doublereal;                isplit: var integer; m: var integer; dol: var integer;                dou: var integer; minrgp: ptr doublereal; rtol1: ptr doublereal;                rtol2: ptr doublereal; w: ptr doublereal; werr: ptr doublereal;                wgap: ptr doublereal; iblock: var integer; indexw: var integer;                gers: ptr doublereal; z: ptr doublereal; ldz: var integer;                isuppz: var integer; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dlarrv_".}
  
  proc clapack_dlarscl2*(m: var integer; n: var integer; d: ptr doublereal;                  x: ptr doublereal; ldx: var integer): cint {.importc: "dlarscl2_".}
  
  proc clapack_dlartg*(f: ptr doublereal; g: ptr doublereal; cs: ptr doublereal;                sn: ptr doublereal; r: ptr doublereal): cint {.importc: "dlartg_".}
  
  proc clapack_dlartv*(n: var integer; x: ptr doublereal; incx: var integer;                y: ptr doublereal; incy: var integer; c: ptr doublereal;                s: ptr doublereal; incc: var integer): cint {.importc: "dlartv_".}
  
  proc clapack_dlaruv*(iseed: var integer; n: var integer; x: ptr doublereal): cint {.importc: "dlaruv_".}
  
  proc clapack_dlarz*(side: var cstring; m: var integer; n: var integer; l: var integer;               v: ptr doublereal; incv: var integer; tau: ptr doublereal;               c: ptr doublereal; ldc: var integer; work: ptr doublereal): cint {.importc: "dlarz_".}
  
  proc clapack_dlarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer; l: var integer;                v: ptr doublereal; ldv: var integer; t: ptr doublereal;                ldt: var integer; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; ldwork: var integer): cint {.importc: "dlarzb_".}
  
  proc clapack_dlarzt*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr doublereal; ldv: var integer;                tau: ptr doublereal; t: ptr doublereal; ldt: var integer): cint {.importc: "dlarzt_".}
  
  proc clapack_dlas2*(f: ptr doublereal; g: ptr doublereal; h: ptr doublereal;               ssmin: ptr doublereal; ssmax: ptr doublereal): cint {.importc: "dlas2_".}
  
  proc clapack_dlascl*(mtype: var cstring; kl: var integer; ku: var integer;                cfrom: ptr doublereal; cto: ptr doublereal; m: var integer;                n: var integer; a: ptr doublereal; lda: var integer;                info: var integer): cint {.importc: "dlascl_".}
  
  proc clapack_dlascl2*(m: var integer; n: var integer; d: ptr doublereal;                 x: ptr doublereal; ldx: var integer): cint {.importc: "dlascl2_".}
  
  proc clapack_dlasd0*(n: var integer; sqre: var integer; d: ptr doublereal;                e: ptr doublereal; u: ptr doublereal; ldu: var integer;                vt: ptr doublereal; ldvt: var integer; smlsiz: var integer;                iwork: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dlasd0_".}
  
  proc clapack_dlasd1*(nl: var integer; nr: var integer; sqre: var integer;                d: ptr doublereal; alpha: ptr doublereal;                beta: ptr doublereal; u: ptr doublereal; ldu: var integer;                vt: ptr doublereal; ldvt: var integer; idxq: var integer;                iwork: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dlasd1_".}
  
  proc clapack_dlasd2*(nl: var integer; nr: var integer; sqre: var integer;                k: var integer; d: ptr doublereal; z: ptr doublereal;                alpha: ptr doublereal; beta: ptr doublereal; u: ptr doublereal;                ldu: var integer; vt: ptr doublereal; ldvt: var integer;                dsigma: ptr doublereal; u2: ptr doublereal; ldu2: var integer;                vt2: ptr doublereal; ldvt2: var integer; idxp: var integer;                idx: var integer; idxc: var integer; idxq: var integer;                coltyp: var integer; info: var integer): cint {.importc: "dlasd2_".}
  
  proc clapack_dlasd3*(nl: var integer; nr: var integer; sqre: var integer;                k: var integer; d: ptr doublereal; q: ptr doublereal;                ldq: var integer; dsigma: ptr doublereal; u: ptr doublereal;                ldu: var integer; u2: ptr doublereal; ldu2: var integer;                vt: ptr doublereal; ldvt: var integer; vt2: ptr doublereal;                ldvt2: var integer; idxc: var integer; ctot: var integer;                z: ptr doublereal; info: var integer): cint {.importc: "dlasd3_".}
  
  proc clapack_dlasd4*(n: var integer; i: var integer; d: ptr doublereal;                z: ptr doublereal; delta: ptr doublereal; rho: ptr doublereal;                sigma: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dlasd4_".}
  
  proc clapack_dlasd5*(i: var integer; d: ptr doublereal; z: ptr doublereal;                delta: ptr doublereal; rho: ptr doublereal;                dsigma: ptr doublereal; work: ptr doublereal): cint {.importc: "dlasd5_".}
  
  proc clapack_dlasd6*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; d: ptr doublereal; vf: ptr doublereal;                vl: ptr doublereal; alpha: ptr doublereal; beta: ptr doublereal;                idxq: var integer; perm: var integer; givptr: var integer;                givcol: var integer; ldgcol: var integer;                givnum: ptr doublereal; ldgnum: var integer;                poles: ptr doublereal; difl: ptr doublereal;                difr: ptr doublereal; z: ptr doublereal; k: var integer;                c: ptr doublereal; s: ptr doublereal; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dlasd6_".}
  
  proc clapack_dlasd7*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; k: var integer; d: ptr doublereal;                z: ptr doublereal; zw: ptr doublereal; vf: ptr doublereal;                vfw: ptr doublereal; vl: ptr doublereal; vlw: ptr doublereal;                alpha: ptr doublereal; beta: ptr doublereal;                dsigma: ptr doublereal; idx: var integer; idxp: var integer;                idxq: var integer; perm: var integer; givptr: var integer;                givcol: var integer; ldgcol: var integer;                givnum: ptr doublereal; ldgnum: var integer;                c: ptr doublereal; s: ptr doublereal; info: var integer): cint {.importc: "dlasd7_".}
  
  proc clapack_dlasd8*(icompq: var integer; k: var integer; d: ptr doublereal;                z: ptr doublereal; vf: ptr doublereal; vl: ptr doublereal;                difl: ptr doublereal; difr: ptr doublereal; lddifr: var integer;                dsigma: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dlasd8_".}
  
  proc clapack_dlasda*(icompq: var integer; smlsiz: var integer; n: var integer;                sqre: var integer; d: ptr doublereal; e: ptr doublereal;                u: ptr doublereal; ldu: var integer; vt: ptr doublereal;                k: var integer; difl: ptr doublereal; difr: ptr doublereal;                z: ptr doublereal; poles: ptr doublereal; givptr: var integer;                givcol: var integer; ldgcol: var integer; perm: var integer;                givnum: ptr doublereal; c: ptr doublereal; s: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dlasda_".}
  
  proc clapack_dlasdq*(uplo: var cstring; sqre: var integer; n: var integer;                ncvt: var integer; nru: var integer; ncc: var integer;                d: ptr doublereal; e: ptr doublereal; vt: ptr doublereal;                ldvt: var integer; u: ptr doublereal; ldu: var integer;                c: ptr doublereal; ldc: var integer; work: ptr doublereal;                info: var integer): cint {.importc: "dlasdq_".}
  
  proc clapack_dlasdt*(n: var integer; lvl: var integer; nd: var integer;                inode: var integer; ndiml: var integer; ndimr: var integer;                msub: var integer): cint {.importc: "dlasdt_".}
  
  proc clapack_dlaset*(uplo: var cstring; m: var integer; n: var integer;                alpha: ptr doublereal; beta: ptr doublereal; a: ptr doublereal;                lda: var integer): cint {.importc: "dlaset_".}
  
  proc clapack_dlasq1*(n: var integer; d: ptr doublereal; e: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dlasq1_".}
  
  proc clapack_dlasq2*(n: var integer; z: ptr doublereal; info: var integer): cint {.importc: "dlasq2_".}
  
  proc clapack_dlasq3*(i0: var integer; n0: var integer; z: ptr doublereal;                pp: var integer; dmin: ptr doublereal; sigma: ptr doublereal;                desig: ptr doublereal; qmax: ptr doublereal; nfail: var integer;                iter: var integer; ndiv: var integer; ieee: ptr logical;                ttype: var integer; dmin1: ptr doublereal;                dmin2: ptr doublereal; dn: ptr doublereal; dn1: ptr doublereal;                dn2: ptr doublereal; g: ptr doublereal; tau: ptr doublereal): cint {.importc: "dlasq3_".}
  
  proc clapack_dlasq4*(i0: var integer; n0: var integer; z: ptr doublereal;                pp: var integer; n0in: var integer; dmin: ptr doublereal;                dmin1: ptr doublereal; dmin2: ptr doublereal;                dn: ptr doublereal; dn1: ptr doublereal; dn2: ptr doublereal;                tau: ptr doublereal; ttype: var integer; g: ptr doublereal): cint {.importc: "dlasq4_".}
  
  proc clapack_dlasq5*(i0: var integer; n0: var integer; z: ptr doublereal;                pp: var integer; tau: ptr doublereal; dmin: ptr doublereal;                dmin1: ptr doublereal; dmin2: ptr doublereal;                dn: ptr doublereal; dnm1: ptr doublereal; dnm2: ptr doublereal;                ieee: ptr logical): cint {.importc: "dlasq5_".}
  
  proc clapack_dlasq6*(i0: var integer; n0: var integer; z: ptr doublereal;                pp: var integer; dmin: ptr doublereal; dmin1: ptr doublereal;                dmin2: ptr doublereal; dn: ptr doublereal; dnm1: ptr doublereal;                dnm2: ptr doublereal): cint {.importc: "dlasq6_".}
  
  proc clapack_dlasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;               n: var integer; c: ptr doublereal; s: ptr doublereal;               a: ptr doublereal; lda: var integer): cint {.importc: "dlasr_".}
  
  proc clapack_dlasrt*(id: var cstring; n: var integer; d: ptr doublereal;                info: var integer): cint {.importc: "dlasrt_".}
  
  proc clapack_dlassq*(n: var integer; x: ptr doublereal; incx: var integer;                scale: ptr doublereal; sumsq: ptr doublereal): cint {.importc: "dlassq_".}
  
  proc clapack_dlasv2*(f: ptr doublereal; g: ptr doublereal; h: ptr doublereal;                ssmin: ptr doublereal; ssmax: ptr doublereal;                snr: ptr doublereal; csr: ptr doublereal; snl: ptr doublereal;                csl: ptr doublereal): cint {.importc: "dlasv2_".}
  
  proc clapack_dlaswp*(n: var integer; a: ptr doublereal; lda: var integer;                k1: var integer; k2: var integer; ipiv: var cint;                incx: var integer): cint {.importc: "dlaswp_".}
  
  proc clapack_dlasy2*(ltranl: ptr logical; ltranr: ptr logical; isgn: var integer;                n1: var integer; n2: var integer; tl: ptr doublereal;                ldtl: var integer; tr: ptr doublereal; ldtr: var integer;                b: ptr doublereal; ldb: var integer; scale: ptr doublereal;                x: ptr doublereal; ldx: var integer; xnorm: ptr doublereal;                info: var integer): cint {.importc: "dlasy2_".}
  
  proc clapack_dlasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;                a: ptr doublereal; lda: var integer; ipiv: var cint;                w: ptr doublereal; ldw: var integer; info: var integer): cint {.importc: "dlasyf_".}
  
  proc clapack_dlat2s*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; sa: ptr real; ldsa: var integer;                info: var integer): cint {.importc: "dlat2s_".}
  
  proc clapack_dlatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; kd: var integer; ab: ptr doublereal;                ldab: var integer; x: ptr doublereal; scale: ptr doublereal;                cnorm: ptr doublereal; info: var integer): cint {.importc: "dlatbs_".}
  
  proc clapack_dlatdf*(ijob: var integer; n: var integer; z: ptr doublereal;                ldz: var integer; rhs: ptr doublereal; rdsum: ptr doublereal;                rdscal: ptr doublereal; ipiv: var cint; jpiv: var cint): cint {.importc: "dlatdf_".}
  
  proc clapack_dlatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; ap: ptr doublereal; x: ptr doublereal;                scale: ptr doublereal; cnorm: ptr doublereal; info: var integer): cint {.importc: "dlatps_".}
  
  proc clapack_dlatrd*(uplo: var cstring; n: var integer; nb: var integer;                a: ptr doublereal; lda: var integer; e: ptr doublereal;                tau: ptr doublereal; w: ptr doublereal; ldw: var integer): cint {.importc: "dlatrd_".}
  
  proc clapack_dlatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; a: ptr doublereal; lda: var integer;                x: ptr doublereal; scale: ptr doublereal; cnorm: ptr doublereal;                info: var integer): cint {.importc: "dlatrs_".}
  
  proc clapack_dlatrz*(m: var integer; n: var integer; l: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal): cint {.importc: "dlatrz_".}
  
  proc clapack_dlatzm*(side: var cstring; m: var integer; n: var integer;                v: ptr doublereal; incv: var integer; tau: ptr doublereal;                c1: ptr doublereal; c2: ptr doublereal; ldc: var integer;                work: ptr doublereal): cint {.importc: "dlatzm_".}
  
  proc clapack_dlauu2*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dlauu2_".}
  
  proc clapack_dlauum*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dlauum_".}
  
  proc clapack_dopgtr*(uplo: var cstring; n: var integer; ap: ptr doublereal;                tau: ptr doublereal; q: ptr doublereal; ldq: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dopgtr_".}
  
  proc clapack_dopmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; ap: ptr doublereal; tau: ptr doublereal;                c: ptr doublereal; ldc: var integer; work: ptr doublereal;                info: var integer): cint {.importc: "dopmtr_".}
  
  proc clapack_dorg2l*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dorg2l_".}
  
  proc clapack_dorg2r*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dorg2r_".}
  
  proc clapack_dorgbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgbr_".}
  
  proc clapack_dorghr*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorghr_".}
  
  proc clapack_dorgl2*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dorgl2_".}
  
  proc clapack_dorglq*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorglq_".}
  
  proc clapack_dorgql*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgql_".}
  
  proc clapack_dorgqr*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgqr_".}
  
  proc clapack_dorgr2*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dorgr2_".}
  
  proc clapack_dorgrq*(m: var integer; n: var integer; k: var integer;                a: ptr doublereal; lda: var integer; tau: ptr doublereal;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgrq_".}
  
  proc clapack_dorgtr*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dorgtr_".}
  
  proc clapack_dorm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dorm2l_".}
  
  proc clapack_dorm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dorm2r_".}
  
  proc clapack_dormbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;                n: var integer; k: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; c: ptr doublereal;                ldc: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dormbr_".}
  
  proc clapack_dormhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                ilo: var integer; ihi: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; c: ptr doublereal;                ldc: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dormhr_".}
  
  proc clapack_dorml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dorml2_".}
  
  proc clapack_dormlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormlq_".}
  
  proc clapack_dormql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormql_".}
  
  proc clapack_dormqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormqr_".}
  
  proc clapack_dormr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dormr2_".}
  
  proc clapack_dormr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; c: ptr doublereal;                ldc: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dormr3_".}
  
  proc clapack_dormrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormrq_".}
  
  proc clapack_dormrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; c: ptr doublereal;                ldc: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dormrz_".}
  
  proc clapack_dormtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; a: ptr doublereal; lda: var integer;                tau: ptr doublereal; c: ptr doublereal; ldc: var integer;                work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormtr_".}
  
  proc clapack_dpbcon*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; anorm: ptr doublereal;                rcond: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dpbcon_".}
  
  proc clapack_dpbequ*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; s: ptr doublereal;                scond: ptr doublereal; amax: ptr doublereal; info: var integer): cint {.importc: "dpbequ_".}
  
  proc clapack_dpbrfs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr doublereal; ldab: var integer;                afb: ptr doublereal; ldafb: var integer; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpbrfs_".}
  
  proc clapack_dpbstf*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; info: var integer): cint {.importc: "dpbstf_".}
  
  proc clapack_dpbsv*(uplo: var cstring; n: var integer; kd: var integer;               nrhs: var integer; ab: ptr doublereal; ldab: var integer;               b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dpbsv_".}
  
  proc clapack_dpbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr doublereal; ldab: var integer;                afb: ptr doublereal; ldafb: var integer; equed: var cstring;                s: ptr doublereal; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpbsvx_".}
  
  proc clapack_dpbtf2*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; info: var integer): cint {.importc: "dpbtf2_".}
  
  proc clapack_dpbtrf*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; info: var integer): cint {.importc: "dpbtrf_".}
  
  proc clapack_dpbtrs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr doublereal; ldab: var integer;                b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dpbtrs_".}
  
  proc clapack_dpftrf*(transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublereal; info: var integer): cint {.importc: "dpftrf_".}
  
  proc clapack_dpftri*(transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublereal; info: var integer): cint {.importc: "dpftri_".}
  
  proc clapack_dpftrs*(transr: var cstring; uplo: var cstring; n: var integer;                nrhs: var integer; a: ptr doublereal; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dpftrs_".}
  
  proc clapack_dpocon*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpocon_".}
  
  proc clapack_dpoequ*(n: var integer; a: ptr doublereal; lda: var integer;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                info: var integer): cint {.importc: "dpoequ_".}
  
  proc clapack_dpoequb*(n: var integer; a: ptr doublereal; lda: var integer;                 s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                 info: var integer): cint {.importc: "dpoequb_".}
  
  proc clapack_dporfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; af: ptr doublereal;                ldaf: var integer; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dporfs_".}
  
  proc clapack_dporfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublereal; lda: var integer;                 af: ptr doublereal; ldaf: var integer; s: ptr doublereal;                 b: ptr doublereal; ldb: var integer; x: ptr doublereal;                 ldx: var integer; rcond: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dporfsx_".}
  
  proc clapack_dposv*(uplo: var cstring; n: var integer; nrhs: var integer;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer; info: var integer): cint {.importc: "dposv_".}
  
  proc clapack_dposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; af: ptr doublereal;                ldaf: var integer; equed: var cstring; s: ptr doublereal;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dposvx_".}
  
  proc clapack_dposvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublereal; lda: var integer;                 af: ptr doublereal; ldaf: var integer; equed: var cstring;                 s: ptr doublereal; b: ptr doublereal; ldb: var integer;                 x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                 rpvgrw: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dposvxx_".}
  
  proc clapack_dpotf2*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dpotf2_".}
  
  proc clapack_dpotrf*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dpotrf_".}
  
  proc clapack_dpotri*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dpotri_".}
  
  proc clapack_dpotrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dpotrs_".}
  
  proc clapack_dppcon*(uplo: var cstring; n: var integer; ap: ptr doublereal;                anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dppcon_".}
  
  proc clapack_dppequ*(uplo: var cstring; n: var integer; ap: ptr doublereal;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                info: var integer): cint {.importc: "dppequ_".}
  
  proc clapack_dpprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublereal; afp: ptr doublereal; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpprfs_".}
  
  proc clapack_dppsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr doublereal; b: ptr doublereal; ldb: var integer;               info: var integer): cint {.importc: "dppsv_".}
  
  proc clapack_dppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublereal; afp: ptr doublereal; equed: var cstring;                s: ptr doublereal; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dppsvx_".}
  
  proc clapack_dpptrf*(uplo: var cstring; n: var integer; ap: ptr doublereal;                info: var integer): cint {.importc: "dpptrf_".}
  
  proc clapack_dpptri*(uplo: var cstring; n: var integer; ap: ptr doublereal;                info: var integer): cint {.importc: "dpptri_".}
  
  proc clapack_dpptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublereal; b: ptr doublereal; ldb: var integer;                info: var integer): cint {.importc: "dpptrs_".}
  
  proc clapack_dpstf2*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; piv: var integer; rank: var integer;                tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dpstf2_".}
  
  proc clapack_dpstrf*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; piv: var integer; rank: var integer;                tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dpstrf_".}
  
  proc clapack_dptcon*(n: var integer; d: ptr doublereal; e: ptr doublereal;                anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dptcon_".}
  
  proc clapack_dpteqr*(compz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dpteqr_".}
  
  proc clapack_dptrfs*(n: var integer; nrhs: var integer; d: ptr doublereal;                e: ptr doublereal; df: ptr doublereal; ef: ptr doublereal;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dptrfs_".}
  
  proc clapack_dptsv*(n: var integer; nrhs: var integer; d: ptr doublereal;               e: ptr doublereal; b: ptr doublereal; ldb: var integer;               info: var integer): cint {.importc: "dptsv_".}
  
  proc clapack_dptsvx*(fact: var cstring; n: var integer; nrhs: var integer;                d: ptr doublereal; e: ptr doublereal; df: ptr doublereal;                ef: ptr doublereal; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; info: var integer): cint {.importc: "dptsvx_".}
  
  proc clapack_dpttrf*(n: var integer; d: ptr doublereal; e: ptr doublereal;                info: var integer): cint {.importc: "dpttrf_".}
  
  proc clapack_dpttrs*(n: var integer; nrhs: var integer; d: ptr doublereal;                e: ptr doublereal; b: ptr doublereal; ldb: var integer;                info: var integer): cint {.importc: "dpttrs_".}
  
  proc clapack_dptts2*(n: var integer; nrhs: var integer; d: ptr doublereal;                e: ptr doublereal; b: ptr doublereal; ldb: var integer): cint {.importc: "dptts2_".}
  
  proc clapack_drscl*(n: var integer; sa: ptr doublereal; sx: ptr doublereal;               incx: var integer): cint {.importc: "drscl_".}
  
  proc clapack_dsbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;               ab: ptr doublereal; ldab: var integer; w: ptr doublereal;               z: ptr doublereal; ldz: var integer; work: ptr doublereal;               info: var integer): cint {.importc: "dsbev_".}
  
  proc clapack_dsbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "dsbevd_".}
  
  proc clapack_dsbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                kd: var integer; ab: ptr doublereal; ldab: var integer;                q: ptr doublereal; ldq: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "dsbevx_".}
  
  proc clapack_dsbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr doublereal; ldab: var integer;                bb: ptr doublereal; ldbb: var integer; x: ptr doublereal;                ldx: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dsbgst_".}
  
  proc clapack_dsbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;               kb: var integer; ab: ptr doublereal; ldab: var integer;               bb: ptr doublereal; ldbb: var integer; w: ptr doublereal;               z: ptr doublereal; ldz: var integer; work: ptr doublereal;               info: var integer): cint {.importc: "dsbgv_".}
  
  proc clapack_dsbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr doublereal; ldab: var integer;                bb: ptr doublereal; ldbb: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "dsbgvd_".}
  
  proc clapack_dsbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ka: var integer; kb: var integer; ab: ptr doublereal;                ldab: var integer; bb: ptr doublereal; ldbb: var integer;                q: ptr doublereal; ldq: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "dsbgvx_".}
  
  proc clapack_dsbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublereal; ldab: var integer; d: ptr doublereal;                e: ptr doublereal; q: ptr doublereal; ldq: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dsbtrd_".}
  
  proc clapack_dsfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;               k: var integer; alpha: ptr doublereal; a: ptr doublereal;               lda: var integer; beta: ptr doublereal; c: ptr doublereal): cint {.importc: "dsfrk_".}
  
  proc clapack_dsgesv*(n: var integer; nrhs: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                work: ptr doublereal; swork: ptr real; iter: var integer;                info: var integer): cint {.importc: "dsgesv_".}
  
  proc clapack_dspcon*(uplo: var cstring; n: var integer; ap: ptr doublereal;                ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dspcon_".}
  
  proc clapack_dspev*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr doublereal;               w: ptr doublereal; z: ptr doublereal; ldz: var integer;               work: ptr doublereal; info: var integer): cint {.importc: "dspev_".}
  
  proc clapack_dspevd*(jobz: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublereal; w: ptr doublereal; z: ptr doublereal;                ldz: var integer; work: ptr doublereal; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "dspevd_".}
  
  proc clapack_dspevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublereal; vl: ptr doublereal; vu: ptr doublereal;                il: var integer; iu: var integer; abstol: ptr doublereal;                m: var integer; w: ptr doublereal; z: ptr doublereal;                ldz: var integer; work: ptr doublereal; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "dspevx_".}
  
  proc clapack_dspgst*(itype: var integer; uplo: var cstring; n: var integer;                ap: ptr doublereal; bp: ptr doublereal; info: var integer): cint {.importc: "dspgst_".}
  
  proc clapack_dspgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               ap: ptr doublereal; bp: ptr doublereal; w: ptr doublereal;               z: ptr doublereal; ldz: var integer; work: ptr doublereal;               info: var integer): cint {.importc: "dspgv_".}
  
  proc clapack_dspgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; ap: ptr doublereal; bp: ptr doublereal;                w: ptr doublereal; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dspgvd_".}
  
  proc clapack_dspgvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; ap: ptr doublereal;                bp: ptr doublereal; vl: ptr doublereal; vu: ptr doublereal;                il: var integer; iu: var integer; abstol: ptr doublereal;                m: var integer; w: ptr doublereal; z: ptr doublereal;                ldz: var integer; work: ptr doublereal; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "dspgvx_".}
  
  proc clapack_dsposv*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                work: ptr doublereal; swork: ptr real; iter: var integer;                info: var integer): cint {.importc: "dsposv_".}
  
  proc clapack_dsprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublereal; afp: ptr doublereal; ipiv: var cint;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dsprfs_".}
  
  proc clapack_dspsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr doublereal; ipiv: var cint; b: ptr doublereal;               ldb: var integer; info: var integer): cint {.importc: "dspsv_".}
  
  proc clapack_dspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublereal; afp: ptr doublereal; ipiv: var cint;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dspsvx_".}
  
  proc clapack_dsptrd*(uplo: var cstring; n: var integer; ap: ptr doublereal;                d: ptr doublereal; e: ptr doublereal; tau: ptr doublereal;                info: var integer): cint {.importc: "dsptrd_".}
  
  proc clapack_dsptrf*(uplo: var cstring; n: var integer; ap: ptr doublereal;                ipiv: var cint; info: var integer): cint {.importc: "dsptrf_".}
  
  proc clapack_dsptri*(uplo: var cstring; n: var integer; ap: ptr doublereal;                ipiv: var cint; work: ptr doublereal; info: var integer): cint {.importc: "dsptri_".}
  
  proc clapack_dsptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublereal; ipiv: var cint; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dsptrs_".}
  
  proc clapack_dstebz*(range: var cstring; order: var cstring; n: var integer;                vl: ptr doublereal; vu: ptr doublereal; il: var integer;                iu: var integer; abstol: ptr doublereal; d: ptr doublereal;                e: ptr doublereal; m: var integer; nsplit: var integer;                w: ptr doublereal; iblock: var integer; isplit: var integer;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dstebz_".}
  
  proc clapack_dstedc*(compz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dstedc_".}
  
  proc clapack_dstegr*(jobz: var cstring; range: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; isuppz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dstegr_".}
  
  proc clapack_dstein*(n: var integer; d: ptr doublereal; e: ptr doublereal;                m: var integer; w: ptr doublereal; iblock: var integer;                isplit: var integer; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "dstein_".}
  
  proc clapack_dstemr*(jobz: var cstring; range: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                m: var integer; w: ptr doublereal; z: ptr doublereal;                ldz: var integer; nzc: var integer; isuppz: var integer;                tryrac: ptr logical; work: ptr doublereal; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "dstemr_".}
  
  proc clapack_dsteqr*(compz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dsteqr_".}
  
  proc clapack_dsterf*(n: var integer; d: ptr doublereal; e: ptr doublereal;                info: var integer): cint {.importc: "dsterf_".}
  
  proc clapack_dstev*(jobz: var cstring; n: var integer; d: ptr doublereal;               e: ptr doublereal; z: ptr doublereal; ldz: var integer;               work: ptr doublereal; info: var integer): cint {.importc: "dstev_".}
  
  proc clapack_dstevd*(jobz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dstevd_".}
  
  proc clapack_dstevr*(jobz: var cstring; range: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; isuppz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dstevr_".}
  
  proc clapack_dstevx*(jobz: var cstring; range: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "dstevx_".}
  
  proc clapack_dsycon*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; anorm: ptr doublereal;                rcond: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dsycon_".}
  
  proc clapack_dsyequb*(uplo: var cstring; n: var integer; a: ptr doublereal;                 lda: var integer; s: ptr doublereal; scond: ptr doublereal;                 amax: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dsyequb_".}
  
  proc clapack_dsyev*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr doublereal;               lda: var integer; w: ptr doublereal; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dsyev_".}
  
  proc clapack_dsyevd*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; w: ptr doublereal; work: ptr doublereal;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "dsyevd_".}
  
  proc clapack_dsyevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr doublereal; lda: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; isuppz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dsyevr_".}
  
  proc clapack_dsyevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr doublereal; lda: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublereal; ldz: var integer; work: ptr doublereal;                lwork: var integer; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "dsyevx_".}
  
  proc clapack_dsygs2*(itype: var integer; uplo: var cstring; n: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dsygs2_".}
  
  proc clapack_dsygst*(itype: var integer; uplo: var cstring; n: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dsygst_".}
  
  proc clapack_dsygv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               a: ptr doublereal; lda: var integer; b: ptr doublereal;               ldb: var integer; w: ptr doublereal; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dsygv_".}
  
  proc clapack_dsygvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; w: ptr doublereal;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dsygvd_".}
  
  proc clapack_dsygvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                vl: ptr doublereal; vu: ptr doublereal; il: var integer;                iu: var integer; abstol: ptr doublereal; m: var integer;                w: ptr doublereal; z: ptr doublereal; ldz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "dsygvx_".}
  
  proc clapack_dsyrfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; af: ptr doublereal;                ldaf: var integer; ipiv: var cint; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dsyrfs_".}
  
  proc clapack_dsyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublereal; lda: var integer;                 af: ptr doublereal; ldaf: var integer; ipiv: var cint;                 s: ptr doublereal; b: ptr doublereal; ldb: var integer;                 x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dsyrfsx_".}
  
  proc clapack_dsysv*(uplo: var cstring; n: var integer; nrhs: var integer;               a: ptr doublereal; lda: var integer; ipiv: var cint;               b: ptr doublereal; ldb: var integer; work: ptr doublereal;               lwork: var integer; info: var integer): cint {.importc: "dsysv_".}
  
  proc clapack_dsysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; af: ptr doublereal;                ldaf: var integer; ipiv: var cint; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "dsysvx_".}
  
  proc clapack_dsysvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublereal; lda: var integer;                 af: ptr doublereal; ldaf: var integer; ipiv: var cint;                 equed: var cstring; s: ptr doublereal; b: ptr doublereal;                 ldb: var integer; x: ptr doublereal; ldx: var integer;                 rcond: ptr doublereal; rpvgrw: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublereal;                 iwork: var integer; info: var integer): cint {.importc: "dsysvxx_".}
  
  proc clapack_dsytd2*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tau: ptr doublereal; info: var integer): cint {.importc: "dsytd2_".}
  
  proc clapack_dsytf2*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "dsytf2_".}
  
  proc clapack_dsytrd*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tau: ptr doublereal; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dsytrd_".}
  
  proc clapack_dsytrf*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dsytrf_".}
  
  proc clapack_dsytri*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; ipiv: var cint; work: ptr doublereal;                info: var integer): cint {.importc: "dsytri_".}
  
  proc clapack_dsytrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublereal; lda: var integer; ipiv: var cint;                b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dsytrs_".}
  
  proc clapack_dtbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                kd: var integer; ab: ptr doublereal; ldab: var integer;                rcond: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dtbcon_".}
  
  proc clapack_dtbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr doublereal;                ldab: var integer; b: ptr doublereal; ldb: var integer;                x: ptr doublereal; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "dtbrfs_".}
  
  proc clapack_dtbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr doublereal;                ldab: var integer; b: ptr doublereal; ldb: var integer;                info: var integer): cint {.importc: "dtbtrs_".}
  
  proc clapack_dtfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;               diag: var cstring; m: var integer; n: var integer;               alpha: ptr doublereal; a: ptr doublereal; b: ptr doublereal;               ldb: var integer): cint {.importc: "dtfsm_".}
  
  proc clapack_dtftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr doublereal; info: var integer): cint {.importc: "dtftri_".}
  
  proc clapack_dtfttp*(transr: var cstring; uplo: var cstring; n: var integer;                arf: ptr doublereal; ap: ptr doublereal; info: var integer): cint {.importc: "dtfttp_".}
  
  proc clapack_dtfttr*(transr: var cstring; uplo: var cstring; n: var integer;                arf: ptr doublereal; a: ptr doublereal; lda: var integer;                info: var integer): cint {.importc: "dtfttr_".}
  
  proc clapack_dtgevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; s: ptr doublereal; lds: var integer;                p: ptr doublereal; ldp: var integer; vl: ptr doublereal;                ldvl: var integer; vr: ptr doublereal; ldvr: var integer;                mm: var integer; m: var integer; work: ptr doublereal;                info: var integer): cint {.importc: "dtgevc_".}
  
  proc clapack_dtgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; q: ptr doublereal; ldq: var integer;                z: ptr doublereal; ldz: var integer; j1: var integer;                n1: var integer; n2: var integer; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dtgex2_".}
  
  proc clapack_dtgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; q: ptr doublereal; ldq: var integer;                z: ptr doublereal; ldz: var integer; ifst: var integer;                ilst: var integer; work: ptr doublereal; lwork: var integer;                info: var integer): cint {.importc: "dtgexc_".}
  
  proc clapack_dtgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;                select: ptr logical; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                alphar: ptr doublereal; alphai: ptr doublereal;                beta: ptr doublereal; q: ptr doublereal; ldq: var integer;                z: ptr doublereal; ldz: var integer; m: var integer;                pl: ptr doublereal; pr: ptr doublereal; dif: ptr doublereal;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "dtgsen_".}
  
  proc clapack_dtgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; k: var integer; l: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublereal;                ldb: var integer; tola: ptr doublereal; tolb: ptr doublereal;                alpha: ptr doublereal; beta: ptr doublereal; u: ptr doublereal;                ldu: var integer; v: ptr doublereal; ldv: var integer;                q: ptr doublereal; ldq: var integer; work: ptr doublereal;                ncycle: var integer; info: var integer): cint {.importc: "dtgsja_".}
  
  proc clapack_dtgsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; vl: ptr doublereal;                ldvl: var integer; vr: ptr doublereal; ldvr: var integer;                s: ptr doublereal; dif: ptr doublereal; mm: var integer;                m: var integer; work: ptr doublereal; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "dtgsna_".}
  
  proc clapack_dtgsy2*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; c: ptr doublereal;                ldc: var integer; d: ptr doublereal; ldd: var integer;                e: ptr doublereal; lde: var integer; f: ptr doublereal;                ldf: var integer; scale: ptr doublereal; rdsum: ptr doublereal;                rdscal: ptr doublereal; iwork: var integer; pq: var integer;                info: var integer): cint {.importc: "dtgsy2_".}
  
  proc clapack_dtgsyl*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; c: ptr doublereal;                ldc: var integer; d: ptr doublereal; ldd: var integer;                e: ptr doublereal; lde: var integer; f: ptr doublereal;                ldf: var integer; scale: ptr doublereal; dif: ptr doublereal;                work: ptr doublereal; lwork: var integer; iwork: var integer;                info: var integer): cint {.importc: "dtgsyl_".}
  
  proc clapack_dtpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr doublereal; rcond: ptr doublereal; work: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "dtpcon_".}
  
  proc clapack_dtprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr doublereal; b: ptr doublereal;                ldb: var integer; x: ptr doublereal; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dtprfs_".}
  
  proc clapack_dtptri*(uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr doublereal; info: var integer): cint {.importc: "dtptri_".}
  
  proc clapack_dtptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr doublereal; b: ptr doublereal;                ldb: var integer; info: var integer): cint {.importc: "dtptrs_".}
  
  proc clapack_dtpttf*(transr: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublereal; arf: ptr doublereal; info: var integer): cint {.importc: "dtpttf_".}
  
  proc clapack_dtpttr*(uplo: var cstring; n: var integer; ap: ptr doublereal;                a: ptr doublereal; lda: var integer; info: var integer): cint {.importc: "dtpttr_".}
  
  proc clapack_dtrcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr doublereal; lda: var integer; rcond: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dtrcon_".}
  
  proc clapack_dtrevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr doublereal; ldt: var integer;                vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;                ldvr: var integer; mm: var integer; m: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "dtrevc_".}
  
  proc clapack_dtrexc*(compq: var cstring; n: var integer; t: ptr doublereal;                ldt: var integer; q: ptr doublereal; ldq: var integer;                ifst: var integer; ilst: var integer; work: ptr doublereal;                info: var integer): cint {.importc: "dtrexc_".}
  
  proc clapack_dtrrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; x: ptr doublereal;                ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dtrrfs_".}
  
  proc clapack_dtrsen*(job: var cstring; compq: var cstring; select: ptr logical;                n: var integer; t: ptr doublereal; ldt: var integer;                q: ptr doublereal; ldq: var integer; wr: ptr doublereal;                wi: ptr doublereal; m: var integer; s: ptr doublereal;                sep: ptr doublereal; work: ptr doublereal; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "dtrsen_".}
  
  proc clapack_dtrsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr doublereal; ldt: var integer;                vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;                ldvr: var integer; s: ptr doublereal; sep: ptr doublereal;                mm: var integer; m: var integer; work: ptr doublereal;                ldwork: var integer; iwork: var integer; info: var integer): cint {.importc: "dtrsna_".}
  
  proc clapack_dtrsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;                m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublereal; ldb: var integer;                c: ptr doublereal; ldc: var integer; scale: ptr doublereal;                info: var integer): cint {.importc: "dtrsyl_".}
  
  proc clapack_dtrti2*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dtrti2_".}
  
  proc clapack_dtrtri*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; info: var integer): cint {.importc: "dtrtri_".}
  
  proc clapack_dtrtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr doublereal; lda: var integer;                b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dtrtrs_".}
  
  proc clapack_dtrttf*(transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublereal; lda: var integer; arf: ptr doublereal;                info: var integer): cint {.importc: "dtrttf_".}
  
  proc clapack_dtrttp*(uplo: var cstring; n: var integer; a: ptr doublereal;                lda: var integer; ap: ptr doublereal; info: var integer): cint {.importc: "dtrttp_".}
  
  proc clapack_dtzrqf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; info: var integer): cint {.importc: "dtzrqf_".}
  
  proc clapack_dtzrzf*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; tau: ptr doublereal; work: ptr doublereal;                lwork: var integer; info: var integer): cint {.importc: "dtzrzf_".}
  proc clapack_dzsum1*(n: var integer; cx: ptr doublecomplex; incx: var integer): doublereal {.importc: "dzsum1_".}

  #___________________________________________________________________________
  #
  # 
  #___________________________________________________________________________

  proc clapack_icmax1*(n: var integer; cx: ptr complex; incx: var integer): integer {.importc: "icmax1_".}
  proc clapack_ieeeck*(ispec: var integer; zero: ptr real; one: ptr real): integer {.importc: "ieeeck_".}
  proc clapack_ilaclc*(m: var integer; n: var integer; a: ptr complex; lda: var integer): integer {.importc: "ilaclc_".}
  proc clapack_ilaclr*(m: var integer; n: var integer; a: ptr complex; lda: var integer): integer {.importc: "ilaclr_".}
  proc clapack_iladiag*(diag: var cstring): integer {.importc: "iladiag_".}
  proc clapack_iladlc*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer): integer {.importc: "iladlc_".}
  proc clapack_iladlr*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer): integer {.importc: "iladlr_".}
  proc clapack_ilaenv*(ispec: var integer; name: var cstring; opts: var cstring;                n1: var integer; n2: var integer; n3: var integer;                n4: var integer): integer {.importc: "ilaenv_".}
  proc clapack_ilaprec*(prec: var cstring): integer {.importc: "ilaprec_".}
  proc clapack_ilaslc*(m: var integer; n: var integer; a: ptr real; lda: var integer): integer {.importc: "ilaslc_".}
  proc clapack_ilaslr*(m: var integer; n: var integer; a: ptr real; lda: var integer): integer {.importc: "ilaslr_".}
  proc clapack_ilatrans*(trans: var cstring): integer {.importc: "ilatrans_".}
  proc clapack_ilauplo*(uplo: var cstring): integer {.importc: "ilauplo_".}
  
  proc clapack_ilaver*(vers_major: var integer; vers_minor: var integer;                vers_patch: var integer): cint {.importc: "ilaver_".}
  proc clapack_ilazlc*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer): integer {.importc: "ilazlc_".}
  proc clapack_ilazlr*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer): integer {.importc: "ilazlr_".}
  proc clapack_iparmq*(ispec: var integer; name: var cstring; opts: var cstring;                n: var integer; ilo: var integer; ihi: var integer;                lwork: var integer): integer {.importc: "iparmq_".}
  proc clapack_izmax1*(n: var integer; cx: ptr doublecomplex; incx: var integer): integer {.importc: "izmax1_".}
  proc clapack_lsamen*(n: var integer; ca: var cstring; cb: var cstring): logical {.importc: "lsamen_".}
  proc clapack_smaxloc*(a: ptr real; dimm: var integer): integer {.importc: "smaxloc_".}

  #___________________________________________________________________________
  #
  # Real, single precision
  #___________________________________________________________________________
  
  proc clapack_sbdsdc*(uplo: var cstring; compq: var cstring; n: var integer; d: ptr real;                e: ptr real; u: ptr real; ldu: var integer; vt: ptr real;                ldvt: var integer; q: ptr real; iq: var integer; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sbdsdc_".}
  
  proc clapack_sbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;                nru: var integer; ncc: var integer; d: ptr real; e: ptr real;                vt: ptr real; ldvt: var integer; u: ptr real; ldu: var integer;                c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sbdsqr_".}
  proc clapack_scsum1*(n: var integer; cx: ptr complex; incx: var integer): doublereal {.importc: "scsum1_".}
  
  proc clapack_sdisna*(job: var cstring; m: var integer; n: var integer; d: ptr real;                sep: ptr real; info: var integer): cint {.importc: "sdisna_".}
  
  proc clapack_sgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;                kl: var integer; ku: var integer; ab: ptr real;                ldab: var integer; d: ptr real; e: ptr real; q: ptr real;                ldq: var integer; pt: ptr real; ldpt: var integer;                c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sgbbrd_".}
  
  proc clapack_sgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr real; ldab: var integer; ipiv: var cint;                anorm: ptr real; rcond: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sgbcon_".}
  
  proc clapack_sgbequ*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr real; ldab: var integer; r: ptr real;                c: ptr real; rowcnd: ptr real; colcnd: ptr real;                amax: ptr real; info: var integer): cint {.importc: "sgbequ_".}
  
  proc clapack_sgbequb*(m: var integer; n: var integer; kl: var integer;                 ku: var integer; ab: ptr real; ldab: var integer;                 r: ptr real; c: ptr real; rowcnd: ptr real;                 colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "sgbequb_".}
  
  proc clapack_sgbrfs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr real;                ldab: var integer; afb: ptr real; ldafb: var integer;                ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "sgbrfs_".}
  
  proc clapack_sgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;                 kl: var integer; ku: var integer; nrhs: var integer;                 ab: ptr real; ldab: var integer; afb: ptr real;                 ldafb: var integer; ipiv: var cint; r: ptr real;                 c: ptr real; b: ptr real; ldb: var integer; x: ptr real;                 ldx: var integer; rcond: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr real; iwork: var integer;                 info: var integer): cint {.importc: "sgbrfsx_".}
  
  proc clapack_sgbsv*(n: var integer; kl: var integer; ku: var integer;               nrhs: var integer; ab: ptr real; ldab: var integer;               ipiv: var cint; b: ptr real; ldb: var integer;               info: var integer): cint {.importc: "sgbsv_".}
  
  proc clapack_sgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr real;                ldab: var integer; afb: ptr real; ldafb: var integer;                ipiv: var cint; equed: var cstring; r: ptr real; c: ptr real;                b: ptr real; ldb: var integer; x: ptr real; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sgbsvx_".}
  
  proc clapack_sgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                 ku: var integer; nrhs: var integer; ab: ptr real;                 ldab: var integer; afb: ptr real; ldafb: var integer;                 ipiv: var cint; equed: var cstring; r: ptr real;                 c: ptr real; b: ptr real; ldb: var integer; x: ptr real;                 ldx: var integer; rcond: ptr real; rpvgrw: ptr real;                 berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr real;                 iwork: var integer; info: var integer): cint {.importc: "sgbsvxx_".}
  
  proc clapack_sgbtf2*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr real; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "sgbtf2_".}
  
  proc clapack_sgbtrf*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr real; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "sgbtrf_".}
  
  proc clapack_sgbtrs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr real;                ldab: var integer; ipiv: var cint; b: ptr real;                ldb: var integer; info: var integer): cint {.importc: "sgbtrs_".}
  
  proc clapack_sgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; scale: ptr real; m: var integer; v: ptr real;                ldv: var integer; info: var integer): cint {.importc: "sgebak_".}
  
  proc clapack_sgebal*(job: var cstring; n: var integer; a: ptr real; lda: var integer;                ilo: var integer; ihi: var integer; scale: ptr real;                info: var integer): cint {.importc: "sgebal_".}
  
  proc clapack_sgebd2*(m: var integer; n: var integer; a: ptr real; lda: var integer;                d: ptr real; e: ptr real; tauq: ptr real; taup: ptr real;                work: ptr real; info: var integer): cint {.importc: "sgebd2_".}
  
  proc clapack_sgebrd*(m: var integer; n: var integer; a: ptr real; lda: var integer;                d: ptr real; e: ptr real; tauq: ptr real; taup: ptr real;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgebrd_".}
  
  proc clapack_sgecon*(norm: var cstring; n: var integer; a: ptr real; lda: var integer;                anorm: ptr real; rcond: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sgecon_".}
  
  proc clapack_sgeequ*(m: var integer; n: var integer; a: ptr real; lda: var integer;                r: ptr real; c: ptr real; rowcnd: ptr real;                colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "sgeequ_".}
  
  proc clapack_sgeequb*(m: var integer; n: var integer; a: ptr real; lda: var integer;                 r: ptr real; c: ptr real; rowcnd: ptr real;                 colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "sgeequb_".}
  
  proc clapack_sgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;               a: ptr real; lda: var integer; sdim: var integer; wr: ptr real;               wi: ptr real; vs: ptr real; ldvs: var integer; work: ptr real;               lwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "sgees_".}
  
  proc clapack_sgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;                n: var integer; a: ptr real; lda: var integer;                sdim: var integer; wr: ptr real; wi: ptr real; vs: ptr real;                ldvs: var integer; rconde: ptr real; rcondv: ptr real;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "sgeesx_".}
  
  proc clapack_sgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr real;               lda: var integer; wr: ptr real; wi: ptr real; vl: ptr real;               ldvl: var integer; vr: ptr real; ldvr: var integer;               work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgeev_".}
  
  proc clapack_sgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr real; lda: var integer; wr: ptr real;                wi: ptr real; vl: ptr real; ldvl: var integer; vr: ptr real;                ldvr: var integer; ilo: var integer; ihi: var integer;                scale: ptr real; abnrm: ptr real; rconde: ptr real;                rcondv: ptr real; work: ptr real; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "sgeevx_".}
  
  proc clapack_sgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer; a: ptr real;               lda: var integer; b: ptr real; ldb: var integer;               alphar: ptr real; alphai: ptr real; beta: ptr real;               vsl: ptr real; ldvsl: var integer; vsr: ptr real;               ldvsr: var integer; work: ptr real; lwork: var integer;               info: var integer): cint {.importc: "sgegs_".}
  
  proc clapack_sgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr real;               lda: var integer; b: ptr real; ldb: var integer;               alphar: ptr real; alphai: ptr real; beta: ptr real; vl: ptr real;               ldvl: var integer; vr: ptr real; ldvr: var integer;               work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgegv_".}
  
  proc clapack_sgehd2*(n: var integer; ilo: var integer; ihi: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sgehd2_".}
  
  proc clapack_sgehrd*(n: var integer; ilo: var integer; ihi: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sgehrd_".}
  
  proc clapack_sgejsv*(joba: var cstring; jobu: var cstring; jobv: var cstring; jobr: var cstring;                jobt: var cstring; jobp: var cstring; m: var integer; n: var integer;                a: ptr real; lda: var integer; sva: ptr real; u: ptr real;                ldu: var integer; v: ptr real; ldv: var integer; work: ptr real;                lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "sgejsv_".}
  
  proc clapack_sgelq2*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgelq2_".}
  
  proc clapack_sgelqf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sgelqf_".}
  
  proc clapack_sgels*(trans: var cstring; m: var integer; n: var integer;               nrhs: var integer; a: ptr real; lda: var integer; b: ptr real;               ldb: var integer; work: ptr real; lwork: var integer;               info: var integer): cint {.importc: "sgels_".}
  
  proc clapack_sgelsd*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer; s: ptr real;                rcond: ptr real; rank: var integer; work: ptr real;                lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "sgelsd_".}
  
  proc clapack_sgelss*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer; s: ptr real;                rcond: ptr real; rank: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sgelss_".}
  
  proc clapack_sgelsx*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer;                jpvt: var integer; rcond: ptr real; rank: var integer;                work: ptr real; info: var integer): cint {.importc: "sgelsx_".}
  
  proc clapack_sgelsy*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer;                jpvt: var integer; rcond: ptr real; rank: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgelsy_".}
  
  proc clapack_sgeql2*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgeql2_".}
  
  proc clapack_sgeqlf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sgeqlf_".}
  
  proc clapack_sgeqp3*(m: var integer; n: var integer; a: ptr real; lda: var integer;                jpvt: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sgeqp3_".}
  
  proc clapack_sgeqpf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                jpvt: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sgeqpf_".}
  
  proc clapack_sgeqr2*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgeqr2_".}
  
  proc clapack_sgeqrf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sgeqrf_".}
  
  proc clapack_sgerfs*(trans: var cstring; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; af: ptr real; ldaf: var integer;                ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "sgerfs_".}
  
  proc clapack_sgerfsx*(trans: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                 ldaf: var integer; ipiv: var cint; r: ptr real;                 c: ptr real; b: ptr real; ldb: var integer; x: ptr real;                 ldx: var integer; rcond: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr real; iwork: var integer;                 info: var integer): cint {.importc: "sgerfsx_".}
  
  proc clapack_sgerq2*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgerq2_".}
  
  proc clapack_sgerqf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sgerqf_".}
  
  proc clapack_sgesc2*(n: var integer; a: ptr real; lda: var integer; rhs: ptr real;                ipiv: var cint; jpiv: var cint; scale: ptr real): cint {.importc: "sgesc2_".}
  
  proc clapack_sgesdd*(jobz: var cstring; m: var integer; n: var integer; a: ptr real;                lda: var integer; s: ptr real; u: ptr real; ldu: var integer;                vt: ptr real; ldvt: var integer; work: ptr real;                lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "sgesdd_".}
  
  proc clapack_sgesv*(n: var integer; nrhs: var integer; a: ptr real; lda: var integer;               ipiv: var cint; b: ptr real; ldb: var integer;               info: var integer): cint {.importc: "sgesv_".}
  
  proc clapack_sgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;                a: ptr real; lda: var integer; s: ptr real; u: ptr real;                ldu: var integer; vt: ptr real; ldvt: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgesvd_".}
  
  proc clapack_sgesvj*(joba: var cstring; jobu: var cstring; jobv: var cstring; m: var integer;                n: var integer; a: ptr real; lda: var integer; sva: ptr real;                mv: var integer; v: ptr real; ldv: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sgesvj_".}
  
  proc clapack_sgesvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                ldaf: var integer; ipiv: var cint; equed: var cstring;                r: ptr real; c: ptr real; b: ptr real; ldb: var integer;                x: ptr real; ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sgesvx_".}
  
  proc clapack_sgesvxx*(fact: var cstring; trans: var cstring; n: var integer;                 nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                 ldaf: var integer; ipiv: var cint; equed: var cstring;                 r: ptr real; c: ptr real; b: ptr real; ldb: var integer;                 x: ptr real; ldx: var integer; rcond: ptr real;                 rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr real;                 iwork: var integer; info: var integer): cint {.importc: "sgesvxx_".}
  
  proc clapack_sgetc2*(n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "sgetc2_".}
  
  proc clapack_sgetf2*(m: var integer; n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; info: var integer): cint {.importc: "sgetf2_".}
  
  proc clapack_sgetrf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; info: var integer): cint {.importc: "sgetrf_".}
  
  proc clapack_sgetri*(n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sgetri_".}
  
  proc clapack_sgetrs*(trans: var cstring; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; ipiv: var cint; b: ptr real;                ldb: var integer; info: var integer): cint {.importc: "sgetrs_".}
  
  proc clapack_sggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; lscale: ptr real; rscale: ptr real;                m: var integer; v: ptr real; ldv: var integer; info: var integer): cint {.importc: "sggbak_".}
  
  proc clapack_sggbal*(job: var cstring; n: var integer; a: ptr real; lda: var integer;                b: ptr real; ldb: var integer; ilo: var integer;                ihi: var integer; lscale: ptr real; rscale: ptr real;                work: ptr real; info: var integer): cint {.importc: "sggbal_".}
  
  proc clapack_sgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;               n: var integer; a: ptr real; lda: var integer; b: ptr real;               ldb: var integer; sdim: var integer; alphar: ptr real;               alphai: ptr real; beta: ptr real; vsl: ptr real;               ldvsl: var integer; vsr: ptr real; ldvsr: var integer;               work: ptr real; lwork: var integer; bwork: ptr logical;               info: var integer): cint {.importc: "sgges_".}
  
  proc clapack_sggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;                sense: var cstring; n: var integer; a: ptr real; lda: var integer;                b: ptr real; ldb: var integer; sdim: var integer;                alphar: ptr real; alphai: ptr real; beta: ptr real;                vsl: ptr real; ldvsl: var integer; vsr: ptr real;                ldvsr: var integer; rconde: ptr real; rcondv: ptr real;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "sggesx_".}
  
  proc clapack_sggev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr real;               lda: var integer; b: ptr real; ldb: var integer;               alphar: ptr real; alphai: ptr real; beta: ptr real; vl: ptr real;               ldvl: var integer; vr: ptr real; ldvr: var integer;               work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sggev_".}
  
  proc clapack_sggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; alphar: ptr real; alphai: ptr real;                beta: ptr real; vl: ptr real; ldvl: var integer; vr: ptr real;                ldvr: var integer; ilo: var integer; ihi: var integer;                lscale: ptr real; rscale: ptr real; abnrm: ptr real;                bbnrm: ptr real; rconde: ptr real; rcondv: ptr real;                work: ptr real; lwork: var integer; iwork: var integer;                bwork: ptr logical; info: var integer): cint {.importc: "sggevx_".}
  
  proc clapack_sggglm*(n: var integer; m: var integer; p: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer; d: ptr real;                x: ptr real; y: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sggglm_".}
  
  proc clapack_sgghrd*(compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer; q: ptr real;                ldq: var integer; z: ptr real; ldz: var integer;                info: var integer): cint {.importc: "sgghrd_".}
  
  proc clapack_sgglse*(m: var integer; n: var integer; p: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer; c: ptr real;                d: ptr real; x: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sgglse_".}
  
  proc clapack_sggqrf*(n: var integer; m: var integer; p: var integer; a: ptr real;                lda: var integer; taua: ptr real; b: ptr real; ldb: var integer;                taub: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sggqrf_".}
  
  proc clapack_sggrqf*(m: var integer; p: var integer; n: var integer; a: ptr real;                lda: var integer; taua: ptr real; b: ptr real; ldb: var integer;                taub: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sggrqf_".}
  
  proc clapack_sggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                n: var integer; p: var integer; k: var integer; l: var integer;                a: ptr real; lda: var integer; b: ptr real; ldb: var integer;                alpha: ptr real; beta: ptr real; u: ptr real; ldu: var integer;                v: ptr real; ldv: var integer; q: ptr real; ldq: var integer;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "sggsvd_".}
  
  proc clapack_sggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; a: ptr real; lda: var integer;                b: ptr real; ldb: var integer; tola: ptr real; tolb: ptr real;                k: var integer; l: var integer; u: ptr real; ldu: var integer;                v: ptr real; ldv: var integer; q: ptr real; ldq: var integer;                iwork: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sggsvp_".}
  
  proc clapack_sgsvj0*(jobv: var cstring; m: var integer; n: var integer; a: ptr real;                lda: var integer; d: ptr real; sva: ptr real; mv: var integer;                v: ptr real; ldv: var integer; eps: ptr real; sfmin: ptr real;                tol: ptr real; nsweep: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sgsvj0_".}
  
  proc clapack_sgsvj1*(jobv: var cstring; m: var integer; n: var integer; n1: var integer;                a: ptr real; lda: var integer; d: ptr real; sva: ptr real;                mv: var integer; v: ptr real; ldv: var integer; eps: ptr real;                sfmin: ptr real; tol: ptr real; nsweep: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgsvj1_".}
  
  proc clapack_sgtcon*(norm: var cstring; n: var integer; dl: ptr real; d: ptr real;                du: ptr real; du2: ptr real; ipiv: var cint; anorm: ptr real;                rcond: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sgtcon_".}
  
  proc clapack_sgtrfs*(trans: var cstring; n: var integer; nrhs: var integer; dl: ptr real;                d: ptr real; du: ptr real; dlf: ptr real; df: ptr real;                duf: ptr real; du2: ptr real; ipiv: var cint; b: ptr real;                ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sgtrfs_".}
  
  proc clapack_sgtsv*(n: var integer; nrhs: var integer; dl: ptr real; d: ptr real;               du: ptr real; b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sgtsv_".}
  
  proc clapack_sgtsvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; dl: ptr real; d: ptr real; du: ptr real;                dlf: ptr real; df: ptr real; duf: ptr real; du2: ptr real;                ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sgtsvx_".}
  
  proc clapack_sgttrf*(n: var integer; dl: ptr real; d: ptr real; du: ptr real;                du2: ptr real; ipiv: var cint; info: var integer): cint {.importc: "sgttrf_".}
  
  proc clapack_sgttrs*(trans: var cstring; n: var integer; nrhs: var integer; dl: ptr real;                d: ptr real; du: ptr real; du2: ptr real; ipiv: var cint;                b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sgttrs_".}
  
  proc clapack_sgtts2*(itrans: var integer; n: var integer; nrhs: var integer;                dl: ptr real; d: ptr real; du: ptr real; du2: ptr real;                ipiv: var cint; b: ptr real; ldb: var integer): cint {.importc: "sgtts2_".}
  
  proc clapack_shgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; h: ptr real;                ldh: var integer; t: ptr real; ldt: var integer;                alphar: ptr real; alphai: ptr real; beta: ptr real; q: ptr real;                ldq: var integer; z: ptr real; ldz: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "shgeqz_".}
  
  proc clapack_shsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;                select: ptr logical; n: var integer; h: ptr real;                ldh: var integer; wr: ptr real; wi: ptr real; vl: ptr real;                ldvl: var integer; vr: ptr real; ldvr: var integer;                mm: var integer; m: var integer; work: ptr real;                ifaill: var integer; ifailr: var integer; info: var integer): cint {.importc: "shsein_".}
  
  proc clapack_shseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;                ihi: var integer; h: ptr real; ldh: var integer; wr: ptr real;                wi: ptr real; z: ptr real; ldz: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "shseqr_".}
  proc clapack_sisnan*(sin: ptr real): logical {.importc: "sisnan_".}
  
  proc clapack_sla_gbamv*(trans: var integer; m: var integer; n: var integer;                    kl: var integer; ku: var integer; alpha: ptr real;                    ab: ptr real; ldab: var integer; x: ptr real;                    incx: var integer; beta: ptr real; y: ptr real;                    incy: var integer): cint {.importc: "sla_gbamv__".}
  proc clapack_sla_gbrcond*(trans: var cstring; n: var integer; kl: var integer;                      ku: var integer; ab: ptr real; ldab: var integer;                      afb: ptr real; ldafb: var integer; ipiv: var cint;                      cmode: var integer; c: ptr real; info: var integer;                      work: ptr real; iwork: var integer; trans_len: ftnlen): doublereal {.importc: "sla_gbrcond__".}
  
  proc clapack_sla_gbrfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              kl: var integer; ku: var integer;                              nrhs: var integer; ab: ptr real;                              ldab: var integer; afb: ptr real;                              ldafb: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr real; b: ptr real;                              ldb: var integer; y: ptr real; ldy: var integer;                              berr_out: ptr real; n_norms: var integer;                              errs_n: ptr real; errs_c: ptr real;                              res: ptr real; ayb: ptr real; dy: ptr real;                              y_tail: ptr real; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer): cint {.importc: "sla_gbrfsx_extended__".}
  proc clapack_sla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;                       ncols: var integer; ab: ptr real; ldab: var integer;                       afb: ptr real; ldafb: var integer): doublereal {.importc: "sla_gbrpvgrw__".}
  
  proc clapack_sla_geamv*(trans: var integer; m: var integer; n: var integer;                    alpha: ptr real; a: ptr real; lda: var integer; x: ptr real;                    incx: var integer; beta: ptr real; y: ptr real;                    incy: var integer): cint {.importc: "sla_geamv__".}
  proc clapack_sla_gercond*(trans: var cstring; n: var integer; a: ptr real;                      lda: var integer; af: ptr real; ldaf: var integer;                      ipiv: var cint; cmode: var integer; c: ptr real;                      info: var integer; work: ptr real; iwork: var integer;                      trans_len: ftnlen): doublereal {.importc: "sla_gercond__".}
  
  proc clapack_sla_gerfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              nrhs: var integer; a: ptr real; lda: var integer;                              af: ptr real; ldaf: var integer;                              ipiv: var cint; colequ: ptr logical;                              c: ptr real; b: ptr real; ldb: var integer;                              y: ptr real; ldy: var integer;                              berr_out: ptr real; n_norms: var integer;                              errs_n: ptr real; errs_c: ptr real;                              res: ptr real; ayb: ptr real; dy: ptr real;                              y_tail: ptr real; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer): cint {.importc: "sla_gerfsx_extended__".}
  
  proc clapack_sla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;                       res: ptr real; ayb: ptr real; berr: ptr real): cint {.importc: "sla_lin_berr__".}
  proc clapack_sla_porcond*(uplo: var cstring; n: var integer; a: ptr real;                      lda: var integer; af: ptr real; ldaf: var integer;                      cmode: var integer; c: ptr real; info: var integer;                      work: ptr real; iwork: var integer; uplo_len: ftnlen): doublereal {.importc: "sla_porcond__".}
  
  proc clapack_sla_porfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer; a: ptr real;                              lda: var integer; af: ptr real; ldaf: var integer;                              colequ: ptr logical; c: ptr real; b: ptr real;                              ldb: var integer; y: ptr real; ldy: var integer;                              berr_out: ptr real; n_norms: var integer;                              errs_n: ptr real; errs_c: ptr real;                              res: ptr real; ayb: ptr real; dy: ptr real;                              y_tail: ptr real; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer; uplo_len: ftnlen): cint {.importc: "sla_porfsx_extended__".}
  proc clapack_sla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr real;                       lda: var integer; af: ptr real; ldaf: var integer;                       work: ptr real; uplo_len: ftnlen): doublereal {.importc: "sla_porpvgrw__".}
  proc clapack_sla_rpvgrw*(n: var integer; ncols: var integer; a: ptr real;                     lda: var integer; af: ptr real; ldaf: var integer): doublereal {.importc: "sla_rpvgrw__".}
  
  proc clapack_sla_syamv*(uplo: var integer; n: var integer; alpha: ptr real;                    a: ptr real; lda: var integer; x: ptr real;                    incx: var integer; beta: ptr real; y: ptr real;                    incy: var integer): cint {.importc: "sla_syamv__".}
  proc clapack_sla_syrcond*(uplo: var cstring; n: var integer; a: ptr real;                      lda: var integer; af: ptr real; ldaf: var integer;                      ipiv: var cint; cmode: var integer; c: ptr real;                      info: var integer; work: ptr real; iwork: var integer;                      uplo_len: ftnlen): doublereal {.importc: "sla_syrcond__".}
  
  proc clapack_sla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer; a: ptr real;                              lda: var integer; af: ptr real; ldaf: var integer;                              ipiv: var cint; colequ: ptr logical;                              c: ptr real; b: ptr real; ldb: var integer;                              y: ptr real; ldy: var integer;                              berr_out: ptr real; n_norms: var integer;                              errs_n: ptr real; errs_c: ptr real;                              res: ptr real; ayb: ptr real; dy: ptr real;                              y_tail: ptr real; rcond: ptr real;                              ithresh: var integer; rthresh: ptr real;                              dz_ub: ptr real; ignore_cwise: ptr logical;                              info: var integer; uplo_len: ftnlen): cint {.importc: "sla_syrfsx_extended__".}
  proc clapack_sla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;                       a: ptr real; lda: var integer; af: ptr real;                       ldaf: var integer; ipiv: var cint; work: ptr real;                       uplo_len: ftnlen): doublereal {.importc: "sla_syrpvgrw__".}
  
  proc clapack_sla_wwaddw*(n: var integer; x: ptr real; y: ptr real; w: ptr real): cint {.importc: "sla_wwaddw__".}
  
  proc clapack_slabad*(small: ptr real; large: ptr real): cint {.importc: "slabad_".}
  
  proc clapack_slabrd*(m: var integer; n: var integer; nb: var integer; a: ptr real;                lda: var integer; d: ptr real; e: ptr real; tauq: ptr real;                taup: ptr real; x: ptr real; ldx: var integer; y: ptr real;                ldy: var integer): cint {.importc: "slabrd_".}
  
  proc clapack_slacn2*(n: var integer; v: ptr real; x: ptr real; isgn: var integer;                est: ptr real; kase: var integer; isave: var integer): cint {.importc: "slacn2_".}
  
  proc clapack_slacon*(n: var integer; v: ptr real; x: ptr real; isgn: var integer;                est: ptr real; kase: var integer): cint {.importc: "slacon_".}
  
  proc clapack_slacpy*(uplo: var cstring; m: var integer; n: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer): cint {.importc: "slacpy_".}
  
  proc clapack_sladiv*(a: ptr real; b: ptr real; c: ptr real; d: ptr real;                p: ptr real; q: ptr real): cint {.importc: "sladiv_".}
  
  proc clapack_slae2*(a: ptr real; b: ptr real; c: ptr real; rt1: ptr real;               rt2: ptr real): cint {.importc: "slae2_".}
  
  proc clapack_slaebz*(ijob: var integer; nitmax: var integer; n: var integer;                mmax: var integer; minp: var integer; nbmin: var integer;                abstol: ptr real; reltol: ptr real; pivmin: ptr real;                d: ptr real; e: ptr real; e2: ptr real; nval: var integer;                ab: ptr real; c: ptr real; mout: var integer;                nab: var integer; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "slaebz_".}
  
  proc clapack_slaed0*(icompq: var integer; qsiz: var integer; n: var integer;                d: ptr real; e: ptr real; q: ptr real; ldq: var integer;                qstore: ptr real; ldqs: var integer; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "slaed0_".}
  
  proc clapack_slaed1*(n: var integer; d: ptr real; q: ptr real; ldq: var integer;                indxq: var integer; rho: ptr real; cutpnt: var integer;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slaed1_".}
  
  proc clapack_slaed2*(k: var integer; n: var integer; n1: var integer; d: ptr real;                q: ptr real; ldq: var integer; indxq: var integer;                rho: ptr real; z: ptr real; dlamda: ptr real; w: ptr real;                q2: ptr real; indx: var integer; indxc: var integer;                indxp: var integer; coltyp: var integer; info: var integer): cint {.importc: "slaed2_".}
  
  proc clapack_slaed3*(k: var integer; n: var integer; n1: var integer; d: ptr real;                q: ptr real; ldq: var integer; rho: ptr real; dlamda: ptr real;                q2: ptr real; indx: var integer; ctot: var integer; w: ptr real;                s: ptr real; info: var integer): cint {.importc: "slaed3_".}
  
  proc clapack_slaed4*(n: var integer; i: var integer; d: ptr real; z: ptr real;                delta: ptr real; rho: ptr real; dlam: ptr real;                info: var integer): cint {.importc: "slaed4_".}
  
  proc clapack_slaed5*(i: var integer; d: ptr real; z: ptr real; delta: ptr real;                rho: ptr real; dlam: ptr real): cint {.importc: "slaed5_".}
  
  proc clapack_slaed6*(kniter: var integer; orgati: ptr logical; rho: ptr real;                d: ptr real; z: ptr real; finit: ptr real; tau: ptr real;                info: var integer): cint {.importc: "slaed6_".}
  
  proc clapack_slaed7*(icompq: var integer; n: var integer; qsiz: var integer;                tlvls: var integer; curlvl: var integer; curpbm: var integer;                d: ptr real; q: ptr real; ldq: var integer;                indxq: var integer; rho: ptr real; cutpnt: var integer;                qstore: ptr real; qptr: var integer; prmptr: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                givnum: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "slaed7_".}
  
  proc clapack_slaed8*(icompq: var integer; k: var integer; n: var integer;                qsiz: var integer; d: ptr real; q: ptr real; ldq: var integer;                indxq: var integer; rho: ptr real; cutpnt: var integer;                z: ptr real; dlamda: ptr real; q2: ptr real;                ldq2: var integer; w: ptr real; perm: var integer;                givptr: var integer; givcol: var integer; givnum: ptr real;                indxp: var integer; indx: var integer; info: var integer): cint {.importc: "slaed8_".}
  
  proc clapack_slaed9*(k: var integer; kstart: var integer; kstop: var integer;                n: var integer; d: ptr real; q: ptr real; ldq: var integer;                rho: ptr real; dlamda: ptr real; w: ptr real; s: ptr real;                lds: var integer; info: var integer): cint {.importc: "slaed9_".}
  
  proc clapack_slaeda*(n: var integer; tlvls: var integer; curlvl: var integer;                curpbm: var integer; prmptr: var integer; perm: var integer;                givptr: var integer; givcol: var integer; givnum: ptr real;                q: ptr real; qptr: var integer; z: ptr real; ztemp: ptr real;                info: var integer): cint {.importc: "slaeda_".}
  
  proc clapack_slaein*(rightv: ptr logical; noinit: ptr logical; n: var integer;                h: ptr real; ldh: var integer; wr: ptr real; wi: ptr real;                vr: ptr real; vi: ptr real; b: ptr real; ldb: var integer;                work: ptr real; eps3: ptr real; smlnum: ptr real;                bignum: ptr real; info: var integer): cint {.importc: "slaein_".}
  
  proc clapack_slaev2*(a: ptr real; b: ptr real; c: ptr real; rt1: ptr real;                rt2: ptr real; cs1: ptr real; sn1: ptr real): cint {.importc: "slaev2_".}
  
  proc clapack_slaexc*(wantq: ptr logical; n: var integer; t: ptr real;                ldt: var integer; q: ptr real; ldq: var integer;                j1: var integer; n1: var integer; n2: var integer;                work: ptr real; info: var integer): cint {.importc: "slaexc_".}
  
  proc clapack_slag2*(a: ptr real; lda: var integer; b: ptr real; ldb: var integer;               safmin: ptr real; scale1: ptr real; scale2: ptr real;               wr1: ptr real; wr2: ptr real; wi: ptr real): cint {.importc: "slag2_".}
  
  proc clapack_slag2d*(m: var integer; n: var integer; sa: ptr real; ldsa: var integer;                a: ptr doublereal; lda: var integer; info: var integer): cint {.importc: "slag2d_".}
  
  proc clapack_slags2*(upper: ptr logical; a1: ptr real; a2: ptr real; a3: ptr real;                b1: ptr real; b2: ptr real; b3: ptr real; csu: ptr real;                snu: ptr real; csv: ptr real; snv: ptr real; csq: ptr real;                snq: ptr real): cint {.importc: "slags2_".}
  
  proc clapack_slagtf*(n: var integer; a: ptr real; lambdas: ptr real; b: ptr real;                c: ptr real; tol: ptr real; d: ptr real; pm: var integer;                info: var integer): cint {.importc: "slagtf_".}
  
  proc clapack_slagtm*(trans: var cstring; n: var integer; nrhs: var integer;                alpha: ptr real; dl: ptr real; d: ptr real; du: ptr real;                x: ptr real; ldx: var integer; beta: ptr real; b: ptr real;                ldb: var integer): cint {.importc: "slagtm_".}
  
  proc clapack_slagts*(job: var integer; n: var integer; a: ptr real; b: ptr real;                c: ptr real; d: ptr real; pm: var integer; y: ptr real;                tol: ptr real; info: var integer): cint {.importc: "slagts_".}
  
  proc clapack_slagv2*(a: ptr real; lda: var integer; b: ptr real; ldb: var integer;                alphar: ptr real; alphai: ptr real; beta: ptr real;                csl: ptr real; snl: ptr real; csr: ptr real; snr: ptr real): cint {.importc: "slagv2_".}
  
  proc clapack_slahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr real;                ldh: var integer; wr: ptr real; wi: ptr real; iloz: var integer;                ihiz: var integer; z: ptr real; ldz: var integer;                info: var integer): cint {.importc: "slahqr_".}
  
  proc clapack_slahr2*(n: var integer; k: var integer; nb: var integer; a: ptr real;                lda: var integer; tau: ptr real; t: ptr real; ldt: var integer;                y: ptr real; ldy: var integer): cint {.importc: "slahr2_".}
  
  proc clapack_slahrd*(n: var integer; k: var integer; nb: var integer; a: ptr real;                lda: var integer; tau: ptr real; t: ptr real; ldt: var integer;                y: ptr real; ldy: var integer): cint {.importc: "slahrd_".}
  
  proc clapack_slaic1*(job: var integer; j: var integer; x: ptr real; sest: ptr real;                w: ptr real; gamma: ptr real; sestpr: ptr real; s: ptr real;                c: ptr real): cint {.importc: "slaic1_".}
  proc clapack_slaisnan*(sin1: ptr real; sin2: ptr real): logical {.importc: "slaisnan_".}
  
  proc clapack_slaln2*(ltrans: ptr logical; na: var integer; nw: var integer;                smin: ptr real; ca: ptr real; a: ptr real; lda: var integer;                d1: ptr real; d2: ptr real; b: ptr real; ldb: var integer;                wr: ptr real; wi: ptr real; x: ptr real; ldx: var integer;                scale: ptr real; xnorm: ptr real; info: var integer): cint {.importc: "slaln2_".}
  
  proc clapack_slals0*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; nrhs: var integer; b: ptr real;                ldb: var integer; bx: ptr real; ldbx: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                ldgcol: var integer; givnum: ptr real; ldgnum: var integer;                poles: ptr real; difl: ptr real; difr: ptr real; z: ptr real;                k: var integer; c: ptr real; s: ptr real; work: ptr real;                info: var integer): cint {.importc: "slals0_".}
  
  proc clapack_slalsa*(icompq: var integer; smlsiz: var integer; n: var integer;                nrhs: var integer; b: ptr real; ldb: var integer; bx: ptr real;                ldbx: var integer; u: ptr real; ldu: var integer; vt: ptr real;                k: var integer; difl: ptr real; difr: ptr real; z: ptr real;                poles: ptr real; givptr: var integer; givcol: var integer;                ldgcol: var integer; perm: var integer; givnum: ptr real;                c: ptr real; s: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "slalsa_".}
  
  proc clapack_slalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;                nrhs: var integer; d: ptr real; e: ptr real; b: ptr real;                ldb: var integer; rcond: ptr real; rank: var integer;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slalsd_".}
  
  proc clapack_slamrg*(n1: var integer; n2: var integer; a: ptr real;                strd1: var integer; strd2: var integer; index: var integer): cint {.importc: "slamrg_".}
  proc clapack_slaneg*(n: var integer; d: ptr real; lld: ptr real; sigma: ptr real;                pivmin: ptr real; r: var integer): integer {.importc: "slaneg_".}
  proc clapack_slangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr real; ldab: var integer; work: ptr real): doublereal {.importc: "slangb_".}
  proc clapack_slange*(norm: var cstring; m: var integer; n: var integer; a: ptr real;                lda: var integer; work: ptr real): doublereal {.importc: "slange_".}
  proc clapack_slangt*(norm: var cstring; n: var integer; dl: ptr real; d: ptr real;                du: ptr real): doublereal {.importc: "slangt_".}
  proc clapack_slanhs*(norm: var cstring; n: var integer; a: ptr real; lda: var integer;                work: ptr real): doublereal {.importc: "slanhs_".}
  proc clapack_slansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;                ab: ptr real; ldab: var integer; work: ptr real): doublereal {.importc: "slansb_".}
  proc clapack_slansf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;                a: ptr real; work: ptr real): doublereal {.importc: "slansf_".}
  proc clapack_slansp*(norm: var cstring; uplo: var cstring; n: var integer; ap: ptr real;                work: ptr real): doublereal {.importc: "slansp_".}
  proc clapack_slanst*(norm: var cstring; n: var integer; d: ptr real; e: ptr real): doublereal {.importc: "slanst_".}
  proc clapack_slansy*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr real;                lda: var integer; work: ptr real): doublereal {.importc: "slansy_".}
  proc clapack_slantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                k: var integer; ab: ptr real; ldab: var integer; work: ptr real): doublereal {.importc: "slantb_".}
  proc clapack_slantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr real; work: ptr real): doublereal {.importc: "slantp_".}
  proc clapack_slantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;                n: var integer; a: ptr real; lda: var integer; work: ptr real): doublereal {.importc: "slantr_".}
  
  proc clapack_slanv2*(a: ptr real; b: ptr real; c: ptr real; d: ptr real;                rt1r: ptr real; rt1i: ptr real; rt2r: ptr real; rt2i: ptr real;                cs: ptr real; sn: ptr real): cint {.importc: "slanv2_".}
  
  proc clapack_slapll*(n: var integer; x: ptr real; incx: var integer; y: ptr real;                incy: var integer; ssmin: ptr real): cint {.importc: "slapll_".}
  
  proc clapack_slapmt*(forwrd: ptr logical; m: var integer; n: var integer;                x: ptr real; ldx: var integer; k: var integer): cint {.importc: "slapmt_".}
  proc clapack_slapy2*(x: ptr real; y: ptr real): doublereal {.importc: "slapy2_".}
  proc clapack_slapy3*(x: ptr real; y: ptr real; z: ptr real): doublereal {.importc: "slapy3_".}
  
  proc clapack_slaqgb*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr real; ldab: var integer; r: ptr real;                c: ptr real; rowcnd: ptr real; colcnd: ptr real;                amax: ptr real; equed: var cstring): cint {.importc: "slaqgb_".}
  
  proc clapack_slaqge*(m: var integer; n: var integer; a: ptr real; lda: var integer;                r: ptr real; c: ptr real; rowcnd: ptr real;                colcnd: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "slaqge_".}
  
  proc clapack_slaqp2*(m: var integer; n: var integer; offset: var integer;                a: ptr real; lda: var integer; jpvt: var integer; tau: ptr real;                vn1: ptr real; vn2: ptr real; work: ptr real): cint {.importc: "slaqp2_".}
  
  proc clapack_slaqps*(m: var integer; n: var integer; offset: var integer;                nb: var integer; kb: var integer; a: ptr real; lda: var integer;                jpvt: var integer; tau: ptr real; vn1: ptr real; vn2: ptr real;                auxv: ptr real; f: ptr real; ldf: var integer): cint {.importc: "slaqps_".}
  
  proc clapack_slaqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr real;                ldh: var integer; wr: ptr real; wi: ptr real; iloz: var integer;                ihiz: var integer; z: ptr real; ldz: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "slaqr0_".}
  
  proc clapack_slaqr1*(n: var integer; h: ptr real; ldh: var integer; sr1: ptr real;                si1: ptr real; sr2: ptr real; si2: ptr real; v: ptr real): cint {.importc: "slaqr1_".}
  
  proc clapack_slaqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr real; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr real; ldz: var integer;                ns: var integer; nd: var integer; sr: ptr real; si: ptr real;                v: ptr real; ldv: var integer; nh: var integer; t: ptr real;                ldt: var integer; nv: var integer; wv: ptr real;                ldwv: var integer; work: ptr real; lwork: var integer): cint {.importc: "slaqr2_".}
  
  proc clapack_slaqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr real; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr real; ldz: var integer;                ns: var integer; nd: var integer; sr: ptr real; si: ptr real;                v: ptr real; ldv: var integer; nh: var integer; t: ptr real;                ldt: var integer; nv: var integer; wv: ptr real;                ldwv: var integer; work: ptr real; lwork: var integer): cint {.importc: "slaqr3_".}
  
  proc clapack_slaqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr real;                ldh: var integer; wr: ptr real; wi: ptr real; iloz: var integer;                ihiz: var integer; z: ptr real; ldz: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "slaqr4_".}
  
  proc clapack_slaqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;                n: var integer; ktop: var integer; kbot: var integer;                nshfts: var integer; sr: ptr real; si: ptr real; h: ptr real;                ldh: var integer; iloz: var integer; ihiz: var integer;                z: ptr real; ldz: var integer; v: ptr real; ldv: var integer;                u: ptr real; ldu: var integer; nv: var integer; wv: ptr real;                ldwv: var integer; nh: var integer; wh: ptr real;                ldwh: var integer): cint {.importc: "slaqr5_".}
  
  proc clapack_slaqsb*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;                equed: var cstring): cint {.importc: "slaqsb_".}
  
  proc clapack_slaqsp*(uplo: var cstring; n: var integer; ap: ptr real; s: ptr real;                scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "slaqsp_".}
  
  proc clapack_slaqsy*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                s: ptr real; scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "slaqsy_".}
  
  proc clapack_slaqtr*(ltran: ptr logical; lreal: ptr logical; n: var integer;                t: ptr real; ldt: var integer; b: ptr real; w: ptr real;                scale: ptr real; x: ptr real; work: ptr real; info: var integer): cint {.importc: "slaqtr_".}
  
  proc clapack_slar1v*(n: var integer; b1: var integer; bn: var integer;                lambdas: ptr real; d: ptr real; l: ptr real; ld: ptr real;                lld: ptr real; pivmin: ptr real; gaptol: ptr real;                z: ptr real; wantnc: ptr logical; negcnt: var integer;                ztz: ptr real; mingma: ptr real; r: var integer;                isuppz: var integer; nrminv: ptr real; resid: ptr real;                rqcorr: ptr real; work: ptr real): cint {.importc: "slar1v_".}
  
  proc clapack_slar2v*(n: var integer; x: ptr real; y: ptr real; z: ptr real;                incx: var integer; c: ptr real; s: ptr real; incc: var integer): cint {.importc: "slar2v_".}
  
  proc clapack_slarf*(side: var cstring; m: var integer; n: var integer; v: ptr real;               incv: var integer; tau: ptr real; c: ptr real;               ldc: var integer; work: ptr real): cint {.importc: "slarf_".}
  
  proc clapack_slarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer; v: ptr real;                ldv: var integer; t: ptr real; ldt: var integer; c: ptr real;                ldc: var integer; work: ptr real; ldwork: var integer): cint {.importc: "slarfb_".}
  
  proc clapack_slarfg*(n: var integer; alpha: ptr real; x: ptr real; incx: var integer;                tau: ptr real): cint {.importc: "slarfg_".}
  
  proc clapack_slarfp*(n: var integer; alpha: ptr real; x: ptr real; incx: var integer;                tau: ptr real): cint {.importc: "slarfp_".}
  
  proc clapack_slarft*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr real; ldv: var integer; tau: ptr real;                t: ptr real; ldt: var integer): cint {.importc: "slarft_".}
  
  proc clapack_slarfx*(side: var cstring; m: var integer; n: var integer; v: ptr real;                tau: ptr real; c: ptr real; ldc: var integer; work: ptr real): cint {.importc: "slarfx_".}
  
  proc clapack_slargv*(n: var integer; x: ptr real; incx: var integer; y: ptr real;                incy: var integer; c: ptr real; incc: var integer): cint {.importc: "slargv_".}
  
  proc clapack_slarnv*(idist: var integer; iseed: var integer; n: var integer;                x: ptr real): cint {.importc: "slarnv_".}
  
  proc clapack_slarra*(n: var integer; d: ptr real; e: ptr real; e2: ptr real;                spltol: ptr real; tnrm: ptr real; nsplit: var integer;                isplit: var integer; info: var integer): cint {.importc: "slarra_".}
  
  proc clapack_slarrb*(n: var integer; d: ptr real; lld: ptr real;                ifirst: var integer; ilast: var integer; rtol1: ptr real;                rtol2: ptr real; offset: var integer; w: ptr real;                wgap: ptr real; werr: ptr real; work: ptr real;                iwork: var integer; pivmin: ptr real; spdiam: ptr real;                twist: var integer; info: var integer): cint {.importc: "slarrb_".}
  
  proc clapack_slarrc*(jobt: var cstring; n: var integer; vl: ptr real; vu: ptr real;                d: ptr real; e: ptr real; pivmin: ptr real;                eigcnt: var integer; lcnt: var integer; rcnt: var integer;                info: var integer): cint {.importc: "slarrc_".}
  
  proc clapack_slarrd*(range: var cstring; order: var cstring; n: var integer; vl: ptr real;                vu: ptr real; il: var integer; iu: var integer; gers: ptr real;                reltol: ptr real; d: ptr real; e: ptr real; e2: ptr real;                pivmin: ptr real; nsplit: var integer; isplit: var integer;                m: var integer; w: ptr real; werr: ptr real; wl: ptr real;                wu: ptr real; iblock: var integer; indexw: var integer;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slarrd_".}
  
  proc clapack_slarre*(range: var cstring; n: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; d: ptr real; e: ptr real;                e2: ptr real; rtol1: ptr real; rtol2: ptr real;                spltol: ptr real; nsplit: var integer; isplit: var integer;                m: var integer; w: ptr real; werr: ptr real; wgap: ptr real;                iblock: var integer; indexw: var integer; gers: ptr real;                pivmin: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "slarre_".}
  
  proc clapack_slarrf*(n: var integer; d: ptr real; l: ptr real; ld: ptr real;                clstrt: var integer; clend: var integer; w: ptr real;                wgap: ptr real; werr: ptr real; spdiam: ptr real;                clgapl: ptr real; clgapr: ptr real; pivmin: ptr real;                sigma: ptr real; dplus: ptr real; lplus: ptr real;                work: ptr real; info: var integer): cint {.importc: "slarrf_".}
  
  proc clapack_slarrj*(n: var integer; d: ptr real; e2: ptr real;                ifirst: var integer; ilast: var integer; rtol: ptr real;                offset: var integer; w: ptr real; werr: ptr real;                work: ptr real; iwork: var integer; pivmin: ptr real;                spdiam: ptr real; info: var integer): cint {.importc: "slarrj_".}
  
  proc clapack_slarrk*(n: var integer; iw: var integer; gl: ptr real; gu: ptr real;                d: ptr real; e2: ptr real; pivmin: ptr real; reltol: ptr real;                w: ptr real; werr: ptr real; info: var integer): cint {.importc: "slarrk_".}
  
  proc clapack_slarrr*(n: var integer; d: ptr real; e: ptr real; info: var integer): cint {.importc: "slarrr_".}
  
  proc clapack_slarrv*(n: var integer; vl: ptr real; vu: ptr real; d: ptr real;                l: ptr real; pivmin: ptr real; isplit: var integer;                m: var integer; dol: var integer; dou: var integer;                minrgp: ptr real; rtol1: ptr real; rtol2: ptr real; w: ptr real;                werr: ptr real; wgap: ptr real; iblock: var integer;                indexw: var integer; gers: ptr real; z: ptr real;                ldz: var integer; isuppz: var integer; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "slarrv_".}
  
  proc clapack_slarscl2*(m: var integer; n: var integer; d: ptr real; x: ptr real;                  ldx: var integer): cint {.importc: "slarscl2_".}
  
  proc clapack_slartg*(f: ptr real; g: ptr real; cs: ptr real; sn: ptr real;                r: ptr real): cint {.importc: "slartg_".}
  
  proc clapack_slartv*(n: var integer; x: ptr real; incx: var integer; y: ptr real;                incy: var integer; c: ptr real; s: ptr real; incc: var integer): cint {.importc: "slartv_".}
  
  proc clapack_slaruv*(iseed: var integer; n: var integer; x: ptr real): cint {.importc: "slaruv_".}
  
  proc clapack_slarz*(side: var cstring; m: var integer; n: var integer; l: var integer;               v: ptr real; incv: var integer; tau: ptr real; c: ptr real;               ldc: var integer; work: ptr real): cint {.importc: "slarz_".}
  
  proc clapack_slarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer; l: var integer;                v: ptr real; ldv: var integer; t: ptr real; ldt: var integer;                c: ptr real; ldc: var integer; work: ptr real;                ldwork: var integer): cint {.importc: "slarzb_".}
  
  proc clapack_slarzt*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr real; ldv: var integer; tau: ptr real;                t: ptr real; ldt: var integer): cint {.importc: "slarzt_".}
  
  proc clapack_slas2*(f: ptr real; g: ptr real; h: ptr real; ssmin: ptr real;               ssmax: ptr real): cint {.importc: "slas2_".}
  
  proc clapack_slascl*(mtype: var cstring; kl: var integer; ku: var integer;                cfrom: ptr real; cto: ptr real; m: var integer; n: var integer;                a: ptr real; lda: var integer; info: var integer): cint {.importc: "slascl_".}
  
  proc clapack_slascl2*(m: var integer; n: var integer; d: ptr real; x: ptr real;                 ldx: var integer): cint {.importc: "slascl2_".}
  
  proc clapack_slasd0*(n: var integer; sqre: var integer; d: ptr real; e: ptr real;                u: ptr real; ldu: var integer; vt: ptr real; ldvt: var integer;                smlsiz: var integer; iwork: var integer; work: ptr real;                info: var integer): cint {.importc: "slasd0_".}
  
  proc clapack_slasd1*(nl: var integer; nr: var integer; sqre: var integer;                d: ptr real; alpha: ptr real; beta: ptr real; u: ptr real;                ldu: var integer; vt: ptr real; ldvt: var integer;                idxq: var integer; iwork: var integer; work: ptr real;                info: var integer): cint {.importc: "slasd1_".}
  
  proc clapack_slasd2*(nl: var integer; nr: var integer; sqre: var integer;                k: var integer; d: ptr real; z: ptr real; alpha: ptr real;                beta: ptr real; u: ptr real; ldu: var integer; vt: ptr real;                ldvt: var integer; dsigma: ptr real; u2: ptr real;                ldu2: var integer; vt2: ptr real; ldvt2: var integer;                idxp: var integer; idx: var integer; idxc: var integer;                idxq: var integer; coltyp: var integer; info: var integer): cint {.importc: "slasd2_".}
  
  proc clapack_slasd3*(nl: var integer; nr: var integer; sqre: var integer;                k: var integer; d: ptr real; q: ptr real; ldq: var integer;                dsigma: ptr real; u: ptr real; ldu: var integer; u2: ptr real;                ldu2: var integer; vt: ptr real; ldvt: var integer;                vt2: ptr real; ldvt2: var integer; idxc: var integer;                ctot: var integer; z: ptr real; info: var integer): cint {.importc: "slasd3_".}
  
  proc clapack_slasd4*(n: var integer; i: var integer; d: ptr real; z: ptr real;                delta: ptr real; rho: ptr real; sigma: ptr real; work: ptr real;                info: var integer): cint {.importc: "slasd4_".}
  
  proc clapack_slasd5*(i: var integer; d: ptr real; z: ptr real; delta: ptr real;                rho: ptr real; dsigma: ptr real; work: ptr real): cint {.importc: "slasd5_".}
  
  proc clapack_slasd6*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; d: ptr real; vf: ptr real; vl: ptr real;                alpha: ptr real; beta: ptr real; idxq: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                ldgcol: var integer; givnum: ptr real; ldgnum: var integer;                poles: ptr real; difl: ptr real; difr: ptr real; z: ptr real;                k: var integer; c: ptr real; s: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "slasd6_".}
  
  proc clapack_slasd7*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; k: var integer; d: ptr real; z: ptr real;                zw: ptr real; vf: ptr real; vfw: ptr real; vl: ptr real;                vlw: ptr real; alpha: ptr real; beta: ptr real;                dsigma: ptr real; idx: var integer; idxp: var integer;                idxq: var integer; perm: var integer; givptr: var integer;                givcol: var integer; ldgcol: var integer; givnum: ptr real;                ldgnum: var integer; c: ptr real; s: ptr real;                info: var integer): cint {.importc: "slasd7_".}
  
  proc clapack_slasd8*(icompq: var integer; k: var integer; d: ptr real;                z: ptr real; vf: ptr real; vl: ptr real; difl: ptr real;                difr: ptr real; lddifr: var integer; dsigma: ptr real;                work: ptr real; info: var integer): cint {.importc: "slasd8_".}
  
  proc clapack_slasda*(icompq: var integer; smlsiz: var integer; n: var integer;                sqre: var integer; d: ptr real; e: ptr real; u: ptr real;                ldu: var integer; vt: ptr real; k: var integer; difl: ptr real;                difr: ptr real; z: ptr real; poles: ptr real;                givptr: var integer; givcol: var integer; ldgcol: var integer;                perm: var integer; givnum: ptr real; c: ptr real; s: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slasda_".}
  
  proc clapack_slasdq*(uplo: var cstring; sqre: var integer; n: var integer;                ncvt: var integer; nru: var integer; ncc: var integer;                d: ptr real; e: ptr real; vt: ptr real; ldvt: var integer;                u: ptr real; ldu: var integer; c: ptr real; ldc: var integer;                work: ptr real; info: var integer): cint {.importc: "slasdq_".}
  
  proc clapack_slasdt*(n: var integer; lvl: var integer; nd: var integer;                inode: var integer; ndiml: var integer; ndimr: var integer;                msub: var integer): cint {.importc: "slasdt_".}
  
  proc clapack_slaset*(uplo: var cstring; m: var integer; n: var integer; alpha: ptr real;                beta: ptr real; a: ptr real; lda: var integer): cint {.importc: "slaset_".}
  
  proc clapack_slasq1*(n: var integer; d: ptr real; e: ptr real; work: ptr real;                info: var integer): cint {.importc: "slasq1_".}
  
  proc clapack_slasq2*(n: var integer; z: ptr real; info: var integer): cint {.importc: "slasq2_".}
  
  proc clapack_slasq3*(i0: var integer; n0: var integer; z: ptr real;                pp: var integer; dmin: ptr real; sigma: ptr real;                desig: ptr real; qmax: ptr real; nfail: var integer;                iter: var integer; ndiv: var integer; ieee: ptr logical;                ttype: var integer; dmin1: ptr real; dmin2: ptr real;                dn: ptr real; dn1: ptr real; dn2: ptr real; g: ptr real;                tau: ptr real): cint {.importc: "slasq3_".}
  
  proc clapack_slasq4*(i0: var integer; n0: var integer; z: ptr real;                pp: var integer; n0in: var integer; dmin: ptr real;                dmin1: ptr real; dmin2: ptr real; dn: ptr real; dn1: ptr real;                dn2: ptr real; tau: ptr real; ttype: var integer; g: ptr real): cint {.importc: "slasq4_".}
  
  proc clapack_slasq5*(i0: var integer; n0: var integer; z: ptr real;                pp: var integer; tau: ptr real; dmin: ptr real;                dmin1: ptr real; dmin2: ptr real; dn: ptr real; dnm1: ptr real;                dnm2: ptr real; ieee: ptr logical): cint {.importc: "slasq5_".}
  
  proc clapack_slasq6*(i0: var integer; n0: var integer; z: ptr real;                pp: var integer; dmin: ptr real; dmin1: ptr real;                dmin2: ptr real; dn: ptr real; dnm1: ptr real; dnm2: ptr real): cint {.importc: "slasq6_".}
  
  proc clapack_slasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;               n: var integer; c: ptr real; s: ptr real; a: ptr real;               lda: var integer): cint {.importc: "slasr_".}
  
  proc clapack_slasrt*(id: var cstring; n: var integer; d: ptr real; info: var integer): cint {.importc: "slasrt_".}
  
  proc clapack_slassq*(n: var integer; x: ptr real; incx: var integer; scale: ptr real;                sumsq: ptr real): cint {.importc: "slassq_".}
  
  proc clapack_slasv2*(f: ptr real; g: ptr real; h: ptr real; ssmin: ptr real;                ssmax: ptr real; snr: ptr real; csr: ptr real; snl: ptr real;                csl: ptr real): cint {.importc: "slasv2_".}
  
  proc clapack_slaswp*(n: var integer; a: ptr real; lda: var integer; k1: var integer;                k2: var integer; ipiv: var cint; incx: var integer): cint {.importc: "slaswp_".}
  
  proc clapack_slasy2*(ltranl: ptr logical; ltranr: ptr logical; isgn: var integer;                n1: var integer; n2: var integer; tl: ptr real;                ldtl: var integer; tr: ptr real; ldtr: var integer; b: ptr real;                ldb: var integer; scale: ptr real; x: ptr real;                ldx: var integer; xnorm: ptr real; info: var integer): cint {.importc: "slasy2_".}
  
  proc clapack_slasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;                a: ptr real; lda: var integer; ipiv: var cint; w: ptr real;                ldw: var integer; info: var integer): cint {.importc: "slasyf_".}
  
  proc clapack_slatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; x: ptr real; scale: ptr real;                cnorm: ptr real; info: var integer): cint {.importc: "slatbs_".}
  
  proc clapack_slatdf*(ijob: var integer; n: var integer; z: ptr real;                ldz: var integer; rhs: ptr real; rdsum: ptr real;                rdscal: ptr real; ipiv: var cint; jpiv: var cint): cint {.importc: "slatdf_".}
  
  proc clapack_slatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; ap: ptr real; x: ptr real; scale: ptr real;                cnorm: ptr real; info: var integer): cint {.importc: "slatps_".}
  
  proc clapack_slatrd*(uplo: var cstring; n: var integer; nb: var integer; a: ptr real;                lda: var integer; e: ptr real; tau: ptr real; w: ptr real;                ldw: var integer): cint {.importc: "slatrd_".}
  
  proc clapack_slatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; a: ptr real; lda: var integer; x: ptr real;                scale: ptr real; cnorm: ptr real; info: var integer): cint {.importc: "slatrs_".}
  
  proc clapack_slatrz*(m: var integer; n: var integer; l: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real): cint {.importc: "slatrz_".}
  
  proc clapack_slatzm*(side: var cstring; m: var integer; n: var integer; v: ptr real;                incv: var integer; tau: ptr real; c1: ptr real; c2: ptr real;                ldc: var integer; work: ptr real): cint {.importc: "slatzm_".}
  
  proc clapack_slauu2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                info: var integer): cint {.importc: "slauu2_".}
  
  proc clapack_slauum*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                info: var integer): cint {.importc: "slauum_".}
  
  proc clapack_sopgtr*(uplo: var cstring; n: var integer; ap: ptr real; tau: ptr real;                q: ptr real; ldq: var integer; work: ptr real; info: var integer): cint {.importc: "sopgtr_".}
  
  proc clapack_sopmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; ap: ptr real; tau: ptr real; c: ptr real;                ldc: var integer; work: ptr real; info: var integer): cint {.importc: "sopmtr_".}
  
  proc clapack_sorg2l*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sorg2l_".}
  
  proc clapack_sorg2r*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sorg2r_".}
  
  proc clapack_sorgbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;                a: ptr real; lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sorgbr_".}
  
  proc clapack_sorghr*(n: var integer; ilo: var integer; ihi: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sorghr_".}
  
  proc clapack_sorgl2*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sorgl2_".}
  
  proc clapack_sorglq*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sorglq_".}
  
  proc clapack_sorgql*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sorgql_".}
  
  proc clapack_sorgqr*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sorgqr_".}
  
  proc clapack_sorgr2*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                info: var integer): cint {.importc: "sorgr2_".}
  
  proc clapack_sorgrq*(m: var integer; n: var integer; k: var integer; a: ptr real;                lda: var integer; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sorgrq_".}
  
  proc clapack_sorgtr*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sorgtr_".}
  
  proc clapack_sorm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sorm2l_".}
  
  proc clapack_sorm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sorm2r_".}
  
  proc clapack_sormbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;                n: var integer; k: var integer; a: ptr real; lda: var integer;                tau: ptr real; c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormbr_".}
  
  proc clapack_sormhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                ilo: var integer; ihi: var integer; a: ptr real;                lda: var integer; tau: ptr real; c: ptr real;                ldc: var integer; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "sormhr_".}
  
  proc clapack_sorml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sorml2_".}
  
  proc clapack_sormlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormlq_".}
  
  proc clapack_sormql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormql_".}
  
  proc clapack_sormqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormqr_".}
  
  proc clapack_sormr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sormr2_".}
  
  proc clapack_sormr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr real; lda: var integer;                tau: ptr real; c: ptr real; ldc: var integer; work: ptr real;                info: var integer): cint {.importc: "sormr3_".}
  
  proc clapack_sormrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormrq_".}
  
  proc clapack_sormrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr real; lda: var integer;                tau: ptr real; c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormrz_".}
  
  proc clapack_sormtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; a: ptr real; lda: var integer; tau: ptr real;                c: ptr real; ldc: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "sormtr_".}
  
  proc clapack_spbcon*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; anorm: ptr real; rcond: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "spbcon_".}
  
  proc clapack_spbequ*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;                info: var integer): cint {.importc: "spbequ_".}
  
  proc clapack_spbrfs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr real; ldab: var integer;                afb: ptr real; ldafb: var integer; b: ptr real;                ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "spbrfs_".}
  
  proc clapack_spbstf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; info: var integer): cint {.importc: "spbstf_".}
  
  proc clapack_spbsv*(uplo: var cstring; n: var integer; kd: var integer;               nrhs: var integer; ab: ptr real; ldab: var integer; b: ptr real;               ldb: var integer; info: var integer): cint {.importc: "spbsv_".}
  
  proc clapack_spbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr real; ldab: var integer;                afb: ptr real; ldafb: var integer; equed: var cstring; s: ptr real;                b: ptr real; ldb: var integer; x: ptr real; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "spbsvx_".}
  
  proc clapack_spbtf2*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; info: var integer): cint {.importc: "spbtf2_".}
  
  proc clapack_spbtrf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;                ldab: var integer; info: var integer): cint {.importc: "spbtrf_".}
  
  proc clapack_spbtrs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr real; ldab: var integer; b: ptr real;                ldb: var integer; info: var integer): cint {.importc: "spbtrs_".}
  
  proc clapack_spftrf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr real;                info: var integer): cint {.importc: "spftrf_".}
  
  proc clapack_spftri*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr real;                info: var integer): cint {.importc: "spftri_".}
  
  proc clapack_spftrs*(transr: var cstring; uplo: var cstring; n: var integer;                nrhs: var integer; a: ptr real; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "spftrs_".}
  
  proc clapack_spocon*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                anorm: ptr real; rcond: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "spocon_".}
  
  proc clapack_spoequ*(n: var integer; a: ptr real; lda: var integer; s: ptr real;                scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "spoequ_".}
  
  proc clapack_spoequb*(n: var integer; a: ptr real; lda: var integer; s: ptr real;                 scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "spoequb_".}
  
  proc clapack_sporfs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; af: ptr real; ldaf: var integer; b: ptr real;                ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sporfs_".}
  
  proc clapack_sporfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                 ldaf: var integer; s: ptr real; b: ptr real; ldb: var integer;                 x: ptr real; ldx: var integer; rcond: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr real; iwork: var integer;                 info: var integer): cint {.importc: "sporfsx_".}
  
  proc clapack_sposv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;               lda: var integer; b: ptr real; ldb: var integer;               info: var integer): cint {.importc: "sposv_".}
  
  proc clapack_sposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr real; lda: var integer; af: ptr real; ldaf: var integer;                equed: var cstring; s: ptr real; b: ptr real; ldb: var integer;                x: ptr real; ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sposvx_".}
  
  proc clapack_sposvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                 ldaf: var integer; equed: var cstring; s: ptr real; b: ptr real;                 ldb: var integer; x: ptr real; ldx: var integer;                 rcond: ptr real; rpvgrw: ptr real; berr: ptr real;                 n_err_bnds: var integer; err_bnds_norm: ptr real;                 err_bnds_comp: ptr real; nparams: var integer;                 params: ptr real; work: ptr real; iwork: var integer;                 info: var integer): cint {.importc: "sposvxx_".}
  
  proc clapack_spotf2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                info: var integer): cint {.importc: "spotf2_".}
  
  proc clapack_spotrf*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                info: var integer): cint {.importc: "spotrf_".}
  
  proc clapack_spotri*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                info: var integer): cint {.importc: "spotri_".}
  
  proc clapack_spotrs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "spotrs_".}
  
  proc clapack_sppcon*(uplo: var cstring; n: var integer; ap: ptr real; anorm: ptr real;                rcond: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sppcon_".}
  
  proc clapack_sppequ*(uplo: var cstring; n: var integer; ap: ptr real; s: ptr real;                scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "sppequ_".}
  
  proc clapack_spprfs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;                afp: ptr real; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "spprfs_".}
  
  proc clapack_sppsv*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;               b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sppsv_".}
  
  proc clapack_sppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr real; afp: ptr real; equed: var cstring; s: ptr real;                b: ptr real; ldb: var integer; x: ptr real; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sppsvx_".}
  
  proc clapack_spptrf*(uplo: var cstring; n: var integer; ap: ptr real; info: var integer): cint {.importc: "spptrf_".}
  
  proc clapack_spptri*(uplo: var cstring; n: var integer; ap: ptr real; info: var integer): cint {.importc: "spptri_".}
  
  proc clapack_spptrs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;                b: ptr real; ldb: var integer; info: var integer): cint {.importc: "spptrs_".}
  
  proc clapack_spstf2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                piv: var integer; rank: var integer; tol: ptr real;                work: ptr real; info: var integer): cint {.importc: "spstf2_".}
  
  proc clapack_spstrf*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                piv: var integer; rank: var integer; tol: ptr real;                work: ptr real; info: var integer): cint {.importc: "spstrf_".}
  
  proc clapack_sptcon*(n: var integer; d: ptr real; e: ptr real; anorm: ptr real;                rcond: ptr real; work: ptr real; info: var integer): cint {.importc: "sptcon_".}
  
  proc clapack_spteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                info: var integer): cint {.importc: "spteqr_".}
  
  proc clapack_sptrfs*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;                df: ptr real; ef: ptr real; b: ptr real; ldb: var integer;                x: ptr real; ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; info: var integer): cint {.importc: "sptrfs_".}
  
  proc clapack_sptsv*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;               b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sptsv_".}
  
  proc clapack_sptsvx*(fact: var cstring; n: var integer; nrhs: var integer; d: ptr real;                e: ptr real; df: ptr real; ef: ptr real; b: ptr real;                ldb: var integer; x: ptr real; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;                info: var integer): cint {.importc: "sptsvx_".}
  
  proc clapack_spttrf*(n: var integer; d: ptr real; e: ptr real; info: var integer): cint {.importc: "spttrf_".}
  
  proc clapack_spttrs*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;                b: ptr real; ldb: var integer; info: var integer): cint {.importc: "spttrs_".}
  
  proc clapack_sptts2*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;                b: ptr real; ldb: var integer): cint {.importc: "sptts2_".}
  
  proc clapack_srscl*(n: var integer; sa: ptr real; sx: ptr real; incx: var integer): cint {.importc: "srscl_".}
  
  proc clapack_ssbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;               ab: ptr real; ldab: var integer; w: ptr real; z: ptr real;               ldz: var integer; work: ptr real; info: var integer): cint {.importc: "ssbev_".}
  
  proc clapack_ssbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr real; ldab: var integer; w: ptr real; z: ptr real;                ldz: var integer; work: ptr real; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "ssbevd_".}
  
  proc clapack_ssbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                kd: var integer; ab: ptr real; ldab: var integer; q: ptr real;                ldq: var integer; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "ssbevx_".}
  
  proc clapack_ssbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr real; ldab: var integer; bb: ptr real;                ldbb: var integer; x: ptr real; ldx: var integer;                work: ptr real; info: var integer): cint {.importc: "ssbgst_".}
  
  proc clapack_ssbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;               kb: var integer; ab: ptr real; ldab: var integer; bb: ptr real;               ldbb: var integer; w: ptr real; z: ptr real; ldz: var integer;               work: ptr real; info: var integer): cint {.importc: "ssbgv_".}
  
  proc clapack_ssbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr real; ldab: var integer; bb: ptr real;                ldbb: var integer; w: ptr real; z: ptr real; ldz: var integer;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "ssbgvd_".}
  
  proc clapack_ssbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ka: var integer; kb: var integer; ab: ptr real;                ldab: var integer; bb: ptr real; ldbb: var integer; q: ptr real;                ldq: var integer; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "ssbgvx_".}
  
  proc clapack_ssbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr real; ldab: var integer; d: ptr real; e: ptr real;                q: ptr real; ldq: var integer; work: ptr real; info: var integer): cint {.importc: "ssbtrd_".}
  
  proc clapack_ssfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;               k: var integer; alpha: ptr real; a: ptr real; lda: var integer;               beta: ptr real; c: ptr real): cint {.importc: "ssfrk_".}
  
  proc clapack_sspcon*(uplo: var cstring; n: var integer; ap: ptr real; ipiv: var cint;                anorm: ptr real; rcond: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sspcon_".}
  
  proc clapack_sspev*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr real;               w: ptr real; z: ptr real; ldz: var integer; work: ptr real;               info: var integer): cint {.importc: "sspev_".}
  
  proc clapack_sspevd*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr real;                w: ptr real; z: ptr real; ldz: var integer; work: ptr real;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "sspevd_".}
  
  proc clapack_sspevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ap: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "sspevx_".}
  
  proc clapack_sspgst*(itype: var integer; uplo: var cstring; n: var integer; ap: ptr real;                bp: ptr real; info: var integer): cint {.importc: "sspgst_".}
  
  proc clapack_sspgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               ap: ptr real; bp: ptr real; w: ptr real; z: ptr real;               ldz: var integer; work: ptr real; info: var integer): cint {.importc: "sspgv_".}
  
  proc clapack_sspgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; ap: ptr real; bp: ptr real; w: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "sspgvd_".}
  
  proc clapack_sspgvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; ap: ptr real; bp: ptr real;                vl: ptr real; vu: ptr real; il: var integer; iu: var integer;                abstol: ptr real; m: var integer; w: ptr real; z: ptr real;                ldz: var integer; work: ptr real; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "sspgvx_".}
  
  proc clapack_ssprfs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;                afp: ptr real; ipiv: var cint; b: ptr real; ldb: var integer;                x: ptr real; ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "ssprfs_".}
  
  proc clapack_sspsv*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;               ipiv: var cint; b: ptr real; ldb: var integer;               info: var integer): cint {.importc: "sspsv_".}
  
  proc clapack_sspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr real; afp: ptr real; ipiv: var cint; b: ptr real;                ldb: var integer; x: ptr real; ldx: var integer;                rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "sspsvx_".}
  
  proc clapack_ssptrd*(uplo: var cstring; n: var integer; ap: ptr real; d: ptr real;                e: ptr real; tau: ptr real; info: var integer): cint {.importc: "ssptrd_".}
  
  proc clapack_ssptrf*(uplo: var cstring; n: var integer; ap: ptr real; ipiv: var cint;                info: var integer): cint {.importc: "ssptrf_".}
  
  proc clapack_ssptri*(uplo: var cstring; n: var integer; ap: ptr real; ipiv: var cint;                work: ptr real; info: var integer): cint {.importc: "ssptri_".}
  
  proc clapack_ssptrs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;                ipiv: var cint; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "ssptrs_".}
  
  proc clapack_sstebz*(range: var cstring; order: var cstring; n: var integer; vl: ptr real;                vu: ptr real; il: var integer; iu: var integer;                abstol: ptr real; d: ptr real; e: ptr real; m: var integer;                nsplit: var integer; w: ptr real; iblock: var integer;                isplit: var integer; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "sstebz_".}
  
  proc clapack_sstedc*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "sstedc_".}
  
  proc clapack_sstegr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;                e: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr real; ldz: var integer; isuppz: var integer;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "sstegr_".}
  
  proc clapack_sstein*(n: var integer; d: ptr real; e: ptr real; m: var integer;                w: ptr real; iblock: var integer; isplit: var integer;                z: ptr real; ldz: var integer; work: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "sstein_".}
  
  proc clapack_sstemr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;                e: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; m: var integer; w: ptr real; z: ptr real;                ldz: var integer; nzc: var integer; isuppz: var integer;                tryrac: ptr logical; work: ptr real; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "sstemr_".}
  
  proc clapack_ssteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                info: var integer): cint {.importc: "ssteqr_".}
  
  proc clapack_ssterf*(n: var integer; d: ptr real; e: ptr real; info: var integer): cint {.importc: "ssterf_".}
  
  proc clapack_sstev*(jobz: var cstring; n: var integer; d: ptr real; e: ptr real;               z: ptr real; ldz: var integer; work: ptr real;               info: var integer): cint {.importc: "sstev_".}
  
  proc clapack_sstevd*(jobz: var cstring; n: var integer; d: ptr real; e: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "sstevd_".}
  
  proc clapack_sstevr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;                e: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr real; ldz: var integer; isuppz: var integer;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "sstevr_".}
  
  proc clapack_sstevx*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;                e: ptr real; vl: ptr real; vu: ptr real; il: var integer;                iu: var integer; abstol: ptr real; m: var integer; w: ptr real;                z: ptr real; ldz: var integer; work: ptr real;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "sstevx_".}
  
  proc clapack_ssycon*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; anorm: ptr real; rcond: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "ssycon_".}
  
  proc clapack_ssyequb*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                 s: ptr real; scond: ptr real; amax: ptr real; work: ptr real;                 info: var integer): cint {.importc: "ssyequb_".}
  
  proc clapack_ssyev*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr real;               lda: var integer; w: ptr real; work: ptr real;               lwork: var integer; info: var integer): cint {.importc: "ssyev_".}
  
  proc clapack_ssyevd*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr real;                lda: var integer; w: ptr real; work: ptr real;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "ssyevd_".}
  
  proc clapack_ssyevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr real; lda: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr real; ldz: var integer;                isuppz: var integer; work: ptr real; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "ssyevr_".}
  
  proc clapack_ssyevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr real; lda: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr real; ldz: var integer;                work: ptr real; lwork: var integer; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "ssyevx_".}
  
  proc clapack_ssygs2*(itype: var integer; uplo: var cstring; n: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "ssygs2_".}
  
  proc clapack_ssygst*(itype: var integer; uplo: var cstring; n: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "ssygst_".}
  
  proc clapack_ssygv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               a: ptr real; lda: var integer; b: ptr real; ldb: var integer;               w: ptr real; work: ptr real; lwork: var integer;               info: var integer): cint {.importc: "ssygv_".}
  
  proc clapack_ssygvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; w: ptr real; work: ptr real;                lwork: var integer; iwork: var integer; liwork: var integer;                info: var integer): cint {.importc: "ssygvd_".}
  
  proc clapack_ssygvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                b: ptr real; ldb: var integer; vl: ptr real; vu: ptr real;                il: var integer; iu: var integer; abstol: ptr real;                m: var integer; w: ptr real; z: ptr real; ldz: var integer;                work: ptr real; lwork: var integer; iwork: var integer;                ifail: var integer; info: var integer): cint {.importc: "ssygvx_".}
  
  proc clapack_ssyrfs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; af: ptr real; ldaf: var integer;                ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "ssyrfs_".}
  
  proc clapack_ssyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                 ldaf: var integer; ipiv: var cint; s: ptr real; b: ptr real;                 ldb: var integer; x: ptr real; ldx: var integer;                 rcond: ptr real; berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr real;                 iwork: var integer; info: var integer): cint {.importc: "ssyrfsx_".}
  
  proc clapack_ssysv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;               lda: var integer; ipiv: var cint; b: ptr real;               ldb: var integer; work: ptr real; lwork: var integer;               info: var integer): cint {.importc: "ssysv_".}
  
  proc clapack_ssysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr real; lda: var integer; af: ptr real; ldaf: var integer;                ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; rcond: ptr real; ferr: ptr real;                berr: ptr real; work: ptr real; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "ssysvx_".}
  
  proc clapack_ssysvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;                 ldaf: var integer; ipiv: var cint; equed: var cstring;                 s: ptr real; b: ptr real; ldb: var integer; x: ptr real;                 ldx: var integer; rcond: ptr real; rpvgrw: ptr real;                 berr: ptr real; n_err_bnds: var integer;                 err_bnds_norm: ptr real; err_bnds_comp: ptr real;                 nparams: var integer; params: ptr real; work: ptr real;                 iwork: var integer; info: var integer): cint {.importc: "ssysvxx_".}
  
  proc clapack_ssytd2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                d: ptr real; e: ptr real; tau: ptr real; info: var integer): cint {.importc: "ssytd2_".}
  
  proc clapack_ssytf2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; info: var integer): cint {.importc: "ssytf2_".}
  
  proc clapack_ssytrd*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                d: ptr real; e: ptr real; tau: ptr real; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "ssytrd_".}
  
  proc clapack_ssytrf*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "ssytrf_".}
  
  proc clapack_ssytri*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                ipiv: var cint; work: ptr real; info: var integer): cint {.importc: "ssytri_".}
  
  proc clapack_ssytrs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;                lda: var integer; ipiv: var cint; b: ptr real;                ldb: var integer; info: var integer): cint {.importc: "ssytrs_".}
  
  proc clapack_stbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                kd: var integer; ab: ptr real; ldab: var integer;                rcond: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "stbcon_".}
  
  proc clapack_stbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr real;                ldab: var integer; b: ptr real; ldb: var integer; x: ptr real;                ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "stbrfs_".}
  
  proc clapack_stbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr real;                ldab: var integer; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "stbtrs_".}
  
  proc clapack_stfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;               diag: var cstring; m: var integer; n: var integer; alpha: ptr real;               a: ptr real; b: ptr real; ldb: var integer): cint {.importc: "stfsm_".}
  
  proc clapack_stftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr real; info: var integer): cint {.importc: "stftri_".}
  
  proc clapack_stfttp*(transr: var cstring; uplo: var cstring; n: var integer; arf: ptr real;                ap: ptr real; info: var integer): cint {.importc: "stfttp_".}
  
  proc clapack_stfttr*(transr: var cstring; uplo: var cstring; n: var integer; arf: ptr real;                a: ptr real; lda: var integer; info: var integer): cint {.importc: "stfttr_".}
  
  proc clapack_stgevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; s: ptr real; lds: var integer; p: ptr real;                ldp: var integer; vl: ptr real; ldvl: var integer; vr: ptr real;                ldvr: var integer; mm: var integer; m: var integer;                work: ptr real; info: var integer): cint {.importc: "stgevc_".}
  
  proc clapack_stgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr real; lda: var integer; b: ptr real; ldb: var integer;                q: ptr real; ldq: var integer; z: ptr real; ldz: var integer;                j1: var integer; n1: var integer; n2: var integer;                work: ptr real; lwork: var integer; info: var integer): cint {.importc: "stgex2_".}
  
  proc clapack_stgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr real; lda: var integer; b: ptr real; ldb: var integer;                q: ptr real; ldq: var integer; z: ptr real; ldz: var integer;                ifst: var integer; ilst: var integer; work: ptr real;                lwork: var integer; info: var integer): cint {.importc: "stgexc_".}
  
  proc clapack_stgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;                select: ptr logical; n: var integer; a: ptr real;                lda: var integer; b: ptr real; ldb: var integer;                alphar: ptr real; alphai: ptr real; beta: ptr real; q: ptr real;                ldq: var integer; z: ptr real; ldz: var integer;                m: var integer; pl: ptr real; pr: ptr real; dif: ptr real;                work: ptr real; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "stgsen_".}
  
  proc clapack_stgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; k: var integer; l: var integer;                a: ptr real; lda: var integer; b: ptr real; ldb: var integer;                tola: ptr real; tolb: ptr real; alpha: ptr real; beta: ptr real;                u: ptr real; ldu: var integer; v: ptr real; ldv: var integer;                q: ptr real; ldq: var integer; work: ptr real;                ncycle: var integer; info: var integer): cint {.importc: "stgsja_".}
  
  proc clapack_stgsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; vl: ptr real; ldvl: var integer; vr: ptr real;                ldvr: var integer; s: ptr real; dif: ptr real; mm: var integer;                m: var integer; work: ptr real; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "stgsna_".}
  
  proc clapack_stgsy2*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; c: ptr real; ldc: var integer;                d: ptr real; ldd: var integer; e: ptr real; lde: var integer;                f: ptr real; ldf: var integer; scale: ptr real; rdsum: ptr real;                rdscal: ptr real; iwork: var integer; pq: var integer;                info: var integer): cint {.importc: "stgsy2_".}
  
  proc clapack_stgsyl*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; c: ptr real; ldc: var integer;                d: ptr real; ldd: var integer; e: ptr real; lde: var integer;                f: ptr real; ldf: var integer; scale: ptr real; dif: ptr real;                work: ptr real; lwork: var integer; iwork: var integer;                info: var integer): cint {.importc: "stgsyl_".}
  
  proc clapack_stpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr real; rcond: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "stpcon_".}
  
  proc clapack_stprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr real; b: ptr real; ldb: var integer;                x: ptr real; ldx: var integer; ferr: ptr real; berr: ptr real;                work: ptr real; iwork: var integer; info: var integer): cint {.importc: "stprfs_".}
  
  proc clapack_stptri*(uplo: var cstring; diag: var cstring; n: var integer; ap: ptr real;                info: var integer): cint {.importc: "stptri_".}
  
  proc clapack_stptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr real; b: ptr real; ldb: var integer;                info: var integer): cint {.importc: "stptrs_".}
  
  proc clapack_stpttf*(transr: var cstring; uplo: var cstring; n: var integer; ap: ptr real;                arf: ptr real; info: var integer): cint {.importc: "stpttf_".}
  
  proc clapack_stpttr*(uplo: var cstring; n: var integer; ap: ptr real; a: ptr real;                lda: var integer; info: var integer): cint {.importc: "stpttr_".}
  
  proc clapack_strcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr real; lda: var integer; rcond: ptr real; work: ptr real;                iwork: var integer; info: var integer): cint {.importc: "strcon_".}
  
  proc clapack_strevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr real; ldt: var integer; vl: ptr real;                ldvl: var integer; vr: ptr real; ldvr: var integer;                mm: var integer; m: var integer; work: ptr real;                info: var integer): cint {.importc: "strevc_".}
  
  proc clapack_strexc*(compq: var cstring; n: var integer; t: ptr real; ldt: var integer;                q: ptr real; ldq: var integer; ifst: var integer;                ilst: var integer; work: ptr real; info: var integer): cint {.importc: "strexc_".}
  
  proc clapack_strrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;                berr: ptr real; work: ptr real; iwork: var integer;                info: var integer): cint {.importc: "strrfs_".}
  
  proc clapack_strsen*(job: var cstring; compq: var cstring; select: ptr logical;                n: var integer; t: ptr real; ldt: var integer; q: ptr real;                ldq: var integer; wr: ptr real; wi: ptr real; m: var integer;                s: ptr real; sep: ptr real; work: ptr real; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "strsen_".}
  
  proc clapack_strsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr real; ldt: var integer; vl: ptr real;                ldvl: var integer; vr: ptr real; ldvr: var integer; s: ptr real;                sep: ptr real; mm: var integer; m: var integer; work: ptr real;                ldwork: var integer; iwork: var integer; info: var integer): cint {.importc: "strsna_".}
  
  proc clapack_strsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;                m: var integer; n: var integer; a: ptr real; lda: var integer;                b: ptr real; ldb: var integer; c: ptr real; ldc: var integer;                scale: ptr real; info: var integer): cint {.importc: "strsyl_".}
  
  proc clapack_strti2*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr real;                lda: var integer; info: var integer): cint {.importc: "strti2_".}
  
  proc clapack_strtri*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr real;                lda: var integer; info: var integer): cint {.importc: "strtri_".}
  
  proc clapack_strtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr real; lda: var integer; b: ptr real;                ldb: var integer; info: var integer): cint {.importc: "strtrs_".}
  
  proc clapack_strttf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr real;                lda: var integer; arf: ptr real; info: var integer): cint {.importc: "strttf_".}
  
  proc clapack_strttp*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;                ap: ptr real; info: var integer): cint {.importc: "strttp_".}
  
  proc clapack_stzrqf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; info: var integer): cint {.importc: "stzrqf_".}
  
  proc clapack_stzrzf*(m: var integer; n: var integer; a: ptr real; lda: var integer;                tau: ptr real; work: ptr real; lwork: var integer;                info: var integer): cint {.importc: "stzrzf_".}
  
  #___________________________________________________________________________
  #
  # Complex, double precision
  #___________________________________________________________________________
  
  proc clapack_zbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;                nru: var integer; ncc: var integer; d: ptr doublereal;                e: ptr doublereal; vt: ptr doublecomplex; ldvt: var integer;                u: ptr doublecomplex; ldu: var integer; c: ptr doublecomplex;                ldc: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zbdsqr_".}
  
  proc clapack_zcgesv*(n: var integer; nrhs: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                work: ptr doublecomplex; swork: ptr complex;                rwork: ptr doublereal; iter: var integer; info: var integer): cint {.importc: "zcgesv_".}
  
  proc clapack_zcposv*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                work: ptr doublecomplex; swork: ptr complex;                rwork: ptr doublereal; iter: var integer; info: var integer): cint {.importc: "zcposv_".}
  
  proc clapack_zdrscl*(n: var integer; sa: ptr doublereal; sx: ptr doublecomplex;                incx: var integer): cint {.importc: "zdrscl_".}
  
  proc clapack_zgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;                kl: var integer; ku: var integer; ab: ptr doublecomplex;                ldab: var integer; d: ptr doublereal; e: ptr doublereal;                q: ptr doublecomplex; ldq: var integer; pt: ptr doublecomplex;                ldpt: var integer; c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgbbrd_".}
  
  proc clapack_zgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr doublecomplex; ldab: var integer; ipiv: var cint;                anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgbcon_".}
  
  proc clapack_zgbequ*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublecomplex; ldab: var integer;                r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; info: var integer): cint {.importc: "zgbequ_".}
  
  proc clapack_zgbequb*(m: var integer; n: var integer; kl: var integer;                 ku: var integer; ab: ptr doublecomplex; ldab: var integer;                 r: ptr doublereal; c: ptr doublereal;                 rowcnd: ptr doublereal; colcnd: ptr doublereal;                 amax: ptr doublereal; info: var integer): cint {.importc: "zgbequb_".}
  
  proc clapack_zgbrfs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr doublecomplex;                ldab: var integer; afb: ptr doublecomplex; ldafb: var integer;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgbrfs_".}
  
  proc clapack_zgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;                 kl: var integer; ku: var integer; nrhs: var integer;                 ab: ptr doublecomplex; ldab: var integer;                 afb: ptr doublecomplex; ldafb: var integer; ipiv: var cint;                 r: ptr doublereal; c: ptr doublereal; b: ptr doublecomplex;                 ldb: var integer; x: ptr doublecomplex; ldx: var integer;                 rcond: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zgbrfsx_".}
  
  proc clapack_zgbsv*(n: var integer; kl: var integer; ku: var integer;               nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;               ipiv: var cint; b: ptr doublecomplex; ldb: var integer;               info: var integer): cint {.importc: "zgbsv_".}
  
  proc clapack_zgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr doublecomplex;                ldab: var integer; afb: ptr doublecomplex; ldafb: var integer;                ipiv: var cint; equed: var cstring; r: ptr doublereal;                c: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgbsvx_".}
  
  proc clapack_zgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;                 ku: var integer; nrhs: var integer; ab: ptr doublecomplex;                 ldab: var integer; afb: ptr doublecomplex; ldafb: var integer;                 ipiv: var cint; equed: var cstring; r: ptr doublereal;                 c: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                 x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                 rpvgrw: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zgbsvxx_".}
  
  proc clapack_zgbtf2*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublecomplex; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "zgbtf2_".}
  
  proc clapack_zgbtrf*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublecomplex; ldab: var integer;                ipiv: var cint; info: var integer): cint {.importc: "zgbtrf_".}
  
  proc clapack_zgbtrs*(trans: var cstring; n: var integer; kl: var integer;                ku: var integer; nrhs: var integer; ab: ptr doublecomplex;                ldab: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zgbtrs_".}
  
  proc clapack_zgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; scale: ptr doublereal; m: var integer;                v: ptr doublecomplex; ldv: var integer; info: var integer): cint {.importc: "zgebak_".}
  
  proc clapack_zgebal*(job: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ilo: var integer; ihi: var integer;                scale: ptr doublereal; info: var integer): cint {.importc: "zgebal_".}
  
  proc clapack_zgebd2*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tauq: ptr doublecomplex; taup: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgebd2_".}
  
  proc clapack_zgebrd*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tauq: ptr doublecomplex; taup: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgebrd_".}
  
  proc clapack_zgecon*(norm: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgecon_".}
  
  proc clapack_zgeequ*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; info: var integer): cint {.importc: "zgeequ_".}
  
  proc clapack_zgeequb*(m: var integer; n: var integer; a: ptr doublecomplex;                 lda: var integer; r: ptr doublereal; c: ptr doublereal;                 rowcnd: ptr doublereal; colcnd: ptr doublereal;                 amax: ptr doublereal; info: var integer): cint {.importc: "zgeequb_".}
  
  proc clapack_zgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;               a: ptr doublecomplex; lda: var integer; sdim: var integer;               w: ptr doublecomplex; vs: ptr doublecomplex; ldvs: var integer;               work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; bwork: ptr logical; info: var integer): cint {.importc: "zgees_".}
  
  proc clapack_zgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;                n: var integer; a: ptr doublecomplex; lda: var integer;                sdim: var integer; w: ptr doublecomplex; vs: ptr doublecomplex;                ldvs: var integer; rconde: ptr doublereal;                rcondv: ptr doublereal; work: ptr doublecomplex;                lwork: var integer; rwork: ptr doublereal; bwork: ptr logical;                info: var integer): cint {.importc: "zgeesx_".}
  
  proc clapack_zgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; w: ptr doublecomplex;               vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;               ldvr: var integer; work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; info: var integer): cint {.importc: "zgeev_".}
  
  proc clapack_zgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr doublecomplex; lda: var integer;                w: ptr doublecomplex; vl: ptr doublecomplex; ldvl: var integer;                vr: ptr doublecomplex; ldvr: var integer; ilo: var integer;                ihi: var integer; scale: ptr doublereal; abnrm: ptr doublereal;                rconde: ptr doublereal; rcondv: ptr doublereal;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgeevx_".}
  
  proc clapack_zgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer; alpha: ptr doublecomplex;               beta: ptr doublecomplex; vsl: ptr doublecomplex;               ldvsl: var integer; vsr: ptr doublecomplex; ldvsr: var integer;               work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; info: var integer): cint {.importc: "zgegs_".}
  
  proc clapack_zgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer; alpha: ptr doublecomplex;               beta: ptr doublecomplex; vl: ptr doublecomplex;               ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;               work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; info: var integer): cint {.importc: "zgegv_".}
  
  proc clapack_zgehd2*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgehd2_".}
  
  proc clapack_zgehrd*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgehrd_".}
  
  proc clapack_zgelq2*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgelq2_".}
  
  proc clapack_zgelqf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgelqf_".}
  
  proc clapack_zgels*(trans: var cstring; m: var integer; n: var integer;               nrhs: var integer; a: ptr doublecomplex; lda: var integer;               b: ptr doublecomplex; ldb: var integer; work: ptr doublecomplex;               lwork: var integer; info: var integer): cint {.importc: "zgels_".}
  
  proc clapack_zgelsd*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;                rank: var integer; work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zgelsd_".}
  
  proc clapack_zgelss*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;                rank: var integer; work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgelss_".}
  
  proc clapack_zgelsx*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; jpvt: var integer; rcond: ptr doublereal;                rank: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgelsx_".}
  
  proc clapack_zgelsy*(m: var integer; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; jpvt: var integer; rcond: ptr doublereal;                rank: var integer; work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgelsy_".}
  
  proc clapack_zgeql2*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgeql2_".}
  
  proc clapack_zgeqlf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgeqlf_".}
  
  proc clapack_zgeqp3*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; jpvt: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgeqp3_".}
  
  proc clapack_zgeqpf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; jpvt: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgeqpf_".}
  
  proc clapack_zgeqr2*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgeqr2_".}
  
  proc clapack_zgeqrf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgeqrf_".}
  
  proc clapack_zgerfs*(trans: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgerfs_".}
  
  proc clapack_zgerfsx*(trans: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                 r: ptr doublereal; c: ptr doublereal; b: ptr doublecomplex;                 ldb: var integer; x: ptr doublecomplex; ldx: var integer;                 rcond: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zgerfsx_".}
  
  proc clapack_zgerq2*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgerq2_".}
  
  proc clapack_zgerqf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgerqf_".}
  
  proc clapack_zgesc2*(n: var integer; a: ptr doublecomplex; lda: var integer;                rhs: ptr doublecomplex; ipiv: var cint; jpiv: var cint;                scale: ptr doublereal): cint {.importc: "zgesc2_".}
  
  proc clapack_zgesdd*(jobz: var cstring; m: var integer; n: var integer;                a: ptr doublecomplex; lda: var integer; s: ptr doublereal;                u: ptr doublecomplex; ldu: var integer; vt: ptr doublecomplex;                ldvt: var integer; work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zgesdd_".}
  
  proc clapack_zgesv*(n: var integer; nrhs: var integer; a: ptr doublecomplex;               lda: var integer; ipiv: var cint; b: ptr doublecomplex;               ldb: var integer; info: var integer): cint {.importc: "zgesv_".}
  
  proc clapack_zgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;                a: ptr doublecomplex; lda: var integer; s: ptr doublereal;                u: ptr doublecomplex; ldu: var integer; vt: ptr doublecomplex;                ldvt: var integer; work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgesvd_".}
  
  proc clapack_zgesvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; a: ptr doublecomplex; lda: var integer;                af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                equed: var cstring; r: ptr doublereal; c: ptr doublereal;                b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zgesvx_".}
  
  proc clapack_zgesvxx*(fact: var cstring; trans: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                 equed: var cstring; r: ptr doublereal; c: ptr doublereal;                 b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                 ldx: var integer; rcond: ptr doublereal;                 rpvgrw: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zgesvxx_".}
  
  proc clapack_zgetc2*(n: var integer; a: ptr doublecomplex; lda: var integer;                ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "zgetc2_".}
  
  proc clapack_zgetf2*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zgetf2_".}
  
  proc clapack_zgetrf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zgetrf_".}
  
  proc clapack_zgetri*(n: var integer; a: ptr doublecomplex; lda: var integer;                ipiv: var cint; work: ptr doublecomplex; lwork: var integer;                info: var integer): cint {.importc: "zgetri_".}
  
  proc clapack_zgetrs*(trans: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; ipiv: var cint;                b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zgetrs_".}
  
  proc clapack_zggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;                ihi: var integer; lscale: ptr doublereal;                rscale: ptr doublereal; m: var integer; v: ptr doublecomplex;                ldv: var integer; info: var integer): cint {.importc: "zggbak_".}
  
  proc clapack_zggbal*(job: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                ilo: var integer; ihi: var integer; lscale: ptr doublereal;                rscale: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "zggbal_".}
  
  proc clapack_zgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;               n: var integer; a: ptr doublecomplex; lda: var integer;               b: ptr doublecomplex; ldb: var integer; sdim: var integer;               alpha: ptr doublecomplex; beta: ptr doublecomplex;               vsl: ptr doublecomplex; ldvsl: var integer;               vsr: ptr doublecomplex; ldvsr: var integer;               work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; bwork: ptr logical; info: var integer): cint {.importc: "zgges_".}
  
  proc clapack_zggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;                sense: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                sdim: var integer; alpha: ptr doublecomplex;                beta: ptr doublecomplex; vsl: ptr doublecomplex;                ldvsl: var integer; vsr: ptr doublecomplex; ldvsr: var integer;                rconde: ptr doublereal; rcondv: ptr doublereal;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; iwork: var integer; liwork: var integer;                bwork: ptr logical; info: var integer): cint {.importc: "zggesx_".}
  
  proc clapack_zggev*(jobvl: var cstring; jobvr: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer; alpha: ptr doublecomplex;               beta: ptr doublecomplex; vl: ptr doublecomplex;               ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;               work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; info: var integer): cint {.importc: "zggev_".}
  
  proc clapack_zggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;                n: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer;                alpha: ptr doublecomplex; beta: ptr doublecomplex;                vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;                ldvr: var integer; ilo: var integer; ihi: var integer;                lscale: ptr doublereal; rscale: ptr doublereal;                abnrm: ptr doublereal; bbnrm: ptr doublereal;                rconde: ptr doublereal; rcondv: ptr doublereal;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; iwork: var integer; bwork: ptr logical;                info: var integer): cint {.importc: "zggevx_".}
  
  proc clapack_zggglm*(n: var integer; m: var integer; p: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; d: ptr doublecomplex; x: ptr doublecomplex;                y: ptr doublecomplex; work: ptr doublecomplex;                lwork: var integer; info: var integer): cint {.importc: "zggglm_".}
  
  proc clapack_zgghrd*(compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                q: ptr doublecomplex; ldq: var integer; z: ptr doublecomplex;                ldz: var integer; info: var integer): cint {.importc: "zgghrd_".}
  
  proc clapack_zgglse*(m: var integer; n: var integer; p: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; c: ptr doublecomplex;                d: ptr doublecomplex; x: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgglse_".}
  
  proc clapack_zggqrf*(n: var integer; m: var integer; p: var integer;                a: ptr doublecomplex; lda: var integer; taua: ptr doublecomplex;                b: ptr doublecomplex; ldb: var integer; taub: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zggqrf_".}
  
  proc clapack_zggrqf*(m: var integer; p: var integer; n: var integer;                a: ptr doublecomplex; lda: var integer; taua: ptr doublecomplex;                b: ptr doublecomplex; ldb: var integer; taub: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zggrqf_".}
  
  proc clapack_zggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                n: var integer; p: var integer; k: var integer; l: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; alpha: ptr doublereal; beta: ptr doublereal;                u: ptr doublecomplex; ldu: var integer; v: ptr doublecomplex;                ldv: var integer; q: ptr doublecomplex; ldq: var integer;                work: ptr doublecomplex; rwork: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "zggsvd_".}
  
  proc clapack_zggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                tola: ptr doublereal; tolb: ptr doublereal; k: var integer;                l: var integer; u: ptr doublecomplex; ldu: var integer;                v: ptr doublecomplex; ldv: var integer; q: ptr doublecomplex;                ldq: var integer; iwork: var integer; rwork: ptr doublereal;                tau: ptr doublecomplex; work: ptr doublecomplex;                info: var integer): cint {.importc: "zggsvp_".}
  
  proc clapack_zgtcon*(norm: var cstring; n: var integer; dl: ptr doublecomplex;                d: ptr doublecomplex; du: ptr doublecomplex;                du2: ptr doublecomplex; ipiv: var cint;                anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; info: var integer): cint {.importc: "zgtcon_".}
  
  proc clapack_zgtrfs*(trans: var cstring; n: var integer; nrhs: var integer;                dl: ptr doublecomplex; d: ptr doublecomplex;                du: ptr doublecomplex; dlf: ptr doublecomplex;                df: ptr doublecomplex; duf: ptr doublecomplex;                du2: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgtrfs_".}
  
  proc clapack_zgtsv*(n: var integer; nrhs: var integer; dl: ptr doublecomplex;               d: ptr doublecomplex; du: ptr doublecomplex;               b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zgtsv_".}
  
  proc clapack_zgtsvx*(fact: var cstring; trans: var cstring; n: var integer;                nrhs: var integer; dl: ptr doublecomplex;                d: ptr doublecomplex; du: ptr doublecomplex;                dlf: ptr doublecomplex; df: ptr doublecomplex;                duf: ptr doublecomplex; du2: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zgtsvx_".}
  
  proc clapack_zgttrf*(n: var integer; dl: ptr doublecomplex; d: ptr doublecomplex;                du: ptr doublecomplex; du2: ptr doublecomplex;                ipiv: var cint; info: var integer): cint {.importc: "zgttrf_".}
  
  proc clapack_zgttrs*(trans: var cstring; n: var integer; nrhs: var integer;                dl: ptr doublecomplex; d: ptr doublecomplex;                du: ptr doublecomplex; du2: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                info: var integer): cint {.importc: "zgttrs_".}
  
  proc clapack_zgtts2*(itrans: var integer; n: var integer; nrhs: var integer;                dl: ptr doublecomplex; d: ptr doublecomplex;                du: ptr doublecomplex; du2: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer): cint {.importc: "zgtts2_".}
  
  proc clapack_zhbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;               ab: ptr doublecomplex; ldab: var integer; w: ptr doublereal;               z: ptr doublecomplex; ldz: var integer;               work: ptr doublecomplex; rwork: ptr doublereal; info: var integer): cint {.importc: "zhbev_".}
  
  proc clapack_zhbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zhbevd_".}
  
  proc clapack_zhbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                kd: var integer; ab: ptr doublecomplex; ldab: var integer;                q: ptr doublecomplex; ldq: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; rwork: ptr doublereal;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "zhbevx_".}
  
  proc clapack_zhbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr doublecomplex; ldab: var integer;                bb: ptr doublecomplex; ldbb: var integer; x: ptr doublecomplex;                ldx: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zhbgst_".}
  
  proc clapack_zhbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;               kb: var integer; ab: ptr doublecomplex; ldab: var integer;               bb: ptr doublecomplex; ldbb: var integer; w: ptr doublereal;               z: ptr doublecomplex; ldz: var integer;               work: ptr doublecomplex; rwork: ptr doublereal; info: var integer): cint {.importc: "zhbgv_".}
  
  proc clapack_zhbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;                kb: var integer; ab: ptr doublecomplex; ldab: var integer;                bb: ptr doublecomplex; ldbb: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zhbgvd_".}
  
  proc clapack_zhbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ka: var integer; kb: var integer; ab: ptr doublecomplex;                ldab: var integer; bb: ptr doublecomplex; ldbb: var integer;                q: ptr doublecomplex; ldq: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; rwork: ptr doublereal;                iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "zhbgvx_".}
  
  proc clapack_zhbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; d: ptr doublereal;                e: ptr doublereal; q: ptr doublecomplex; ldq: var integer;                work: ptr doublecomplex; info: var integer): cint {.importc: "zhbtrd_".}
  
  proc clapack_zhecon*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; anorm: ptr doublereal;                rcond: ptr doublereal; work: ptr doublecomplex;                info: var integer): cint {.importc: "zhecon_".}
  
  proc clapack_zheequb*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                 lda: var integer; s: ptr doublereal; scond: ptr doublereal;                 amax: ptr doublereal; work: ptr doublecomplex;                 info: var integer): cint {.importc: "zheequb_".}
  
  proc clapack_zheev*(jobz: var cstring; uplo: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; w: ptr doublereal;               work: ptr doublecomplex; lwork: var integer;               rwork: ptr doublereal; info: var integer): cint {.importc: "zheev_".}
  
  proc clapack_zheevd*(jobz: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; w: ptr doublereal;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zheevd_".}
  
  proc clapack_zheevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer; isuppz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zheevr_".}
  
  proc clapack_zheevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "zheevx_".}
  
  proc clapack_zhegs2*(itype: var integer; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zhegs2_".}
  
  proc clapack_zhegst*(itype: var integer; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zhegst_".}
  
  proc clapack_zhegv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer; w: ptr doublereal; work: ptr doublecomplex;               lwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zhegv_".}
  
  proc clapack_zhegvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer; w: ptr doublereal;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zhegvd_".}
  
  proc clapack_zhegvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                vl: ptr doublereal; vu: ptr doublereal; il: var integer;                iu: var integer; abstol: ptr doublereal; m: var integer;                w: ptr doublereal; z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "zhegvx_".}
  
  proc clapack_zherfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zherfs_".}
  
  proc clapack_zherfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                 s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                 x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zherfsx_".}
  
  proc clapack_zhesv*(uplo: var cstring; n: var integer; nrhs: var integer;               a: ptr doublecomplex; lda: var integer; ipiv: var cint;               b: ptr doublecomplex; ldb: var integer; work: ptr doublecomplex;               lwork: var integer; info: var integer): cint {.importc: "zhesv_".}
  
  proc clapack_zhesvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                lwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zhesvx_".}
  
  proc clapack_zhesvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                 equed: var cstring; s: ptr doublereal; b: ptr doublecomplex;                 ldb: var integer; x: ptr doublecomplex; ldx: var integer;                 rcond: ptr doublereal; rpvgrw: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zhesvxx_".}
  
  proc clapack_zhetd2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tau: ptr doublecomplex; info: var integer): cint {.importc: "zhetd2_".}
  
  proc clapack_zhetf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zhetf2_".}
  
  proc clapack_zhetrd*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; d: ptr doublereal; e: ptr doublereal;                tau: ptr doublecomplex; work: ptr doublecomplex;                lwork: var integer; info: var integer): cint {.importc: "zhetrd_".}
  
  proc clapack_zhetrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; work: ptr doublecomplex;                lwork: var integer; info: var integer): cint {.importc: "zhetrf_".}
  
  proc clapack_zhetri*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; work: ptr doublecomplex;                info: var integer): cint {.importc: "zhetri_".}
  
  proc clapack_zhetrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; ipiv: var cint;                b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zhetrs_".}
  
  proc clapack_zhfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;               k: var integer; alpha: ptr doublereal; a: ptr doublecomplex;               lda: var integer; beta: ptr doublereal; c: ptr doublecomplex): cint {.importc: "zhfrk_".}
  
  proc clapack_zhgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublecomplex;                ldh: var integer; t: ptr doublecomplex; ldt: var integer;                alpha: ptr doublecomplex; beta: ptr doublecomplex;                q: ptr doublecomplex; ldq: var integer; z: ptr doublecomplex;                ldz: var integer; work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; info: var integer): cint {.importc: "zhgeqz_".}
  
  proc clapack_zhpcon*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; info: var integer): cint {.importc: "zhpcon_".}
  
  proc clapack_zhpev*(jobz: var cstring; uplo: var cstring; n: var integer;               ap: ptr doublecomplex; w: ptr doublereal; z: ptr doublecomplex;               ldz: var integer; work: ptr doublecomplex; rwork: ptr doublereal;               info: var integer): cint {.importc: "zhpev_".}
  
  proc clapack_zhpevd*(jobz: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublecomplex; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zhpevd_".}
  
  proc clapack_zhpevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublecomplex; vl: ptr doublereal; vu: ptr doublereal;                il: var integer; iu: var integer; abstol: ptr doublereal;                m: var integer; w: ptr doublereal; z: ptr doublecomplex;                ldz: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "zhpevx_".}
  
  proc clapack_zhpgst*(itype: var integer; uplo: var cstring; n: var integer;                ap: ptr doublecomplex; bp: ptr doublecomplex; info: var integer): cint {.importc: "zhpgst_".}
  
  proc clapack_zhpgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;               ap: ptr doublecomplex; bp: ptr doublecomplex; w: ptr doublereal;               z: ptr doublecomplex; ldz: var integer;               work: ptr doublecomplex; rwork: ptr doublereal; info: var integer): cint {.importc: "zhpgv_".}
  
  proc clapack_zhpgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;                n: var integer; ap: ptr doublecomplex; bp: ptr doublecomplex;                w: ptr doublereal; z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zhpgvd_".}
  
  proc clapack_zhpgvx*(itype: var integer; jobz: var cstring; range: var cstring;                uplo: var cstring; n: var integer; ap: ptr doublecomplex;                bp: ptr doublecomplex; vl: ptr doublereal; vu: ptr doublereal;                il: var integer; iu: var integer; abstol: ptr doublereal;                m: var integer; w: ptr doublereal; z: ptr doublecomplex;                ldz: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "zhpgvx_".}
  
  proc clapack_zhprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; afp: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zhprfs_".}
  
  proc clapack_zhpsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;               ldb: var integer; info: var integer): cint {.importc: "zhpsv_".}
  
  proc clapack_zhpsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; afp: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zhpsvx_".}
  
  proc clapack_zhptrd*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                d: ptr doublereal; e: ptr doublereal; tau: ptr doublecomplex;                info: var integer): cint {.importc: "zhptrd_".}
  
  proc clapack_zhptrf*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                ipiv: var cint; info: var integer): cint {.importc: "zhptrf_".}
  
  proc clapack_zhptri*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                ipiv: var cint; work: ptr doublecomplex; info: var integer): cint {.importc: "zhptri_".}
  
  proc clapack_zhptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zhptrs_".}
  
  proc clapack_zhsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;                select: ptr logical; n: var integer; h: ptr doublecomplex;                ldh: var integer; w: ptr doublecomplex; vl: ptr doublecomplex;                ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;                mm: var integer; m: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; ifaill: var integer; ifailr: var integer;                info: var integer): cint {.importc: "zhsein_".}
  
  proc clapack_zhseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;                ihi: var integer; h: ptr doublecomplex; ldh: var integer;                w: ptr doublecomplex; z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zhseqr_".}
  
  proc clapack_zla_gbamv*(trans: var integer; m: var integer; n: var integer;                    kl: var integer; ku: var integer; alpha: ptr doublereal;                    ab: ptr doublecomplex; ldab: var integer;                    x: ptr doublecomplex; incx: var integer;                    beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_gbamv__".}
  proc clapack_zla_gbrcond_c*(trans: var cstring; n: var integer; kl: var integer;                        ku: var integer; ab: ptr doublecomplex;                        ldab: var integer; afb: ptr doublecomplex;                        ldafb: var integer; ipiv: var cint;                        c: ptr doublereal; capply: ptr logical;                        info: var integer; work: ptr doublecomplex;                        rwork: ptr doublereal; trans_len: ftnlen): doublereal {.importc: "zla_gbrcond_c__".}
  proc clapack_zla_gbrcond_x*(trans: var cstring; n: var integer; kl: var integer;                        ku: var integer; ab: ptr doublecomplex;                        ldab: var integer; afb: ptr doublecomplex;                        ldafb: var integer; ipiv: var cint;                        x: ptr doublecomplex; info: var integer;                        work: ptr doublecomplex; rwork: ptr doublereal;                        trans_len: ftnlen): doublereal {.importc: "zla_gbrcond_x__".}
  
  proc clapack_zla_gbrfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              kl: var integer; ku: var integer;                              nrhs: var integer; ab: ptr doublecomplex;                              ldab: var integer; afb: ptr doublecomplex;                              ldafb: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr doublereal;                              b: ptr doublecomplex; ldb: var integer;                              y: ptr doublecomplex; ldy: var integer;                              berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublecomplex;                              ayb: ptr doublereal; dy: ptr doublecomplex;                              y_tail: ptr doublecomplex;                              rcond: ptr doublereal; ithresh: var integer;                              rthresh: ptr doublereal; dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer): cint {.importc: "zla_gbrfsx_extended__".}
  proc clapack_zla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;                       ncols: var integer; ab: ptr doublecomplex;                       ldab: var integer; afb: ptr doublecomplex;                       ldafb: var integer): doublereal {.importc: "zla_gbrpvgrw__".}
  
  proc clapack_zla_geamv*(trans: var integer; m: var integer; n: var integer;                    alpha: ptr doublereal; a: ptr doublecomplex;                    lda: var integer; x: ptr doublecomplex; incx: var integer;                    beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_geamv__".}
  proc clapack_zla_gercond_c*(trans: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; ipiv: var cint;                        c: ptr doublereal; capply: ptr logical;                        info: var integer; work: ptr doublecomplex;                        rwork: ptr doublereal; trans_len: ftnlen): doublereal {.importc: "zla_gercond_c__".}
  proc clapack_zla_gercond_x*(trans: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; ipiv: var cint;                        x: ptr doublecomplex; info: var integer;                        work: ptr doublecomplex; rwork: ptr doublereal;                        trans_len: ftnlen): doublereal {.importc: "zla_gercond_x__".}
  
  proc clapack_zla_gerfsx_extended*(prec_type: var integer;                              trans_type: var integer; n: var integer;                              nrhs: var integer; a: ptr doublecomplex;                              lda: var integer; af: ptr doublecomplex;                              ldaf: var integer; ipiv: var cint;                              colequ: ptr logical; c: ptr doublereal;                              b: ptr doublecomplex; ldb: var integer;                              y: ptr doublecomplex; ldy: var integer;                              berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublecomplex;                              ayb: ptr doublereal; dy: ptr doublecomplex;                              y_tail: ptr doublecomplex;                              rcond: ptr doublereal; ithresh: var integer;                              rthresh: ptr doublereal; dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer): cint {.importc: "zla_gerfsx_extended__".}
  
  proc clapack_zla_heamv*(uplo: var integer; n: var integer; alpha: ptr doublereal;                    a: ptr doublecomplex; lda: var integer;                    x: ptr doublecomplex; incx: var integer;                    beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_heamv__".}
  proc clapack_zla_hercond_c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; ipiv: var cint;                        c: ptr doublereal; capply: ptr logical;                        info: var integer; work: ptr doublecomplex;                        rwork: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_hercond_c__".}
  proc clapack_zla_hercond_x*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; ipiv: var cint;                        x: ptr doublecomplex; info: var integer;                        work: ptr doublecomplex; rwork: ptr doublereal;                        uplo_len: ftnlen): doublereal {.importc: "zla_hercond_x__".}
  
  proc clapack_zla_herfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer;                              a: ptr doublecomplex; lda: var integer;                              af: ptr doublecomplex; ldaf: var integer;                              ipiv: var cint; colequ: ptr logical;                              c: ptr doublereal; b: ptr doublecomplex;                              ldb: var integer; y: ptr doublecomplex;                              ldy: var integer; berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublecomplex;                              ayb: ptr doublereal; dy: ptr doublecomplex;                              y_tail: ptr doublecomplex;                              rcond: ptr doublereal; ithresh: var integer;                              rthresh: ptr doublereal; dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer;                              uplo_len: ftnlen): cint {.importc: "zla_herfsx_extended__".}
  proc clapack_zla_herpvgrw*(uplo: var cstring; n: var integer; info: var integer;                       a: ptr doublecomplex; lda: var integer;                       af: ptr doublecomplex; ldaf: var integer;                       ipiv: var cint; work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_herpvgrw__".}
  
  proc clapack_zla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;                       res: ptr doublecomplex; ayb: ptr doublereal;                       berr: ptr doublereal): cint {.importc: "zla_lin_berr__".}
  proc clapack_zla_porcond_c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; c: ptr doublereal;                        capply: ptr logical; info: var integer;                        work: ptr doublecomplex; rwork: ptr doublereal;                        uplo_len: ftnlen): doublereal {.importc: "zla_porcond_c__".}
  proc clapack_zla_porcond_x*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; x: ptr doublecomplex;                        info: var integer; work: ptr doublecomplex;                        rwork: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_porcond_x__".}
  
  proc clapack_zla_porfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer;                              a: ptr doublecomplex; lda: var integer;                              af: ptr doublecomplex; ldaf: var integer;                              colequ: ptr logical; c: ptr doublereal;                              b: ptr doublecomplex; ldb: var integer;                              y: ptr doublecomplex; ldy: var integer;                              berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublecomplex;                              ayb: ptr doublereal; dy: ptr doublecomplex;                              y_tail: ptr doublecomplex;                              rcond: ptr doublereal; ithresh: var integer;                              rthresh: ptr doublereal; dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer;                              uplo_len: ftnlen): cint {.importc: "zla_porfsx_extended__".}
  proc clapack_zla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr doublecomplex;                       lda: var integer; af: ptr doublecomplex;                       ldaf: var integer; work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_porpvgrw__".}
  proc clapack_zla_rpvgrw*(n: var integer; ncols: var integer; a: ptr doublecomplex;                     lda: var integer; af: ptr doublecomplex; ldaf: var integer): doublereal {.importc: "zla_rpvgrw__".}
  
  proc clapack_zla_syamv*(uplo: var integer; n: var integer; alpha: ptr doublereal;                    a: ptr doublecomplex; lda: var integer;                    x: ptr doublecomplex; incx: var integer;                    beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_syamv__".}
  proc clapack_zla_syrcond_c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; ipiv: var cint;                        c: ptr doublereal; capply: ptr logical;                        info: var integer; work: ptr doublecomplex;                        rwork: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_syrcond_c__".}
  proc clapack_zla_syrcond_x*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                        lda: var integer; af: ptr doublecomplex;                        ldaf: var integer; ipiv: var cint;                        x: ptr doublecomplex; info: var integer;                        work: ptr doublecomplex; rwork: ptr doublereal;                        uplo_len: ftnlen): doublereal {.importc: "zla_syrcond_x__".}
  
  proc clapack_zla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;                              n: var integer; nrhs: var integer;                              a: ptr doublecomplex; lda: var integer;                              af: ptr doublecomplex; ldaf: var integer;                              ipiv: var cint; colequ: ptr logical;                              c: ptr doublereal; b: ptr doublecomplex;                              ldb: var integer; y: ptr doublecomplex;                              ldy: var integer; berr_out: ptr doublereal;                              n_norms: var integer; errs_n: ptr doublereal;                              errs_c: ptr doublereal; res: ptr doublecomplex;                              ayb: ptr doublereal; dy: ptr doublecomplex;                              y_tail: ptr doublecomplex;                              rcond: ptr doublereal; ithresh: var integer;                              rthresh: ptr doublereal; dz_ub: ptr doublereal;                              ignore_cwise: ptr logical; info: var integer;                              uplo_len: ftnlen): cint {.importc: "zla_syrfsx_extended__".}
  proc clapack_zla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;                       a: ptr doublecomplex; lda: var integer;                       af: ptr doublecomplex; ldaf: var integer;                       ipiv: var cint; work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_syrpvgrw__".}
  
  proc clapack_zla_wwaddw*(n: var integer; x: ptr doublecomplex; y: ptr doublecomplex;                     w: ptr doublecomplex): cint {.importc: "zla_wwaddw__".}
  
  proc clapack_zlabrd*(m: var integer; n: var integer; nb: var integer;                a: ptr doublecomplex; lda: var integer; d: ptr doublereal;                e: ptr doublereal; tauq: ptr doublecomplex;                taup: ptr doublecomplex; x: ptr doublecomplex; ldx: var integer;                y: ptr doublecomplex; ldy: var integer): cint {.importc: "zlabrd_".}
  
  proc clapack_zlacgv*(n: var integer; x: ptr doublecomplex; incx: var integer): cint {.importc: "zlacgv_".}
  
  proc clapack_zlacn2*(n: var integer; v: ptr doublecomplex; x: ptr doublecomplex;                est: ptr doublereal; kase: var integer; isave: var integer): cint {.importc: "zlacn2_".}
  
  proc clapack_zlacon*(n: var integer; v: ptr doublecomplex; x: ptr doublecomplex;                est: ptr doublereal; kase: var integer): cint {.importc: "zlacon_".}
  
  proc clapack_zlacp2*(uplo: var cstring; m: var integer; n: var integer;                a: ptr doublereal; lda: var integer; b: ptr doublecomplex;                ldb: var integer): cint {.importc: "zlacp2_".}
  
  proc clapack_zlacpy*(uplo: var cstring; m: var integer; n: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer): cint {.importc: "zlacpy_".}
  
  proc clapack_zlacrm*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublereal; ldb: var integer;                c: ptr doublecomplex; ldc: var integer; rwork: ptr doublereal): cint {.importc: "zlacrm_".}
  
  proc clapack_zlacrt*(n: var integer; cx: ptr doublecomplex; incx: var integer;                cy: ptr doublecomplex; incy: var integer;                c: ptr doublecomplex; s: ptr doublecomplex): cint {.importc: "zlacrt_".}
  # Double Complex 
  proc clapack_zladiv*(ret_val: ptr doublecomplex; x: ptr doublecomplex;                y: ptr doublecomplex): void {.importc: "zladiv_".}
  
  proc clapack_zlaed0*(qsiz: var integer; n: var integer; d: ptr doublereal;                e: ptr doublereal; q: ptr doublecomplex; ldq: var integer;                qstore: ptr doublecomplex; ldqs: var integer;                rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zlaed0_".}
  
  proc clapack_zlaed7*(n: var integer; cutpnt: var integer; qsiz: var integer;                tlvls: var integer; curlvl: var integer; curpbm: var integer;                d: ptr doublereal; q: ptr doublecomplex; ldq: var integer;                rho: ptr doublereal; indxq: var integer; qstore: ptr doublereal;                qptr: var integer; prmptr: var integer; perm: var integer;                givptr: var integer; givcol: var integer;                givnum: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zlaed7_".}
  
  proc clapack_zlaed8*(k: var integer; n: var integer; qsiz: var integer;                q: ptr doublecomplex; ldq: var integer; d: ptr doublereal;                rho: ptr doublereal; cutpnt: var integer; z: ptr doublereal;                dlamda: ptr doublereal; q2: ptr doublecomplex;                ldq2: var integer; w: ptr doublereal; indxp: var integer;                indx: var integer; indxq: var integer; perm: var integer;                givptr: var integer; givcol: var integer;                givnum: ptr doublereal; info: var integer): cint {.importc: "zlaed8_".}
  
  proc clapack_zlaein*(rightv: ptr logical; noinit: ptr logical; n: var integer;                h: ptr doublecomplex; ldh: var integer; w: ptr doublecomplex;                v: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;                rwork: ptr doublereal; eps3: ptr doublereal;                smlnum: ptr doublereal; info: var integer): cint {.importc: "zlaein_".}
  
  proc clapack_zlaesy*(a: ptr doublecomplex; b: ptr doublecomplex;                c: ptr doublecomplex; rt1: ptr doublecomplex;                rt2: ptr doublecomplex; evscal: ptr doublecomplex;                cs1: ptr doublecomplex; sn1: ptr doublecomplex): cint {.importc: "zlaesy_".}
  
  proc clapack_zlaev2*(a: ptr doublecomplex; b: ptr doublecomplex;                c: ptr doublecomplex; rt1: ptr doublereal;                rt2: ptr doublereal; cs1: ptr doublereal; sn1: ptr doublecomplex): cint {.importc: "zlaev2_".}
  
  proc clapack_zlag2c*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; sa: ptr complex; ldsa: var integer;                info: var integer): cint {.importc: "zlag2c_".}
  
  proc clapack_zlags2*(upper: ptr logical; a1: ptr doublereal; a2: ptr doublecomplex;                a3: ptr doublereal; b1: ptr doublereal; b2: ptr doublecomplex;                b3: ptr doublereal; csu: ptr doublereal; snu: ptr doublecomplex;                csv: ptr doublereal; snv: ptr doublecomplex;                csq: ptr doublereal; snq: ptr doublecomplex): cint {.importc: "zlags2_".}
  
  proc clapack_zlagtm*(trans: var cstring; n: var integer; nrhs: var integer;                alpha: ptr doublereal; dl: ptr doublecomplex;                d: ptr doublecomplex; du: ptr doublecomplex;                x: ptr doublecomplex; ldx: var integer; beta: ptr doublereal;                b: ptr doublecomplex; ldb: var integer): cint {.importc: "zlagtm_".}
  
  proc clapack_zlahef*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;                a: ptr doublecomplex; lda: var integer; ipiv: var cint;                w: ptr doublecomplex; ldw: var integer; info: var integer): cint {.importc: "zlahef_".}
  
  proc clapack_zlahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublecomplex;                ldh: var integer; w: ptr doublecomplex; iloz: var integer;                ihiz: var integer; z: ptr doublecomplex; ldz: var integer;                info: var integer): cint {.importc: "zlahqr_".}
  
  proc clapack_zlahr2*(n: var integer; k: var integer; nb: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                t: ptr doublecomplex; ldt: var integer; y: ptr doublecomplex;                ldy: var integer): cint {.importc: "zlahr2_".}
  
  proc clapack_zlahrd*(n: var integer; k: var integer; nb: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                t: ptr doublecomplex; ldt: var integer; y: ptr doublecomplex;                ldy: var integer): cint {.importc: "zlahrd_".}
  
  proc clapack_zlaic1*(job: var integer; j: var integer; x: ptr doublecomplex;                sest: ptr doublereal; w: ptr doublecomplex;                gamma: ptr doublecomplex; sestpr: ptr doublereal;                s: ptr doublecomplex; c: ptr doublecomplex): cint {.importc: "zlaic1_".}
  
  proc clapack_zlals0*(icompq: var integer; nl: var integer; nr: var integer;                sqre: var integer; nrhs: var integer; b: ptr doublecomplex;                ldb: var integer; bx: ptr doublecomplex; ldbx: var integer;                perm: var integer; givptr: var integer; givcol: var integer;                ldgcol: var integer; givnum: ptr doublereal;                ldgnum: var integer; poles: ptr doublereal;                difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;                k: var integer; c: ptr doublereal; s: ptr doublereal;                rwork: ptr doublereal; info: var integer): cint {.importc: "zlals0_".}
  
  proc clapack_zlalsa*(icompq: var integer; smlsiz: var integer; n: var integer;                nrhs: var integer; b: ptr doublecomplex; ldb: var integer;                bx: ptr doublecomplex; ldbx: var integer; u: ptr doublereal;                ldu: var integer; vt: ptr doublereal; k: var integer;                difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;                poles: ptr doublereal; givptr: var integer; givcol: var integer;                ldgcol: var integer; perm: var integer; givnum: ptr doublereal;                c: ptr doublereal; s: ptr doublereal; rwork: ptr doublereal;                iwork: var integer; info: var integer): cint {.importc: "zlalsa_".}
  
  proc clapack_zlalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;                nrhs: var integer; d: ptr doublereal; e: ptr doublereal;                b: ptr doublecomplex; ldb: var integer; rcond: ptr doublereal;                rank: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zlalsd_".}
  proc clapack_zlangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;                ab: ptr doublecomplex; ldab: var integer; work: ptr doublereal): doublereal {.importc: "zlangb_".}
  proc clapack_zlange*(norm: var cstring; m: var integer; n: var integer;                a: ptr doublecomplex; lda: var integer; work: ptr doublereal): doublereal {.importc: "zlange_".}
  proc clapack_zlangt*(norm: var cstring; n: var integer; dl: ptr doublecomplex;                d: ptr doublecomplex; du: ptr doublecomplex): doublereal {.importc: "zlangt_".}
  proc clapack_zlanhb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;                ab: ptr doublecomplex; ldab: var integer; work: ptr doublereal): doublereal {.importc: "zlanhb_".}
  proc clapack_zlanhe*(norm: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; work: ptr doublereal): doublereal {.importc: "zlanhe_".}
  proc clapack_zlanhf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlanhf_".}
  proc clapack_zlanhp*(norm: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlanhp_".}
  proc clapack_zlanhs*(norm: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; work: ptr doublereal): doublereal {.importc: "zlanhs_".}
  proc clapack_zlanht*(norm: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublecomplex): doublereal {.importc: "zlanht_".}
  proc clapack_zlansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;                ab: ptr doublecomplex; ldab: var integer; work: ptr doublereal): doublereal {.importc: "zlansb_".}
  proc clapack_zlansp*(norm: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlansp_".}
  proc clapack_zlansy*(norm: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; work: ptr doublereal): doublereal {.importc: "zlansy_".}
  proc clapack_zlantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                k: var integer; ab: ptr doublecomplex; ldab: var integer;                work: ptr doublereal): doublereal {.importc: "zlantb_".}
  proc clapack_zlantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlantp_".}
  proc clapack_zlantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;                n: var integer; a: ptr doublecomplex; lda: var integer;                work: ptr doublereal): doublereal {.importc: "zlantr_".}
  
  proc clapack_zlapll*(n: var integer; x: ptr doublecomplex; incx: var integer;                y: ptr doublecomplex; incy: var integer; ssmin: ptr doublereal): cint {.importc: "zlapll_".}
  
  proc clapack_zlapmt*(forwrd: ptr logical; m: var integer; n: var integer;                x: ptr doublecomplex; ldx: var integer; k: var integer): cint {.importc: "zlapmt_".}
  
  proc clapack_zlaqgb*(m: var integer; n: var integer; kl: var integer;                ku: var integer; ab: ptr doublecomplex; ldab: var integer;                r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqgb_".}
  
  proc clapack_zlaqge*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; r: ptr doublereal; c: ptr doublereal;                rowcnd: ptr doublereal; colcnd: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqge_".}
  
  proc clapack_zlaqhb*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; s: ptr doublereal;                scond: ptr doublereal; amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqhb_".}
  
  proc clapack_zlaqhe*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; s: ptr doublereal; scond: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqhe_".}
  
  proc clapack_zlaqhp*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                equed: var cstring): cint {.importc: "zlaqhp_".}
  
  proc clapack_zlaqp2*(m: var integer; n: var integer; offset: var integer;                a: ptr doublecomplex; lda: var integer; jpvt: var integer;                tau: ptr doublecomplex; vn1: ptr doublereal;                vn2: ptr doublereal; work: ptr doublecomplex): cint {.importc: "zlaqp2_".}
  
  proc clapack_zlaqps*(m: var integer; n: var integer; offset: var integer;                nb: var integer; kb: var integer; a: ptr doublecomplex;                lda: var integer; jpvt: var integer; tau: ptr doublecomplex;                vn1: ptr doublereal; vn2: ptr doublereal;                auxv: ptr doublecomplex; f: ptr doublecomplex; ldf: var integer): cint {.importc: "zlaqps_".}
  
  proc clapack_zlaqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublecomplex;                ldh: var integer; w: ptr doublecomplex; iloz: var integer;                ihiz: var integer; z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zlaqr0_".}
  
  proc clapack_zlaqr1*(n: var integer; h: ptr doublecomplex; ldh: var integer;                s1: ptr doublecomplex; s2: ptr doublecomplex;                v: ptr doublecomplex): cint {.importc: "zlaqr1_".}
  
  proc clapack_zlaqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr doublecomplex; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr doublecomplex; ldz: var integer;                ns: var integer; nd: var integer; sh: ptr doublecomplex;                v: ptr doublecomplex; ldv: var integer; nh: var integer;                t: ptr doublecomplex; ldt: var integer; nv: var integer;                wv: ptr doublecomplex; ldwv: var integer;                work: ptr doublecomplex; lwork: var integer): cint {.importc: "zlaqr2_".}
  
  proc clapack_zlaqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ktop: var integer; kbot: var integer; nw: var integer;                h: ptr doublecomplex; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr doublecomplex; ldz: var integer;                ns: var integer; nd: var integer; sh: ptr doublecomplex;                v: ptr doublecomplex; ldv: var integer; nh: var integer;                t: ptr doublecomplex; ldt: var integer; nv: var integer;                wv: ptr doublecomplex; ldwv: var integer;                work: ptr doublecomplex; lwork: var integer): cint {.importc: "zlaqr3_".}
  
  proc clapack_zlaqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;                ilo: var integer; ihi: var integer; h: ptr doublecomplex;                ldh: var integer; w: ptr doublecomplex; iloz: var integer;                ihiz: var integer; z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zlaqr4_".}
  
  proc clapack_zlaqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;                n: var integer; ktop: var integer; kbot: var integer;                nshfts: var integer; s: ptr doublecomplex;                h: ptr doublecomplex; ldh: var integer; iloz: var integer;                ihiz: var integer; z: ptr doublecomplex; ldz: var integer;                v: ptr doublecomplex; ldv: var integer; u: ptr doublecomplex;                ldu: var integer; nv: var integer; wv: ptr doublecomplex;                ldwv: var integer; nh: var integer; wh: ptr doublecomplex;                ldwh: var integer): cint {.importc: "zlaqr5_".}
  
  proc clapack_zlaqsb*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; s: ptr doublereal;                scond: ptr doublereal; amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqsb_".}
  
  proc clapack_zlaqsp*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                equed: var cstring): cint {.importc: "zlaqsp_".}
  
  proc clapack_zlaqsy*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; s: ptr doublereal; scond: ptr doublereal;                amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqsy_".}
  
  proc clapack_zlar1v*(n: var integer; b1: var integer; bn: var integer;                lambdas: ptr doublereal; d: ptr doublereal; l: ptr doublereal;                ld: ptr doublereal; lld: ptr doublereal; pivmin: ptr doublereal;                gaptol: ptr doublereal; z: ptr doublecomplex;                wantnc: ptr logical; negcnt: var integer; ztz: ptr doublereal;                mingma: ptr doublereal; r: var integer; isuppz: var integer;                nrminv: ptr doublereal; resid: ptr doublereal;                rqcorr: ptr doublereal; work: ptr doublereal): cint {.importc: "zlar1v_".}
  
  proc clapack_zlar2v*(n: var integer; x: ptr doublecomplex; y: ptr doublecomplex;                z: ptr doublecomplex; incx: var integer; c: ptr doublereal;                s: ptr doublecomplex; incc: var integer): cint {.importc: "zlar2v_".}
  
  proc clapack_zlarcm*(m: var integer; n: var integer; a: ptr doublereal;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                c: ptr doublecomplex; ldc: var integer; rwork: ptr doublereal): cint {.importc: "zlarcm_".}
  
  proc clapack_zlarf*(side: var cstring; m: var integer; n: var integer;               v: ptr doublecomplex; incv: var integer; tau: ptr doublecomplex;               c: ptr doublecomplex; ldc: var integer; work: ptr doublecomplex): cint {.importc: "zlarf_".}
  
  proc clapack_zlarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer;                v: ptr doublecomplex; ldv: var integer; t: ptr doublecomplex;                ldt: var integer; c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; ldwork: var integer): cint {.importc: "zlarfb_".}
  
  proc clapack_zlarfg*(n: var integer; alpha: ptr doublecomplex; x: ptr doublecomplex;                incx: var integer; tau: ptr doublecomplex): cint {.importc: "zlarfg_".}
  
  proc clapack_zlarfp*(n: var integer; alpha: ptr doublecomplex; x: ptr doublecomplex;                incx: var integer; tau: ptr doublecomplex): cint {.importc: "zlarfp_".}
  
  proc clapack_zlarft*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr doublecomplex; ldv: var integer;                tau: ptr doublecomplex; t: ptr doublecomplex; ldt: var integer): cint {.importc: "zlarft_".}
  
  proc clapack_zlarfx*(side: var cstring; m: var integer; n: var integer;                v: ptr doublecomplex; tau: ptr doublecomplex;                c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex): cint {.importc: "zlarfx_".}
  
  proc clapack_zlargv*(n: var integer; x: ptr doublecomplex; incx: var integer;                y: ptr doublecomplex; incy: var integer; c: ptr doublereal;                incc: var integer): cint {.importc: "zlargv_".}
  
  proc clapack_zlarnv*(idist: var integer; iseed: var integer; n: var integer;                x: ptr doublecomplex): cint {.importc: "zlarnv_".}
  
  proc clapack_zlarrv*(n: var integer; vl: ptr doublereal; vu: ptr doublereal;                d: ptr doublereal; l: ptr doublereal; pivmin: ptr doublereal;                isplit: var integer; m: var integer; dol: var integer;                dou: var integer; minrgp: ptr doublereal; rtol1: ptr doublereal;                rtol2: ptr doublereal; w: ptr doublereal; werr: ptr doublereal;                wgap: ptr doublereal; iblock: var integer; indexw: var integer;                gers: ptr doublereal; z: ptr doublecomplex; ldz: var integer;                isuppz: var integer; work: ptr doublereal; iwork: var integer;                info: var integer): cint {.importc: "zlarrv_".}
  
  proc clapack_zlarscl2*(m: var integer; n: var integer; d: ptr doublereal;                  x: ptr doublecomplex; ldx: var integer): cint {.importc: "zlarscl2_".}
  
  proc clapack_zlartg*(f: ptr doublecomplex; g: ptr doublecomplex; cs: ptr doublereal;                sn: ptr doublecomplex; r: ptr doublecomplex): cint {.importc: "zlartg_".}
  
  proc clapack_zlartv*(n: var integer; x: ptr doublecomplex; incx: var integer;                y: ptr doublecomplex; incy: var integer; c: ptr doublereal;                s: ptr doublecomplex; incc: var integer): cint {.importc: "zlartv_".}
  
  proc clapack_zlarz*(side: var cstring; m: var integer; n: var integer; l: var integer;               v: ptr doublecomplex; incv: var integer; tau: ptr doublecomplex;               c: ptr doublecomplex; ldc: var integer; work: ptr doublecomplex): cint {.importc: "zlarz_".}
  
  proc clapack_zlarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;                m: var integer; n: var integer; k: var integer; l: var integer;                v: ptr doublecomplex; ldv: var integer; t: ptr doublecomplex;                ldt: var integer; c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; ldwork: var integer): cint {.importc: "zlarzb_".}
  
  proc clapack_zlarzt*(direct: var cstring; storev: var cstring; n: var integer;                k: var integer; v: ptr doublecomplex; ldv: var integer;                tau: ptr doublecomplex; t: ptr doublecomplex; ldt: var integer): cint {.importc: "zlarzt_".}
  
  proc clapack_zlascl*(mtype: var cstring; kl: var integer; ku: var integer;                cfrom: ptr doublereal; cto: ptr doublereal; m: var integer;                n: var integer; a: ptr doublecomplex; lda: var integer;                info: var integer): cint {.importc: "zlascl_".}
  
  proc clapack_zlascl2*(m: var integer; n: var integer; d: ptr doublereal;                 x: ptr doublecomplex; ldx: var integer): cint {.importc: "zlascl2_".}
  
  proc clapack_zlaset*(uplo: var cstring; m: var integer; n: var integer;                alpha: ptr doublecomplex; beta: ptr doublecomplex;                a: ptr doublecomplex; lda: var integer): cint {.importc: "zlaset_".}
  
  proc clapack_zlasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;               n: var integer; c: ptr doublereal; s: ptr doublereal;               a: ptr doublecomplex; lda: var integer): cint {.importc: "zlasr_".}
  
  proc clapack_zlassq*(n: var integer; x: ptr doublecomplex; incx: var integer;                scale: ptr doublereal; sumsq: ptr doublereal): cint {.importc: "zlassq_".}
  
  proc clapack_zlaswp*(n: var integer; a: ptr doublecomplex; lda: var integer;                k1: var integer; k2: var integer; ipiv: var cint;                incx: var integer): cint {.importc: "zlaswp_".}
  
  proc clapack_zlasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;                a: ptr doublecomplex; lda: var integer; ipiv: var cint;                w: ptr doublecomplex; ldw: var integer; info: var integer): cint {.importc: "zlasyf_".}
  
  proc clapack_zlat2c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; sa: ptr complex; ldsa: var integer;                info: var integer): cint {.importc: "zlat2c_".}
  
  proc clapack_zlatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; kd: var integer; ab: ptr doublecomplex;                ldab: var integer; x: ptr doublecomplex; scale: ptr doublereal;                cnorm: ptr doublereal; info: var integer): cint {.importc: "zlatbs_".}
  
  proc clapack_zlatdf*(ijob: var integer; n: var integer; z: ptr doublecomplex;                ldz: var integer; rhs: ptr doublecomplex; rdsum: ptr doublereal;                rdscal: ptr doublereal; ipiv: var cint; jpiv: var cint): cint {.importc: "zlatdf_".}
  
  proc clapack_zlatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; ap: ptr doublecomplex; x: ptr doublecomplex;                scale: ptr doublereal; cnorm: ptr doublereal; info: var integer): cint {.importc: "zlatps_".}
  
  proc clapack_zlatrd*(uplo: var cstring; n: var integer; nb: var integer;                a: ptr doublecomplex; lda: var integer; e: ptr doublereal;                tau: ptr doublecomplex; w: ptr doublecomplex; ldw: var integer): cint {.importc: "zlatrd_".}
  
  proc clapack_zlatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;                n: var integer; a: ptr doublecomplex; lda: var integer;                x: ptr doublecomplex; scale: ptr doublereal;                cnorm: ptr doublereal; info: var integer): cint {.importc: "zlatrs_".}
  
  proc clapack_zlatrz*(m: var integer; n: var integer; l: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex): cint {.importc: "zlatrz_".}
  
  proc clapack_zlatzm*(side: var cstring; m: var integer; n: var integer;                v: ptr doublecomplex; incv: var integer; tau: ptr doublecomplex;                c1: ptr doublecomplex; c2: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex): cint {.importc: "zlatzm_".}
  
  proc clapack_zlauu2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; info: var integer): cint {.importc: "zlauu2_".}
  
  proc clapack_zlauum*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; info: var integer): cint {.importc: "zlauum_".}
  
  proc clapack_zpbcon*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; anorm: ptr doublereal;                rcond: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zpbcon_".}
  
  proc clapack_zpbequ*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; s: ptr doublereal;                scond: ptr doublereal; amax: ptr doublereal; info: var integer): cint {.importc: "zpbequ_".}
  
  proc clapack_zpbrfs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;                afb: ptr doublecomplex; ldafb: var integer;                b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zpbrfs_".}
  
  proc clapack_zpbstf*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; info: var integer): cint {.importc: "zpbstf_".}
  
  proc clapack_zpbsv*(uplo: var cstring; n: var integer; kd: var integer;               nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;               b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zpbsv_".}
  
  proc clapack_zpbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;                afb: ptr doublecomplex; ldafb: var integer; equed: var cstring;                s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zpbsvx_".}
  
  proc clapack_zpbtf2*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; info: var integer): cint {.importc: "zpbtf2_".}
  
  proc clapack_zpbtrf*(uplo: var cstring; n: var integer; kd: var integer;                ab: ptr doublecomplex; ldab: var integer; info: var integer): cint {.importc: "zpbtrf_".}
  
  proc clapack_zpbtrs*(uplo: var cstring; n: var integer; kd: var integer;                nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;                b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zpbtrs_".}
  
  proc clapack_zpftrf*(transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; info: var integer): cint {.importc: "zpftrf_".}
  
  proc clapack_zpftri*(transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; info: var integer): cint {.importc: "zpftri_".}
  
  proc clapack_zpftrs*(transr: var cstring; uplo: var cstring; n: var integer;                nrhs: var integer; a: ptr doublecomplex; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zpftrs_".}
  
  proc clapack_zpocon*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zpocon_".}
  
  proc clapack_zpoequ*(n: var integer; a: ptr doublecomplex; lda: var integer;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                info: var integer): cint {.importc: "zpoequ_".}
  
  proc clapack_zpoequb*(n: var integer; a: ptr doublecomplex; lda: var integer;                 s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                 info: var integer): cint {.importc: "zpoequb_".}
  
  proc clapack_zporfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zporfs_".}
  
  proc clapack_zporfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; s: ptr doublereal;                 b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                 ldx: var integer; rcond: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zporfsx_".}
  
  proc clapack_zposv*(uplo: var cstring; n: var integer; nrhs: var integer;               a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;               ldb: var integer; info: var integer): cint {.importc: "zposv_".}
  
  proc clapack_zposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; equed: var cstring; s: ptr doublereal;                b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zposvx_".}
  
  proc clapack_zposvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; equed: var cstring;                 s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                 x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                 rpvgrw: ptr doublereal; berr: ptr doublereal;                 n_err_bnds: var integer; err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zposvxx_".}
  
  proc clapack_zpotf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; info: var integer): cint {.importc: "zpotf2_".}
  
  proc clapack_zpotrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; info: var integer): cint {.importc: "zpotrf_".}
  
  proc clapack_zpotri*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; info: var integer): cint {.importc: "zpotri_".}
  
  proc clapack_zpotrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zpotrs_".}
  
  proc clapack_zppcon*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zppcon_".}
  
  proc clapack_zppequ*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;                info: var integer): cint {.importc: "zppequ_".}
  
  proc clapack_zpprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; afp: ptr doublecomplex;                b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zpprfs_".}
  
  proc clapack_zppsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;               info: var integer): cint {.importc: "zppsv_".}
  
  proc clapack_zppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; afp: ptr doublecomplex; equed: var cstring;                s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zppsvx_".}
  
  proc clapack_zpptrf*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                info: var integer): cint {.importc: "zpptrf_".}
  
  proc clapack_zpptri*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                info: var integer): cint {.importc: "zpptri_".}
  
  proc clapack_zpptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;                info: var integer): cint {.importc: "zpptrs_".}
  
  proc clapack_zpstf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; piv: var integer; rank: var integer;                tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "zpstf2_".}
  
  proc clapack_zpstrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; piv: var integer; rank: var integer;                tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "zpstrf_".}
  
  proc clapack_zptcon*(n: var integer; d: ptr doublereal; e: ptr doublecomplex;                anorm: ptr doublereal; rcond: ptr doublereal;                rwork: ptr doublereal; info: var integer): cint {.importc: "zptcon_".}
  
  proc clapack_zpteqr*(compz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublecomplex; ldz: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "zpteqr_".}
  
  proc clapack_zptrfs*(uplo: var cstring; n: var integer; nrhs: var integer;                d: ptr doublereal; e: ptr doublecomplex; df: ptr doublereal;                ef: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zptrfs_".}
  
  proc clapack_zptsv*(n: var integer; nrhs: var integer; d: ptr doublereal;               e: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;               info: var integer): cint {.importc: "zptsv_".}
  
  proc clapack_zptsvx*(fact: var cstring; n: var integer; nrhs: var integer;                d: ptr doublereal; e: ptr doublecomplex; df: ptr doublereal;                ef: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zptsvx_".}
  
  proc clapack_zpttrf*(n: var integer; d: ptr doublereal; e: ptr doublecomplex;                info: var integer): cint {.importc: "zpttrf_".}
  
  proc clapack_zpttrs*(uplo: var cstring; n: var integer; nrhs: var integer;                d: ptr doublereal; e: ptr doublecomplex; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zpttrs_".}
  
  proc clapack_zptts2*(iuplo: var integer; n: var integer; nrhs: var integer;                d: ptr doublereal; e: ptr doublecomplex; b: ptr doublecomplex;                ldb: var integer): cint {.importc: "zptts2_".}
  
  proc clapack_zrot*(n: var integer; cx: ptr doublecomplex; incx: var integer;              cy: ptr doublecomplex; incy: var integer; c: ptr doublereal;              s: ptr doublecomplex): cint {.importc: "zrot_".}
  
  proc clapack_zspcon*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;                work: ptr doublecomplex; info: var integer): cint {.importc: "zspcon_".}
  
  proc clapack_zspmv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;               ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer;               beta: ptr doublecomplex; y: ptr doublecomplex; incy: var integer): cint {.importc: "zspmv_".}
  
  proc clapack_zspr*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;              x: ptr doublecomplex; incx: var integer; ap: ptr doublecomplex): cint {.importc: "zspr_".}
  
  proc clapack_zsprfs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; afp: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "zsprfs_".}
  
  proc clapack_zspsv*(uplo: var cstring; n: var integer; nrhs: var integer;               ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;               ldb: var integer; info: var integer): cint {.importc: "zspsv_".}
  
  proc clapack_zspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; afp: ptr doublecomplex;                ipiv: var cint; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zspsvx_".}
  
  proc clapack_zsptrf*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                ipiv: var cint; info: var integer): cint {.importc: "zsptrf_".}
  
  proc clapack_zsptri*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                ipiv: var cint; work: ptr doublecomplex; info: var integer): cint {.importc: "zsptri_".}
  
  proc clapack_zsptrs*(uplo: var cstring; n: var integer; nrhs: var integer;                ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "zsptrs_".}
  
  proc clapack_zstedc*(compz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublecomplex; ldz: var integer;                work: ptr doublecomplex; lwork: var integer;                rwork: ptr doublereal; lrwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zstedc_".}
  
  proc clapack_zstegr*(jobz: var cstring; range: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                abstol: ptr doublereal; m: var integer; w: ptr doublereal;                z: ptr doublecomplex; ldz: var integer; isuppz: var integer;                work: ptr doublereal; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "zstegr_".}
  
  proc clapack_zstein*(n: var integer; d: ptr doublereal; e: ptr doublereal;                m: var integer; w: ptr doublereal; iblock: var integer;                isplit: var integer; z: ptr doublecomplex; ldz: var integer;                work: ptr doublereal; iwork: var integer; ifail: var integer;                info: var integer): cint {.importc: "zstein_".}
  
  proc clapack_zstemr*(jobz: var cstring; range: var cstring; n: var integer;                d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;                vu: ptr doublereal; il: var integer; iu: var integer;                m: var integer; w: ptr doublereal; z: ptr doublecomplex;                ldz: var integer; nzc: var integer; isuppz: var integer;                tryrac: ptr logical; work: ptr doublereal; lwork: var integer;                iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "zstemr_".}
  
  proc clapack_zsteqr*(compz: var cstring; n: var integer; d: ptr doublereal;                e: ptr doublereal; z: ptr doublecomplex; ldz: var integer;                work: ptr doublereal; info: var integer): cint {.importc: "zsteqr_".}
  
  proc clapack_zsycon*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; anorm: ptr doublereal;                rcond: ptr doublereal; work: ptr doublecomplex;                info: var integer): cint {.importc: "zsycon_".}
  
  proc clapack_zsyequb*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                 lda: var integer; s: ptr doublereal; scond: ptr doublereal;                 amax: ptr doublereal; work: ptr doublecomplex;                 info: var integer): cint {.importc: "zsyequb_".}
  
  proc clapack_zsymv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;               a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;               incx: var integer; beta: ptr doublecomplex; y: ptr doublecomplex;               incy: var integer): cint {.importc: "zsymv_".}
  
  proc clapack_zsyr*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;              x: ptr doublecomplex; incx: var integer; a: ptr doublecomplex;              lda: var integer): cint {.importc: "zsyr_".}
  
  proc clapack_zsyrfs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "zsyrfs_".}
  
  proc clapack_zsyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                 s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;                 x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zsyrfsx_".}
  
  proc clapack_zsysv*(uplo: var cstring; n: var integer; nrhs: var integer;               a: ptr doublecomplex; lda: var integer; ipiv: var cint;               b: ptr doublecomplex; ldb: var integer; work: ptr doublecomplex;               lwork: var integer; info: var integer): cint {.importc: "zsysv_".}
  
  proc clapack_zsysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;                ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                rcond: ptr doublereal; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                lwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zsysvx_".}
  
  proc clapack_zsysvxx*(fact: var cstring; uplo: var cstring; n: var integer;                 nrhs: var integer; a: ptr doublecomplex; lda: var integer;                 af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;                 equed: var cstring; s: ptr doublereal; b: ptr doublecomplex;                 ldb: var integer; x: ptr doublecomplex; ldx: var integer;                 rcond: ptr doublereal; rpvgrw: ptr doublereal;                 berr: ptr doublereal; n_err_bnds: var integer;                 err_bnds_norm: ptr doublereal;                 err_bnds_comp: ptr doublereal; nparams: var integer;                 params: ptr doublereal; work: ptr doublecomplex;                 rwork: ptr doublereal; info: var integer): cint {.importc: "zsysvxx_".}
  
  proc clapack_zsytf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zsytf2_".}
  
  proc clapack_zsytrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; work: ptr doublecomplex;                lwork: var integer; info: var integer): cint {.importc: "zsytrf_".}
  
  proc clapack_zsytri*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ipiv: var cint; work: ptr doublecomplex;                info: var integer): cint {.importc: "zsytri_".}
  
  proc clapack_zsytrs*(uplo: var cstring; n: var integer; nrhs: var integer;                a: ptr doublecomplex; lda: var integer; ipiv: var cint;                b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zsytrs_".}
  
  proc clapack_ztbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                kd: var integer; ab: ptr doublecomplex; ldab: var integer;                rcond: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "ztbcon_".}
  
  proc clapack_ztbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr doublecomplex;                ldab: var integer; b: ptr doublecomplex; ldb: var integer;                x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;                berr: ptr doublereal; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "ztbrfs_".}
  
  proc clapack_ztbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                kd: var integer; nrhs: var integer; ab: ptr doublecomplex;                ldab: var integer; b: ptr doublecomplex; ldb: var integer;                info: var integer): cint {.importc: "ztbtrs_".}
  
  proc clapack_ztfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;               diag: var cstring; m: var integer; n: var integer;               alpha: ptr doublecomplex; a: ptr doublecomplex;               b: ptr doublecomplex; ldb: var integer): cint {.importc: "ztfsm_".}
  
  proc clapack_ztftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr doublecomplex; info: var integer): cint {.importc: "ztftri_".}
  
  proc clapack_ztfttp*(transr: var cstring; uplo: var cstring; n: var integer;                arf: ptr doublecomplex; ap: ptr doublecomplex; info: var integer): cint {.importc: "ztfttp_".}
  
  proc clapack_ztfttr*(transr: var cstring; uplo: var cstring; n: var integer;                arf: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;                info: var integer): cint {.importc: "ztfttr_".}
  
  proc clapack_ztgevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; s: ptr doublecomplex; lds: var integer;                p: ptr doublecomplex; ldp: var integer; vl: ptr doublecomplex;                ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;                mm: var integer; m: var integer; work: ptr doublecomplex;                rwork: ptr doublereal; info: var integer): cint {.importc: "ztgevc_".}
  
  proc clapack_ztgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; q: ptr doublecomplex; ldq: var integer;                z: ptr doublecomplex; ldz: var integer; j1: var integer;                info: var integer): cint {.importc: "ztgex2_".}
  
  proc clapack_ztgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; q: ptr doublecomplex; ldq: var integer;                z: ptr doublecomplex; ldz: var integer; ifst: var integer;                ilst: var integer; info: var integer): cint {.importc: "ztgexc_".}
  
  proc clapack_ztgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;                select: ptr logical; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                alpha: ptr doublecomplex; beta: ptr doublecomplex;                q: ptr doublecomplex; ldq: var integer; z: ptr doublecomplex;                ldz: var integer; m: var integer; pl: ptr doublereal;                pr: ptr doublereal; dif: ptr doublereal;                work: ptr doublecomplex; lwork: var integer; iwork: var integer;                liwork: var integer; info: var integer): cint {.importc: "ztgsen_".}
  
  proc clapack_ztgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;                p: var integer; n: var integer; k: var integer; l: var integer;                a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;                ldb: var integer; tola: ptr doublereal; tolb: ptr doublereal;                alpha: ptr doublereal; beta: ptr doublereal;                u: ptr doublecomplex; ldu: var integer; v: ptr doublecomplex;                ldv: var integer; q: ptr doublecomplex; ldq: var integer;                work: ptr doublecomplex; ncycle: var integer; info: var integer): cint {.importc: "ztgsja_".}
  
  proc clapack_ztgsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer; vl: ptr doublecomplex;                ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;                s: ptr doublereal; dif: ptr doublereal; mm: var integer;                m: var integer; work: ptr doublecomplex; lwork: var integer;                iwork: var integer; info: var integer): cint {.importc: "ztgsna_".}
  
  proc clapack_ztgsy2*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer; c: ptr doublecomplex;                ldc: var integer; d: ptr doublecomplex; ldd: var integer;                e: ptr doublecomplex; lde: var integer; f: ptr doublecomplex;                ldf: var integer; scale: ptr doublereal; rdsum: ptr doublereal;                rdscal: ptr doublereal; info: var integer): cint {.importc: "ztgsy2_".}
  
  proc clapack_ztgsyl*(trans: var cstring; ijob: var integer; m: var integer;                n: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer; c: ptr doublecomplex;                ldc: var integer; d: ptr doublecomplex; ldd: var integer;                e: ptr doublecomplex; lde: var integer; f: ptr doublecomplex;                ldf: var integer; scale: ptr doublereal; dif: ptr doublereal;                work: ptr doublecomplex; lwork: var integer; iwork: var integer;                info: var integer): cint {.importc: "ztgsyl_".}
  
  proc clapack_ztpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr doublecomplex; rcond: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "ztpcon_".}
  
  proc clapack_ztprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr doublecomplex; b: ptr doublecomplex;                ldb: var integer; x: ptr doublecomplex; ldx: var integer;                ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "ztprfs_".}
  
  proc clapack_ztptri*(uplo: var cstring; diag: var cstring; n: var integer;                ap: ptr doublecomplex; info: var integer): cint {.importc: "ztptri_".}
  
  proc clapack_ztptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; ap: ptr doublecomplex; b: ptr doublecomplex;                ldb: var integer; info: var integer): cint {.importc: "ztptrs_".}
  
  proc clapack_ztpttf*(transr: var cstring; uplo: var cstring; n: var integer;                ap: ptr doublecomplex; arf: ptr doublecomplex; info: var integer): cint {.importc: "ztpttf_".}
  
  proc clapack_ztpttr*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                a: ptr doublecomplex; lda: var integer; info: var integer): cint {.importc: "ztpttr_".}
  
  proc clapack_ztrcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; rcond: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "ztrcon_".}
  
  proc clapack_ztrevc*(side: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr doublecomplex; ldt: var integer;                vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;                ldvr: var integer; mm: var integer; m: var integer;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "ztrevc_".}
  
  proc clapack_ztrexc*(compq: var cstring; n: var integer; t: ptr doublecomplex;                ldt: var integer; q: ptr doublecomplex; ldq: var integer;                ifst: var integer; ilst: var integer; info: var integer): cint {.importc: "ztrexc_".}
  
  proc clapack_ztrrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;                ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;                work: ptr doublecomplex; rwork: ptr doublereal;                info: var integer): cint {.importc: "ztrrfs_".}
  
  proc clapack_ztrsen*(job: var cstring; compq: var cstring; select: ptr logical;                n: var integer; t: ptr doublecomplex; ldt: var integer;                q: ptr doublecomplex; ldq: var integer; w: ptr doublecomplex;                m: var integer; s: ptr doublereal; sep: ptr doublereal;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "ztrsen_".}
  
  proc clapack_ztrsna*(job: var cstring; howmny: var cstring; select: ptr logical;                n: var integer; t: ptr doublecomplex; ldt: var integer;                vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;                ldvr: var integer; s: ptr doublereal; sep: ptr doublereal;                mm: var integer; m: var integer; work: ptr doublecomplex;                ldwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "ztrsna_".}
  
  proc clapack_ztrsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;                m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; b: ptr doublecomplex; ldb: var integer;                c: ptr doublecomplex; ldc: var integer; scale: ptr doublereal;                info: var integer): cint {.importc: "ztrsyl_".}
  
  proc clapack_ztrti2*(uplo: var cstring; diag: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; info: var integer): cint {.importc: "ztrti2_".}
  
  proc clapack_ztrtri*(uplo: var cstring; diag: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; info: var integer): cint {.importc: "ztrtri_".}
  
  proc clapack_ztrtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;                nrhs: var integer; a: ptr doublecomplex; lda: var integer;                b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "ztrtrs_".}
  
  proc clapack_ztrttf*(transr: var cstring; uplo: var cstring; n: var integer;                a: ptr doublecomplex; lda: var integer; arf: ptr doublecomplex;                info: var integer): cint {.importc: "ztrttf_".}
  
  proc clapack_ztrttp*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; ap: ptr doublecomplex; info: var integer): cint {.importc: "ztrttp_".}
  
  proc clapack_ztzrqf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex; info: var integer): cint {.importc: "ztzrqf_".}
  
  proc clapack_ztzrzf*(m: var integer; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "ztzrzf_".}
  
  proc clapack_zung2l*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zung2l_".}
  
  proc clapack_zung2r*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zung2r_".}
  
  proc clapack_zungbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungbr_".}
  
  proc clapack_zunghr*(n: var integer; ilo: var integer; ihi: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunghr_".}
  
  proc clapack_zungl2*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zungl2_".}
  
  proc clapack_zunglq*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunglq_".}
  
  proc clapack_zungql*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungql_".}
  
  proc clapack_zungqr*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungqr_".}
  
  proc clapack_zungr2*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; info: var integer): cint {.importc: "zungr2_".}
  
  proc clapack_zungrq*(m: var integer; n: var integer; k: var integer;                a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungrq_".}
  
  proc clapack_zungtr*(uplo: var cstring; n: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungtr_".}
  
  proc clapack_zunm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunm2l_".}
  
  proc clapack_zunm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunm2r_".}
  
  proc clapack_zunmbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;                n: var integer; k: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunmbr_".}
  
  proc clapack_zunmhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                ilo: var integer; ihi: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunmhr_".}
  
  proc clapack_zunml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunml2_".}
  
  proc clapack_zunmlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; lwork: var integer;                info: var integer): cint {.importc: "zunmlq_".}
  
  proc clapack_zunmql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; lwork: var integer;                info: var integer): cint {.importc: "zunmql_".}
  
  proc clapack_zunmqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; lwork: var integer;                info: var integer): cint {.importc: "zunmqr_".}
  
  proc clapack_zunmr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunmr2_".}
  
  proc clapack_zunmr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; info: var integer): cint {.importc: "zunmr3_".}
  
  proc clapack_zunmrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; lwork: var integer;                info: var integer): cint {.importc: "zunmrq_".}
  
  proc clapack_zunmrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;                k: var integer; l: var integer; a: ptr doublecomplex;                lda: var integer; tau: ptr doublecomplex;                c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunmrz_".}
  
  proc clapack_zunmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; a: ptr doublecomplex; lda: var integer;                tau: ptr doublecomplex; c: ptr doublecomplex;                ldc: var integer; work: ptr doublecomplex; lwork: var integer;                info: var integer): cint {.importc: "zunmtr_".}
  
  proc clapack_zupgtr*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;                tau: ptr doublecomplex; q: ptr doublecomplex; ldq: var integer;                work: ptr doublecomplex; info: var integer): cint {.importc: "zupgtr_".}
  
  proc clapack_zupmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;                n: var integer; ap: ptr doublecomplex; tau: ptr doublecomplex;                c: ptr doublecomplex; ldc: var integer;                work: ptr doublecomplex; info: var integer): cint {.importc: "zupmtr_".}
  
  #___________________________________________________________________________
  #
  # Real, double precision
  #___________________________________________________________________________

  proc clapack_dsecnd*(): doublereal {.importc: "dsecnd_".}
      
  proc clapack_second*(): doublereal {.importc: "second_".}

  proc clapack_slamch*(cmach: var cstring): doublereal {.importc: "slamch_".}
  
  proc clapack_slamc1*(beta: var integer; t: var integer; rnd: ptr logical;                ieee1: ptr logical): cint {.importc: "slamc1_".}
  
  proc clapack_slamc2*(beta: var integer; t: var integer; rnd: ptr logical;                eps: ptr real; emin: var integer; rmin: ptr real;                emax: var integer; rmax: ptr real): cint {.importc: "slamc2_".}

  proc clapack_slamc3*(a: ptr real; b: ptr real): doublereal {.importc: "slamc3_".}
  
  proc clapack_slamc4*(emin: var integer; start: ptr real; base: var integer): cint {.importc: "slamc4_".}
  
  proc clapack_slamc5*(beta: var integer; p: var integer; emin: var integer;                ieee: ptr logical; emax: var integer; rmax: ptr real): cint {.importc: "slamc5_".}

  proc clapack_dlamch*(cmach: var cstring): doublereal {.importc: "dlamch_".}
  
  proc clapack_dlamc1*(beta: var integer; t: var integer; rnd: ptr logical;                ieee1: ptr logical): cint {.importc: "dlamc1_".}
  
  proc clapack_dlamc2*(beta: var integer; t: var integer; rnd: ptr logical;                eps: ptr doublereal; emin: var integer; rmin: ptr doublereal;                emax: var integer; rmax: ptr doublereal): cint {.importc: "dlamc2_".}

  proc clapack_dlamc3*(a: ptr doublereal; b: ptr doublereal): doublereal {.importc: "dlamc3_".}
  
  proc clapack_dlamc4*(emin: var integer; start: ptr doublereal; base: var integer): cint {.importc: "dlamc4_".}
  
  proc clapack_dlamc5*(beta: var integer; p: var integer; emin: var integer;                ieee: ptr logical; emax: var integer; rmax: ptr doublereal): cint {.importc: "dlamc5_".}

  {.pop.}