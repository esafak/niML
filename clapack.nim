#_____________________________________________________________________________
#
# Manually patched after conversion from clapack.h 3.2.1 by c2nim 0.9.4
#
# Emre Safak (c) 2014
#
# When hunting bugs please refer to the source, clapack.h
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

  proc box*[T] (val: T): ref T =
    new result
    result[] = val

  # We use this reference approach, suggested by nimrod developers in IRC,
  # to avoid a type mismatch problem related to array constructors
  converter toFArray*[I, T] (x: ref array[I, T]): PArray[T] = cast[PArray[T]](x)

  # used to cast arrays to their base pointers for C procedures
  template `&:`*(x: expr): expr = cast[ptr type(x[0])](addr x)

  # macro toInteger*[T](args: tuple[T]): tuple[args: integer] = 
  #   for x in args: result[x] = cast[integer](x)

  {.push nodecl.}  

  #___________________________________________________________________________
  #
  # Complex, single precision
  #___________________________________________________________________________

  proc caxpy*(n: var integer; ca: ptr complex; cx: ptr complex;
    incx: var integer; cy: ptr complex; incy: var integer): cint {.importc: "caxpy_".}
  
  proc ccopy*(n: var integer; cx: ptr complex; incx: var integer;
    cy: ptr complex; incy: var integer): cint {.importc: "ccopy_".}
  
  proc cdotc*(ret_val: ptr complex; n: var integer; cx: ptr complex;
    incx: var integer; cy: ptr complex; incy: var integer): VOID {.importc: "cdotc_".}
  
  proc cdotu*(ret_val: ptr complex; n: var integer; cx: ptr complex;
    incx: var integer; cy: ptr complex; incy: var integer): VOID {.importc: "cdotu_".}
  
  proc cgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;
    ku: var integer; alpha: ptr complex; a: ptr complex;
    lda: var integer; x: ptr complex; incx: var integer;
    beta: ptr complex; y: ptr complex; incy: var integer): cint {.importc: "cgbmv_".}
  
  proc cgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;
    k: var integer; alpha: ptr complex; a: ptr complex;
    lda: var integer; b: ptr complex; ldb: var integer;
    beta: ptr complex; c: ptr complex; ldc: var integer): cint {.importc: "cgemm_".}
  
  proc cgemv*(trans: var cstring; m: var integer; n: var integer;
    alpha: ptr complex; a: ptr complex; lda: var integer;
    x: ptr complex; incx: var integer; beta: ptr complex;
    y: ptr complex; incy: var integer): cint {.importc: "cgemv_".}
  
  proc cgerc*(m: var integer; n: var integer; alpha: ptr complex;
    x: ptr complex; incx: var integer; y: ptr complex;
    incy: var integer; a: ptr complex; lda: var integer): cint {.importc: "cgerc_".}
  
  proc cgeru*(m: var integer; n: var integer; alpha: ptr complex;
    x: ptr complex; incx: var integer; y: ptr complex;
    incy: var integer; a: ptr complex; lda: var integer): cint {.importc: "cgeru_".}
  
  proc chbmv*(uplo: var cstring; n: var integer; k: var integer;
    alpha: ptr complex; a: ptr complex; lda: var integer;
    x: ptr complex; incx: var integer; beta: ptr complex;
    y: ptr complex; incy: var integer): cint {.importc: "chbmv_".}
  
  proc chemm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;
    alpha: ptr complex; a: ptr complex; lda: var integer;
    b: ptr complex; ldb: var integer; beta: ptr complex;
    c: ptr complex; ldc: var integer): cint {.importc: "chemm_".}
  
  proc chemv*(uplo: var cstring; n: var integer; alpha: ptr complex;
    a: ptr complex; lda: var integer; x: ptr complex;
    incx: var integer; beta: ptr complex; y: ptr complex;
    incy: var integer): cint {.importc: "chemv_".}
  
  proc cher*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr complex;              incx: var integer; a: ptr complex; lda: var integer): cint {.importc: "cher_".}
  
  proc cher2*(uplo: var cstring; n: var integer; alpha: ptr complex;
    x: ptr complex; incx: var integer; y: ptr complex;
    incy: var integer; a: ptr complex; lda: var integer): cint {.importc: "cher2_".}
  
  proc cher2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
     alpha: ptr complex; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; beta: ptr real;
     c: ptr complex; ldc: var integer): cint {.importc: "cher2k_".}
  
  proc cherk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
    alpha: ptr real; a: ptr complex; lda: var integer;
    beta: ptr real; c: ptr complex; ldc: var integer): cint {.importc: "cherk_".}
  
  proc chpmv*(uplo: var cstring; n: var integer; alpha: ptr complex;
    ap: ptr complex; x: ptr complex; incx: var integer;
    beta: ptr complex; y: ptr complex; incy: var integer): cint {.importc: "chpmv_".}
  
  proc chpr*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr complex;              incx: var integer; ap: ptr complex): cint {.importc: "chpr_".}
  
  proc chpr2*(uplo: var cstring; n: var integer; alpha: ptr complex;
    x: ptr complex; incx: var integer; y: ptr complex;
    incy: var integer; ap: ptr complex): cint {.importc: "chpr2_".}
  
  proc crotg*(ca: ptr complex; cb: ptr complex; c: ptr real; s: ptr complex): cint {.importc: "crotg_".}
  
  proc cscal*(n: var integer; ca: ptr complex; cx: ptr complex;
    incx: var integer): cint {.importc: "cscal_".}
  
  proc csrot*(n: var integer; cx: ptr complex; incx: var integer;
    cy: ptr complex; incy: var integer; c: ptr real; s: ptr real): cint {.importc: "csrot_".}
  
  proc csscal*(n: var integer; sa: ptr real; cx: ptr complex; incx: var integer): cint {.importc: "csscal_".}
  
  proc cswap*(n: var integer; cx: ptr complex; incx: var integer;
    cy: ptr complex; incy: var integer): cint {.importc: "cswap_".}
  
  proc csymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;
    alpha: ptr complex; a: ptr complex; lda: var integer;
    b: ptr complex; ldb: var integer; beta: ptr complex;
    c: ptr complex; ldc: var integer): cint {.importc: "csymm_".}
  
  proc csyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
     alpha: ptr complex; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; beta: ptr complex;
     c: ptr complex; ldc: var integer): cint {.importc: "csyr2k_".}
  
  proc csyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
    alpha: ptr complex; a: ptr complex; lda: var integer;
    beta: ptr complex; c: ptr complex; ldc: var integer): cint {.importc: "csyrk_".}
  
  proc ctbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr complex; lda: var integer; x: ptr complex;
    incx: var integer): cint {.importc: "ctbmv_".}
  
  proc ctbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr complex; lda: var integer; x: ptr complex;
    incx: var integer): cint {.importc: "ctbsv_".}
  
  proc ctpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr complex; x: ptr complex; incx: var integer): cint {.importc: "ctpmv_".}
  
  proc ctpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr complex; x: ptr complex; incx: var integer): cint {.importc: "ctpsv_".}
  
  proc ctrmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr complex;
    a: ptr complex; lda: var integer; b: ptr complex;
    ldb: var integer): cint {.importc: "ctrmm_".}
  
  proc ctrmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr complex; lda: var integer; x: ptr complex;
    incx: var integer): cint {.importc: "ctrmv_".}
  
  proc ctrsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr complex;
    a: ptr complex; lda: var integer; b: ptr complex;
    ldb: var integer): cint {.importc: "ctrsm_".}
  
  proc ctrsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr complex; lda: var integer; x: ptr complex;
    incx: var integer): cint {.importc: "ctrsv_".}

  #___________________________________________________________________________
  #
  # Real, double precision
  #___________________________________________________________________________

  proc dasum*(n: var integer; dx: ptr doublereal; incx: var integer): doublereal {.importc: "dasum_".}
  
  proc daxpy*(n: var integer; da: ptr doublereal; dx: ptr doublereal;
    incx: var integer; dy: ptr doublereal; incy: var integer): cint {.importc: "daxpy_".}
  proc dcabs1*(z: ptr doublecomplex): doublereal {.importc: "dcabs1_".}
  
  proc dcopy*(n: var integer; dx: ptr doublereal; incx: var integer;
    dy: ptr doublereal; incy: var integer): cint {.importc: "dcopy_".}
  proc ddot*(n: var integer; dx: ptr doublereal; incx: var integer;              dy: ptr doublereal; incy: var integer): doublereal {.importc: "ddot_".}
  
  proc dgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;
    ku: var integer; alpha: ptr doublereal; a: ptr doublereal;
    lda: var integer; x: ptr doublereal; incx: var integer;
    beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "dgbmv_".}
  
  proc dgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;
    k: var integer; alpha: ptr doublereal; a: ptr doublereal;
    lda: var integer; b: ptr doublereal; ldb: var integer;
    beta: ptr doublereal; c: ptr doublereal; ldc: var integer): cint {.importc: "dgemm_".}
  
  proc dgemv*(trans: var cstring; m: var integer; n: var integer;
    alpha: ptr doublereal; a: ptr doublereal; lda: var integer;
    x: ptr doublereal; incx: var integer; beta: ptr doublereal;
    y: ptr doublereal; incy: var integer): cint {.importc: "dgemv_".}
  
  proc dger*(m: var integer; n: var integer; alpha: ptr doublereal;              x: ptr doublereal; incx: var integer; y: ptr doublereal;              incy: var integer; a: ptr doublereal; lda: var integer): cint {.importc: "dger_".}
  proc dnrm2*(n: var integer; x: ptr doublereal; incx: var integer): doublereal {.importc: "dnrm2_".}
  
  proc drot*(n: var integer; dx: ptr doublereal; incx: var integer;              dy: ptr doublereal; incy: var integer; c: ptr doublereal;              s: ptr doublereal): cint {.importc: "drot_".}
  
  proc drotg*(da: ptr doublereal; db: ptr doublereal; c: ptr doublereal;
    s: ptr doublereal): cint {.importc: "drotg_".}
  
  proc drotm*(n: var integer; dx: ptr doublereal; incx: var integer;
    dy: ptr doublereal; incy: var integer; dparam: ptr doublereal): cint {.importc: "drotm_".}
  
  proc drotmg*(dd1: ptr doublereal; dd2: ptr doublereal; dx1: ptr doublereal;
     dy1: ptr doublereal; dparam: ptr doublereal): cint {.importc: "drotmg_".}
  
  proc dsbmv*(uplo: var cstring; n: var integer; k: var integer;
    alpha: ptr doublereal; a: ptr doublereal; lda: var integer;
    x: ptr doublereal; incx: var integer; beta: ptr doublereal;
    y: ptr doublereal; incy: var integer): cint {.importc: "dsbmv_".}
  
  proc dscal*(n: var integer; da: ptr doublereal; dx: ptr doublereal;
    incx: var integer): cint {.importc: "dscal_".}
  proc dsdot*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;
    incy: var integer): doublereal {.importc: "dsdot_".}
  
  proc dspmv*(uplo: var cstring; n: var integer; alpha: ptr doublereal;
    ap: ptr doublereal; x: ptr doublereal; incx: var integer;
    beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "dspmv_".}
  
  proc dspr*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublereal; incx: var integer; ap: ptr doublereal): cint {.importc: "dspr_".}
  
  proc dspr2*(uplo: var cstring; n: var integer; alpha: ptr doublereal;
    x: ptr doublereal; incx: var integer; y: ptr doublereal;
    incy: var integer; ap: ptr doublereal): cint {.importc: "dspr2_".}
  
  proc dswap*(n: var integer; dx: ptr doublereal; incx: var integer;
    dy: ptr doublereal; incy: var integer): cint {.importc: "dswap_".}
  
  proc dsymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;
    alpha: ptr doublereal; a: ptr doublereal; lda: var integer;
    b: ptr doublereal; ldb: var integer; beta: ptr doublereal;
    c: ptr doublereal; ldc: var integer): cint {.importc: "dsymm_".}
  
  proc dsymv*(uplo: var cstring; n: var integer; alpha: ptr doublereal;
    a: ptr doublereal; lda: var integer; x: ptr doublereal;
    incx: var integer; beta: ptr doublereal; y: ptr doublereal;
    incy: var integer): cint {.importc: "dsymv_".}
  
  proc dsyr*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublereal; incx: var integer; a: ptr doublereal;              lda: var integer): cint {.importc: "dsyr_".}
  
  proc dsyr2*(uplo: var cstring; n: var integer; alpha: ptr doublereal;
    x: ptr doublereal; incx: var integer; y: ptr doublereal;
    incy: var integer; a: ptr doublereal; lda: var integer): cint {.importc: "dsyr2_".}
  
  proc dsyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
     alpha: ptr doublereal; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; beta: ptr doublereal;
     c: ptr doublereal; ldc: var integer): cint {.importc: "dsyr2k_".}
  
  proc dsyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
    alpha: ptr doublereal; a: ptr doublereal; lda: var integer;
    beta: ptr doublereal; c: ptr doublereal; ldc: var integer): cint {.importc: "dsyrk_".}
  
  proc dtbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr doublereal; lda: var integer;
    x: ptr doublereal; incx: var integer): cint {.importc: "dtbmv_".}
  
  proc dtbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr doublereal; lda: var integer;
    x: ptr doublereal; incx: var integer): cint {.importc: "dtbsv_".}
  
  proc dtpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr doublereal; x: ptr doublereal; incx: var integer): cint {.importc: "dtpmv_".}
  
  proc dtpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr doublereal; x: ptr doublereal; incx: var integer): cint {.importc: "dtpsv_".}
  
  proc dtrmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr doublereal;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer): cint {.importc: "dtrmm_".}
  
  proc dtrmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; x: ptr doublereal;
    incx: var integer): cint {.importc: "dtrmv_".}
  
  proc dtrsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr doublereal;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer): cint {.importc: "dtrsm_".}
  
  proc dtrsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; x: ptr doublereal;
    incx: var integer): cint {.importc: "dtrsv_".}
  proc dzasum*(n: var integer; zx: ptr doublecomplex; incx: var integer): doublereal {.importc: "dzasum_".}
  proc dznrm2*(n: var integer; x: ptr doublecomplex; incx: var integer): doublereal {.importc: "dznrm2_".}

  #___________________________________________________________________________
  #
  # Integer
  #___________________________________________________________________________

  proc icamax*(n: var integer; cx: ptr complex; incx: var integer): integer {.importc: "icamax_".}
  proc idamax*(n: var integer; dx: ptr doublereal; incx: var integer): integer {.importc: "idamax_".}
  proc isamax*(n: var integer; sx: ptr real; incx: var integer): integer {.importc: "isamax_".}
  proc izamax*(n: var integer; zx: ptr doublecomplex; incx: var integer): integer {.importc: "izamax_".}
  proc lsame*(ca: var cstring; cb: var cstring): logical {.importc: "lsame_".}

  proc xerbla*(srname: var cstring; info: var integer): cint {.importc: "xerbla_".}
  
  proc xerbla_array*(srname_array: var cstring; srname_len: var integer;
            info: var integer; srname_array_len: ftnlen): cint {.importc: "xerbla_array__".}

  #___________________________________________________________________________
  #
  # Real, single precision
  #___________________________________________________________________________

  proc sasum*(n: var integer; sx: ptr real; incx: var integer): doublereal {.importc: "sasum_".}
  
  proc saxpy*(n: var integer; sa: ptr real; sx: ptr real; incx: var integer;
    sy: ptr real; incy: var integer): cint {.importc: "saxpy_".}
  proc scabs1*(z: ptr complex): doublereal {.importc: "scabs1_".}
  proc scasum*(n: var integer; cx: ptr complex; incx: var integer): doublereal {.importc: "scasum_".}
  proc scnrm2*(n: var integer; x: ptr complex; incx: var integer): doublereal {.importc: "scnrm2_".}
  
  proc scopy*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;
    incy: var integer): cint {.importc: "scopy_".}
  proc sdot*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;              incy: var integer): doublereal {.importc: "sdot_".}
  proc sdsdot*(n: var integer; sb: ptr real; sx: ptr real; incx: var integer;
     sy: ptr real; incy: var integer): doublereal {.importc: "sdsdot_".}
  
  proc sgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;
    ku: var integer; alpha: ptr real; a: ptr real; lda: var integer;
    x: ptr real; incx: var integer; beta: ptr real; y: ptr real;
    incy: var integer): cint {.importc: "sgbmv_".}
  
  proc sgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;
    k: var integer; alpha: ptr real; a: ptr real; lda: var integer;
    b: ptr real; ldb: var integer; beta: ptr real; c: ptr real;
    ldc: var integer): cint {.importc: "sgemm_".}
  
  proc sgemv*(trans: var cstring; m: var integer; n: var integer; alpha: ptr real;
    a: ptr real; lda: var integer; x: ptr real; incx: var integer;
    beta: ptr real; y: ptr real; incy: var integer): cint {.importc: "sgemv_".}
  
  proc sger*(m: var integer; n: var integer; alpha: ptr real; x: ptr real;              incx: var integer; y: ptr real; incy: var integer; a: ptr real;              lda: var integer): cint {.importc: "sger_".}
  proc snrm2*(n: var integer; x: ptr real; incx: var integer): doublereal {.importc: "snrm2_".}
  
  proc srot*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;              incy: var integer; c: ptr real; s: ptr real): cint {.importc: "srot_".}
  
  proc srotg*(sa: ptr real; sb: ptr real; c: ptr real; s: ptr real): cint {.importc: "srotg_".}
  
  proc srotm*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;
    incy: var integer; sparam: ptr real): cint {.importc: "srotm_".}
  
  proc srotmg*(sd1: ptr real; sd2: ptr real; sx1: ptr real; sy1: ptr real;
     sparam: ptr real): cint {.importc: "srotmg_".}
  
  proc ssbmv*(uplo: var cstring; n: var integer; k: var integer; alpha: ptr real;
    a: ptr real; lda: var integer; x: ptr real; incx: var integer;
    beta: ptr real; y: ptr real; incy: var integer): cint {.importc: "ssbmv_".}
  
  proc sscal*(n: var integer; sa: ptr real; sx: ptr real; incx: var integer): cint {.importc: "sscal_".}
  
  proc sspmv*(uplo: var cstring; n: var integer; alpha: ptr real; ap: ptr real;
    x: ptr real; incx: var integer; beta: ptr real; y: ptr real;
    incy: var integer): cint {.importc: "sspmv_".}
  
  proc sspr*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;              incx: var integer; ap: ptr real): cint {.importc: "sspr_".}
  
  proc sspr2*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;
    incx: var integer; y: ptr real; incy: var integer; ap: ptr real): cint {.importc: "sspr2_".}
  
  proc sswap*(n: var integer; sx: ptr real; incx: var integer; sy: ptr real;
    incy: var integer): cint {.importc: "sswap_".}
  
  proc ssymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;
    alpha: ptr real; a: ptr real; lda: var integer; b: ptr real;
    ldb: var integer; beta: ptr real; c: ptr real; ldc: var integer): cint {.importc: "ssymm_".}
  
  proc ssymv*(uplo: var cstring; n: var integer; alpha: ptr real; a: ptr real;
    lda: var integer; x: ptr real; incx: var integer; beta: ptr real;
    y: ptr real; incy: var integer): cint {.importc: "ssymv_".}
  
  proc ssyr*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;              incx: var integer; a: ptr real; lda: var integer): cint {.importc: "ssyr_".}
  
  proc ssyr2*(uplo: var cstring; n: var integer; alpha: ptr real; x: ptr real;
    incx: var integer; y: ptr real; incy: var integer; a: ptr real;
    lda: var integer): cint {.importc: "ssyr2_".}
  
  proc ssyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
     alpha: ptr real; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; beta: ptr real; c: ptr real;
     ldc: var integer): cint {.importc: "ssyr2k_".}
  
  proc ssyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
    alpha: ptr real; a: ptr real; lda: var integer; beta: ptr real;
    c: ptr real; ldc: var integer): cint {.importc: "ssyrk_".}
  
  proc stbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr real; lda: var integer; x: ptr real;
    incx: var integer): cint {.importc: "stbmv_".}
  
  proc stbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr real; lda: var integer; x: ptr real;
    incx: var integer): cint {.importc: "stbsv_".}
  
  proc stpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr real; x: ptr real; incx: var integer): cint {.importc: "stpmv_".}
  
  proc stpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr real; x: ptr real; incx: var integer): cint {.importc: "stpsv_".}
  
  proc strmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr real; a: ptr real;
    lda: var integer; b: ptr real; ldb: var integer): cint {.importc: "strmm_".}
  
  proc strmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr real; lda: var integer; x: ptr real; incx: var integer): cint {.importc: "strmv_".}
  
  proc strsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr real; a: ptr real;
    lda: var integer; b: ptr real; ldb: var integer): cint {.importc: "strsm_".}
  
  proc strsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr real; lda: var integer; x: ptr real; incx: var integer): cint {.importc: "strsv_".}
  
  #___________________________________________________________________________
  #
  # Complex, double precision
  #___________________________________________________________________________

  proc zaxpy*(n: var integer; za: ptr doublecomplex; zx: ptr doublecomplex;
    incx: var integer; zy: ptr doublecomplex; incy: var integer): cint {.importc: "zaxpy_".}
  
  proc zcopy*(n: var integer; zx: ptr doublecomplex; incx: var integer;
    zy: ptr doublecomplex; incy: var integer): cint {.importc: "zcopy_".}
  # Double Complex 
  proc zdotc*(ret_val: ptr doublecomplex; n: var integer;
    zx: ptr doublecomplex; incx: var integer; zy: ptr doublecomplex;
    incy: var integer): VOID {.importc: "zdotc_".}
  # Double Complex 
  proc zdotu*(ret_val: ptr doublecomplex; n: var integer;
    zx: ptr doublecomplex; incx: var integer; zy: ptr doublecomplex;
    incy: var integer): VOID {.importc: "zdotu_".}
  
  proc zdrot*(n: var integer; cx: ptr doublecomplex; incx: var integer;
    cy: ptr doublecomplex; incy: var integer; c: ptr doublereal;
    s: ptr doublereal): cint {.importc: "zdrot_".}
  
  proc zdscal*(n: var integer; da: ptr doublereal; zx: ptr doublecomplex;
     incx: var integer): cint {.importc: "zdscal_".}
  
  proc zgbmv*(trans: var cstring; m: var integer; n: var integer; kl: var integer;
    ku: var integer; alpha: ptr doublecomplex; a: ptr doublecomplex;
    lda: var integer; x: ptr doublecomplex; incx: var integer;
    beta: ptr doublecomplex; y: ptr doublecomplex; incy: var integer): cint {.importc: "zgbmv_".}
  
  proc zgemm*(transa: var cstring; transb: var cstring; m: var integer; n: var integer;
    k: var integer; alpha: ptr doublecomplex; a: ptr doublecomplex;
    lda: var integer; b: ptr doublecomplex; ldb: var integer;
    beta: ptr doublecomplex; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zgemm_".}
  
  proc zgemv*(trans: var cstring; m: var integer; n: var integer;
    alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;
    x: ptr doublecomplex; incx: var integer; beta: ptr doublecomplex;
    y: ptr doublecomplex; incy: var integer): cint {.importc: "zgemv_".}
  
  proc zgerc*(m: var integer; n: var integer; alpha: ptr doublecomplex;
    x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;
    incy: var integer; a: ptr doublecomplex; lda: var integer): cint {.importc: "zgerc_".}
  
  proc zgeru*(m: var integer; n: var integer; alpha: ptr doublecomplex;
    x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;
    incy: var integer; a: ptr doublecomplex; lda: var integer): cint {.importc: "zgeru_".}
  
  proc zhbmv*(uplo: var cstring; n: var integer; k: var integer;
    alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;
    x: ptr doublecomplex; incx: var integer; beta: ptr doublecomplex;
    y: ptr doublecomplex; incy: var integer): cint {.importc: "zhbmv_".}
  
  proc zhemm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;
    alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;
    b: ptr doublecomplex; ldb: var integer; beta: ptr doublecomplex;
    c: ptr doublecomplex; ldc: var integer): cint {.importc: "zhemm_".}
  
  proc zhemv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;
    a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;
    incx: var integer; beta: ptr doublecomplex; y: ptr doublecomplex;
    incy: var integer): cint {.importc: "zhemv_".}
  
  proc zher*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublecomplex; incx: var integer; a: ptr doublecomplex;              lda: var integer): cint {.importc: "zher_".}
  
  proc zher2*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;
    x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;
    incy: var integer; a: ptr doublecomplex; lda: var integer): cint {.importc: "zher2_".}
  
  proc zher2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
     alpha: ptr doublecomplex; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     beta: ptr doublereal; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zher2k_".}
  
  proc zherk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
    alpha: ptr doublereal; a: ptr doublecomplex; lda: var integer;
    beta: ptr doublereal; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zherk_".}
  
  proc zhpmv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;
    ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer;
    beta: ptr doublecomplex; y: ptr doublecomplex; incy: var integer): cint {.importc: "zhpmv_".}
  
  proc zhpr*(uplo: var cstring; n: var integer; alpha: ptr doublereal;              x: ptr doublecomplex; incx: var integer; ap: ptr doublecomplex): cint {.importc: "zhpr_".}
  
  proc zhpr2*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;
    x: ptr doublecomplex; incx: var integer; y: ptr doublecomplex;
    incy: var integer; ap: ptr doublecomplex): cint {.importc: "zhpr2_".}
  
  proc zrotg*(ca: ptr doublecomplex; cb: ptr doublecomplex;
    c: ptr doublereal; s: ptr doublecomplex): cint {.importc: "zrotg_".}
  
  proc zscal*(n: var integer; za: ptr doublecomplex; zx: ptr doublecomplex;
    incx: var integer): cint {.importc: "zscal_".}
  
  proc zswap*(n: var integer; zx: ptr doublecomplex; incx: var integer;
    zy: ptr doublecomplex; incy: var integer): cint {.importc: "zswap_".}
  
  proc zsymm*(side: var cstring; uplo: var cstring; m: var integer; n: var integer;
    alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;
    b: ptr doublecomplex; ldb: var integer; beta: ptr doublecomplex;
    c: ptr doublecomplex; ldc: var integer): cint {.importc: "zsymm_".}
  
  proc zsyr2k*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
     alpha: ptr doublecomplex; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     beta: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer): cint {.importc: "zsyr2k_".}
  
  proc zsyrk*(uplo: var cstring; trans: var cstring; n: var integer; k: var integer;
    alpha: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;
    beta: ptr doublecomplex; c: ptr doublecomplex; ldc: var integer): cint {.importc: "zsyrk_".}
  
  proc ztbmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr doublecomplex; lda: var integer;
    x: ptr doublecomplex; incx: var integer): cint {.importc: "ztbmv_".}
  
  proc ztbsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    k: var integer; a: ptr doublecomplex; lda: var integer;
    x: ptr doublecomplex; incx: var integer): cint {.importc: "ztbsv_".}
  
  proc ztpmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer): cint {.importc: "ztpmv_".}
  
  proc ztpsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer): cint {.importc: "ztpsv_".}
  
  proc ztrmm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr doublecomplex;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer): cint {.importc: "ztrmm_".}
  
  proc ztrmv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;
    incx: var integer): cint {.importc: "ztrmv_".}
  
  proc ztrsm*(side: var cstring; uplo: var cstring; transa: var cstring; diag: var cstring;
    m: var integer; n: var integer; alpha: ptr doublecomplex;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer): cint {.importc: "ztrsm_".}
  
  proc ztrsv*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;
    incx: var integer): cint {.importc: "ztrsv_".}
  
  #___________________________________________________________________________
  #
  # Complex, single precision
  #___________________________________________________________________________

  proc cbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;
     nru: var integer; ncc: var integer; d: ptr real; e: ptr real;
     vt: ptr complex; ldvt: var integer; u: ptr complex;
     ldu: var integer; c: ptr complex; ldc: var integer;
     rwork: ptr real; info: var integer): cint {.importc: "cbdsqr_".}
  
  proc cgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;
     kl: var integer; ku: var integer; ab: ptr complex;
     ldab: var integer; d: ptr real; e: ptr real; q: ptr complex;
     ldq: var integer; pt: ptr complex; ldpt: var integer;
     c: ptr complex; ldc: var integer; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cgbbrd_".}
  
  proc cgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr complex; ldab: var integer; ipiv: var cint;
     anorm: ptr real; rcond: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cgbcon_".}
  
  proc cgbequ*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr complex; ldab: var integer;
     r: ptr real; c: ptr real; rowcnd: ptr real;
     colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "cgbequ_".}
  
  proc cgbequb*(m: var integer; n: var integer; kl: var integer;
      ku: var integer; ab: ptr complex; ldab: var integer;
      r: ptr real; c: ptr real; rowcnd: ptr real;
      colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "cgbequb_".}
  
  proc cgbrfs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr complex;
     ldab: var integer; afb: ptr complex; ldafb: var integer;
     ipiv: var cint; b: ptr complex; ldb: var integer;
     x: ptr complex; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cgbrfs_".}
  
  proc cgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;
      kl: var integer; ku: var integer; nrhs: var integer;
      ab: ptr complex; ldab: var integer; afb: ptr complex;
      ldafb: var integer; ipiv: var cint; r: ptr real;
      c: ptr real; b: ptr complex; ldb: var integer;
      x: ptr complex; ldx: var integer; rcond: ptr real;
      berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr complex;
      rwork: ptr real; info: var integer): cint {.importc: "cgbrfsx_".}
  
  proc cgbsv*(n: var integer; kl: var integer; ku: var integer;
    nrhs: var integer; ab: ptr complex; ldab: var integer;
    ipiv: var cint; b: ptr complex; ldb: var integer;
    info: var integer): cint {.importc: "cgbsv_".}
  
  proc cgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr complex;
     ldab: var integer; afb: ptr complex; ldafb: var integer;
     ipiv: var cint; equed: var cstring; r: ptr real; c: ptr real;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cgbsvx_".}
  
  proc cgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
      ku: var integer; nrhs: var integer; ab: ptr complex;
      ldab: var integer; afb: ptr complex; ldafb: var integer;
      ipiv: var cint; equed: var cstring; r: ptr real;
      c: ptr real; b: ptr complex; ldb: var integer;
      x: ptr complex; ldx: var integer; rcond: ptr real;
      rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr complex;
      rwork: ptr real; info: var integer): cint {.importc: "cgbsvxx_".}
  
  proc cgbtf2*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr complex; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "cgbtf2_".}
  
  proc cgbtrf*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr complex; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "cgbtrf_".}
  
  proc cgbtrs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr complex;
     ldab: var integer; ipiv: var cint; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "cgbtrs_".}
  
  proc cgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; scale: ptr real; m: var integer;
     v: ptr complex; ldv: var integer; info: var integer): cint {.importc: "cgebak_".}
  
  proc cgebal*(job: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ilo: var integer; ihi: var integer; scale: ptr real;
     info: var integer): cint {.importc: "cgebal_".}
  
  proc cgebd2*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; d: ptr real; e: ptr real; tauq: ptr complex;
     taup: ptr complex; work: ptr complex; info: var integer): cint {.importc: "cgebd2_".}
  
  proc cgebrd*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; d: ptr real; e: ptr real; tauq: ptr complex;
     taup: ptr complex; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "cgebrd_".}
  
  proc cgecon*(norm: var cstring; n: var integer; a: ptr complex; lda: var integer;
     anorm: ptr real; rcond: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cgecon_".}
  
  proc cgeequ*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; r: ptr real; c: ptr real;
     rowcnd: ptr real; colcnd: ptr real; amax: ptr real;
     info: var integer): cint {.importc: "cgeequ_".}
  
  proc cgeequb*(m: var integer; n: var integer; a: ptr complex;
      lda: var integer; r: ptr real; c: ptr real;
      rowcnd: ptr real; colcnd: ptr real; amax: ptr real;
      info: var integer): cint {.importc: "cgeequb_".}
  
  proc cgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;
    a: ptr complex; lda: var integer; sdim: var integer;
    w: ptr complex; vs: ptr complex; ldvs: var integer;
    work: ptr complex; lwork: var integer; rwork: ptr real;
    bwork: ptr logical; info: var integer): cint {.importc: "cgees_".}
  
  proc cgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;
     n: var integer; a: ptr complex; lda: var integer;
     sdim: var integer; w: ptr complex; vs: ptr complex;
     ldvs: var integer; rconde: ptr real; rcondv: ptr real;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     bwork: ptr logical; info: var integer): cint {.importc: "cgeesx_".}
  
  proc cgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr complex;
    lda: var integer; w: ptr complex; vl: ptr complex;
    ldvl: var integer; vr: ptr complex; ldvr: var integer;
    work: ptr complex; lwork: var integer; rwork: ptr real;
    info: var integer): cint {.importc: "cgeev_".}
  
  proc cgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr complex; lda: var integer;
     w: ptr complex; vl: ptr complex; ldvl: var integer;
     vr: ptr complex; ldvr: var integer; ilo: var integer;
     ihi: var integer; scale: ptr real; abnrm: ptr real;
     rconde: ptr real; rcondv: ptr real; work: ptr complex;
     lwork: var integer; rwork: ptr real; info: var integer): cint {.importc: "cgeevx_".}
  
  proc cgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer; a: ptr complex;
    lda: var integer; b: ptr complex; ldb: var integer;
    alpha: ptr complex; beta: ptr complex; vsl: ptr complex;
    ldvsl: var integer; vsr: ptr complex; ldvsr: var integer;
    work: ptr complex; lwork: var integer; rwork: ptr real;
    info: var integer): cint {.importc: "cgegs_".}
  
  proc cgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr complex;
    lda: var integer; b: ptr complex; ldb: var integer;
    alpha: ptr complex; beta: ptr complex; vl: ptr complex;
    ldvl: var integer; vr: ptr complex; ldvr: var integer;
    work: ptr complex; lwork: var integer; rwork: ptr real;
    info: var integer): cint {.importc: "cgegv_".}
  
  proc cgehd2*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr complex; lda: var integer; tau: ptr complex;
     work: ptr complex; info: var integer): cint {.importc: "cgehd2_".}
  
  proc cgehrd*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr complex; lda: var integer; tau: ptr complex;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cgehrd_".}
  
  proc cgelq2*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cgelq2_".}
  
  proc cgelqf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cgelqf_".}
  
  proc cgels*(trans: var cstring; m: var integer; n: var integer;
    nrhs: var integer; a: ptr complex; lda: var integer;
    b: ptr complex; ldb: var integer; work: ptr complex;
    lwork: var integer; info: var integer): cint {.importc: "cgels_".}
  
  proc cgelsd*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; s: ptr real; rcond: ptr real;
     rank: var integer; work: ptr complex; lwork: var integer;
     rwork: ptr real; iwork: var integer; info: var integer): cint {.importc: "cgelsd_".}
  
  proc cgelss*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; s: ptr real; rcond: ptr real;
     rank: var integer; work: ptr complex; lwork: var integer;
     rwork: ptr real; info: var integer): cint {.importc: "cgelss_".}
  
  proc cgelsx*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; jpvt: var integer; rcond: ptr real;
     rank: var integer; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cgelsx_".}
  
  proc cgelsy*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; jpvt: var integer; rcond: ptr real;
     rank: var integer; work: ptr complex; lwork: var integer;
     rwork: ptr real; info: var integer): cint {.importc: "cgelsy_".}
  
  proc cgeql2*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cgeql2_".}
  
  proc cgeqlf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cgeqlf_".}
  
  proc cgeqp3*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; jpvt: var integer; tau: ptr complex;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     info: var integer): cint {.importc: "cgeqp3_".}
  
  proc cgeqpf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; jpvt: var integer; tau: ptr complex;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cgeqpf_".}
  
  proc cgeqr2*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cgeqr2_".}
  
  proc cgeqrf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cgeqrf_".}
  
  proc cgerfs*(trans: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; ipiv: var cint; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cgerfs_".}
  
  proc cgerfsx*(trans: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; ipiv: var cint;
      r: ptr real; c: ptr real; b: ptr complex; ldb: var integer;
      x: ptr complex; ldx: var integer; rcond: ptr real;
      berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr complex;
      rwork: ptr real; info: var integer): cint {.importc: "cgerfsx_".}
  
  proc cgerq2*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cgerq2_".}
  
  proc cgerqf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cgerqf_".}
  
  proc cgesc2*(n: var integer; a: ptr complex; lda: var integer;
     rhs: ptr complex; ipiv: var cint; jpiv: var cint;
     scale: ptr real): cint {.importc: "cgesc2_".}
  
  proc cgesdd*(jobz: var cstring; m: var integer; n: var integer; a: ptr complex;
     lda: var integer; s: ptr real; u: ptr complex; ldu: var integer;
     vt: ptr complex; ldvt: var integer; work: ptr complex;
     lwork: var integer; rwork: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "cgesdd_".}
  
  proc cgesv*(n: var integer; nrhs: var integer; a: ptr complex;
    lda: var integer; ipiv: var cint; b: ptr complex;
    ldb: var integer; info: var integer): cint {.importc: "cgesv_".}
  
  proc cgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;
     a: ptr complex; lda: var integer; s: ptr real; u: ptr complex;
     ldu: var integer; vt: ptr complex; ldvt: var integer;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     info: var integer): cint {.importc: "cgesvd_".}
  
  proc cgesvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; a: ptr complex; lda: var integer;
     af: ptr complex; ldaf: var integer; ipiv: var cint;
     equed: var cstring; r: ptr real; c: ptr real; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cgesvx_".}
  
  proc cgesvxx*(fact: var cstring; trans: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; ipiv: var cint;
      equed: var cstring; r: ptr real; c: ptr real; b: ptr complex;
      ldb: var integer; x: ptr complex; ldx: var integer;
      rcond: ptr real; rpvgrw: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr complex; rwork: ptr real;
      info: var integer): cint {.importc: "cgesvxx_".}
  
  proc cgetc2*(n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "cgetc2_".}
  
  proc cgetf2*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "cgetf2_".}
  
  proc cgetrf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "cgetrf_".}
  
  proc cgetri*(n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "cgetri_".}
  
  proc cgetrs*(trans: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; ipiv: var cint;
     b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cgetrs_".}
  
  proc cggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr real; rscale: ptr real;
     m: var integer; v: ptr complex; ldv: var integer;
     info: var integer): cint {.importc: "cggbak_".}
  
  proc cggbal*(job: var cstring; n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr real; rscale: ptr real;
     work: ptr real; info: var integer): cint {.importc: "cggbal_".}
  
  proc cgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
    n: var integer; a: ptr complex; lda: var integer; b: ptr complex;
    ldb: var integer; sdim: var integer; alpha: ptr complex;
    beta: ptr complex; vsl: ptr complex; ldvsl: var integer;
    vsr: ptr complex; ldvsr: var integer; work: ptr complex;
    lwork: var integer; rwork: ptr real; bwork: ptr logical;
    info: var integer): cint {.importc: "cgges_".}
  
  proc cggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
     sense: var cstring; n: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     sdim: var integer; alpha: ptr complex; beta: ptr complex;
     vsl: ptr complex; ldvsl: var integer; vsr: ptr complex;
     ldvsr: var integer; rconde: ptr real; rcondv: ptr real;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     iwork: var integer; liwork: var integer; bwork: ptr logical;
     info: var integer): cint {.importc: "cggesx_".}
  
  proc cggev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr complex;
    lda: var integer; b: ptr complex; ldb: var integer;
    alpha: ptr complex; beta: ptr complex; vl: ptr complex;
    ldvl: var integer; vr: ptr complex; ldvr: var integer;
    work: ptr complex; lwork: var integer; rwork: ptr real;
    info: var integer): cint {.importc: "cggev_".}
  
  proc cggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; alpha: ptr complex;
     beta: ptr complex; vl: ptr complex; ldvl: var integer;
     vr: ptr complex; ldvr: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr real; rscale: ptr real;
     abnrm: ptr real; bbnrm: ptr real; rconde: ptr real;
     rcondv: ptr real; work: ptr complex; lwork: var integer;
     rwork: ptr real; iwork: var integer; bwork: ptr logical;
     info: var integer): cint {.importc: "cggevx_".}
  
  proc cggglm*(n: var integer; m: var integer; p: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     d: ptr complex; x: ptr complex; y: ptr complex;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cggglm_".}
  
  proc cgghrd*(compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     q: ptr complex; ldq: var integer; z: ptr complex;
     ldz: var integer; info: var integer): cint {.importc: "cgghrd_".}
  
  proc cgglse*(m: var integer; n: var integer; p: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     c: ptr complex; d: ptr complex; x: ptr complex;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cgglse_".}
  
  proc cggqrf*(n: var integer; m: var integer; p: var integer; a: ptr complex;
     lda: var integer; taua: ptr complex; b: ptr complex;
     ldb: var integer; taub: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cggqrf_".}
  
  proc cggrqf*(m: var integer; p: var integer; n: var integer; a: ptr complex;
     lda: var integer; taua: ptr complex; b: ptr complex;
     ldb: var integer; taub: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cggrqf_".}
  
  proc cggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     n: var integer; p: var integer; k: var integer; l: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; alpha: ptr real; beta: ptr real;
     u: ptr complex; ldu: var integer; v: ptr complex;
     ldv: var integer; q: ptr complex; ldq: var integer;
     work: ptr complex; rwork: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "cggsvd_".}
  
  proc cggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     tola: ptr real; tolb: ptr real; k: var integer; l: var integer;
     u: ptr complex; ldu: var integer; v: ptr complex;
     ldv: var integer; q: ptr complex; ldq: var integer;
     iwork: var integer; rwork: ptr real; tau: ptr complex;
     work: ptr complex; info: var integer): cint {.importc: "cggsvp_".}
  
  proc cgtcon*(norm: var cstring; n: var integer; dl: ptr complex;
     d: ptr complex; du: ptr complex; du2: ptr complex;
     ipiv: var cint; anorm: ptr real; rcond: ptr real;
     work: ptr complex; info: var integer): cint {.importc: "cgtcon_".}
  
  proc cgtrfs*(trans: var cstring; n: var integer; nrhs: var integer;
     dl: ptr complex; d: ptr complex; du: ptr complex;
     dlf: ptr complex; df: ptr complex; duf: ptr complex;
     du2: ptr complex; ipiv: var cint; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cgtrfs_".}
  
  proc cgtsv*(n: var integer; nrhs: var integer; dl: ptr complex;
    d: ptr complex; du: ptr complex; b: ptr complex;
    ldb: var integer; info: var integer): cint {.importc: "cgtsv_".}
  
  proc cgtsvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; dl: ptr complex; d: ptr complex;
     du: ptr complex; dlf: ptr complex; df: ptr complex;
     duf: ptr complex; du2: ptr complex; ipiv: var cint;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cgtsvx_".}
  
  proc cgttrf*(n: var integer; dl: ptr complex; d: ptr complex;
     du: ptr complex; du2: ptr complex; ipiv: var cint;
     info: var integer): cint {.importc: "cgttrf_".}
  
  proc cgttrs*(trans: var cstring; n: var integer; nrhs: var integer;
     dl: ptr complex; d: ptr complex; du: ptr complex;
     du2: ptr complex; ipiv: var cint; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "cgttrs_".}
  
  proc cgtts2*(itrans: var integer; n: var integer; nrhs: var integer;
     dl: ptr complex; d: ptr complex; du: ptr complex;
     du2: ptr complex; ipiv: var cint; b: ptr complex;
     ldb: var integer): cint {.importc: "cgtts2_".}
  
  proc chbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
    ab: ptr complex; ldab: var integer; w: ptr real;
    z: ptr complex; ldz: var integer; work: ptr complex;
    rwork: ptr real; info: var integer): cint {.importc: "chbev_".}
  
  proc chbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr complex; ldab: var integer; w: ptr real;
     z: ptr complex; ldz: var integer; work: ptr complex;
     lwork: var integer; rwork: ptr real; lrwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "chbevd_".}
  
  proc chbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     kd: var integer; ab: ptr complex; ldab: var integer;
     q: ptr complex; ldq: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr complex; ldz: var integer;
     work: ptr complex; rwork: ptr real; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "chbevx_".}
  
  proc chbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr complex; ldab: var integer;
     bb: ptr complex; ldbb: var integer; x: ptr complex;
     ldx: var integer; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "chbgst_".}
  
  proc chbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
    kb: var integer; ab: ptr complex; ldab: var integer;
    bb: ptr complex; ldbb: var integer; w: ptr real;
    z: ptr complex; ldz: var integer; work: ptr complex;
    rwork: ptr real; info: var integer): cint {.importc: "chbgv_".}
  
  proc chbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr complex; ldab: var integer;
     bb: ptr complex; ldbb: var integer; w: ptr real;
     z: ptr complex; ldz: var integer; work: ptr complex;
     lwork: var integer; rwork: ptr real; lrwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "chbgvd_".}
  
  proc chbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ka: var integer; kb: var integer; ab: ptr complex;
     ldab: var integer; bb: ptr complex; ldbb: var integer;
     q: ptr complex; ldq: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr complex; ldz: var integer;
     work: ptr complex; rwork: ptr real; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "chbgvx_".}
  
  proc chbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr complex; ldab: var integer; d: ptr real; e: ptr real;
     q: ptr complex; ldq: var integer; work: ptr complex;
     info: var integer): cint {.importc: "chbtrd_".}
  
  proc checon*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; anorm: ptr real; rcond: ptr real;
     work: ptr complex; info: var integer): cint {.importc: "checon_".}
  
  proc cheequb*(uplo: var cstring; n: var integer; a: ptr complex;
      lda: var integer; s: ptr real; scond: ptr real; amax: ptr real;
      work: ptr complex; info: var integer): cint {.importc: "cheequb_".}
  
  proc cheev*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
    lda: var integer; w: ptr real; work: ptr complex;
    lwork: var integer; rwork: ptr real; info: var integer): cint {.importc: "cheev_".}
  
  proc cheevd*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
     lda: var integer; w: ptr real; work: ptr complex;
     lwork: var integer; rwork: ptr real; lrwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "cheevd_".}
  
  proc cheevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr complex; lda: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr complex; ldz: var integer;
     isuppz: var integer; work: ptr complex; lwork: var integer;
     rwork: ptr real; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "cheevr_".}
  
  proc cheevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr complex; lda: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "cheevx_".}
  
  proc chegs2*(itype: var integer; uplo: var cstring; n: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "chegs2_".}
  
  proc chegst*(itype: var integer; uplo: var cstring; n: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "chegst_".}
  
  proc chegv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    a: ptr complex; lda: var integer; b: ptr complex;
    ldb: var integer; w: ptr real; work: ptr complex;
    lwork: var integer; rwork: ptr real; info: var integer): cint {.importc: "chegv_".}
  
  proc chegvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; w: ptr real;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     lrwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "chegvd_".}
  
  proc chegvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "chegvx_".}
  
  proc cherfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; ipiv: var cint; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cherfs_".}
  
  proc cherfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; ipiv: var cint;
      s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;
      ldx: var integer; rcond: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr complex; rwork: ptr real;
      info: var integer): cint {.importc: "cherfsx_".}
  
  proc chesv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr complex;
    lda: var integer; ipiv: var cint; b: ptr complex;
    ldb: var integer; work: ptr complex; lwork: var integer;
    info: var integer): cint {.importc: "chesv_".}
  
  proc chesvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; ipiv: var cint; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     info: var integer): cint {.importc: "chesvx_".}
  
  proc chesvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; ipiv: var cint;
      equed: var cstring; s: ptr real; b: ptr complex; ldb: var integer;
      x: ptr complex; ldx: var integer; rcond: ptr real;
      rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr complex;
      rwork: ptr real; info: var integer): cint {.importc: "chesvxx_".}
  
  proc chetd2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     d: ptr real; e: ptr real; tau: ptr complex; info: var integer): cint {.importc: "chetd2_".}
  
  proc chetf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "chetf2_".}
  
  proc chetrd*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     d: ptr real; e: ptr real; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "chetrd_".}
  
  proc chetrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "chetrf_".}
  
  proc chetri*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "chetri_".}
  
  proc chetrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; ipiv: var cint;
     b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "chetrs_".}
  
  proc chfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;
    k: var integer; alpha: ptr real; a: ptr complex;
    lda: var integer; beta: ptr real; c: ptr complex): cint {.importc: "chfrk_".}
  
  proc chgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr complex;
     ldh: var integer; t: ptr complex; ldt: var integer;
     alpha: ptr complex; beta: ptr complex; q: ptr complex;
     ldq: var integer; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     info: var integer): cint {.importc: "chgeqz_".}
  # Character 
  proc chla_transtype*(ret_val: var cstring; ret_val_len: ftnlen;
              trans: var integer): VOID {.importc: "chla_transtype__".}
  
  proc chpcon*(uplo: var cstring; n: var integer; ap: ptr complex;
     ipiv: var cint; anorm: ptr real; rcond: ptr real;
     work: ptr complex; info: var integer): cint {.importc: "chpcon_".}
  
  proc chpev*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;
    w: ptr real; z: ptr complex; ldz: var integer;
    work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "chpev_".}
  
  proc chpevd*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;
     w: ptr real; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     lrwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "chpevd_".}
  
  proc chpevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ap: ptr complex; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr complex; ldz: var integer; work: ptr complex;
     rwork: ptr real; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "chpevx_".}
  
  proc chpgst*(itype: var integer; uplo: var cstring; n: var integer;
     ap: ptr complex; bp: ptr complex; info: var integer): cint {.importc: "chpgst_".}
  
  proc chpgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    ap: ptr complex; bp: ptr complex; w: ptr real; z: ptr complex;
    ldz: var integer; work: ptr complex; rwork: ptr real;
    info: var integer): cint {.importc: "chpgv_".}
  
  proc chpgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; ap: ptr complex; bp: ptr complex; w: ptr real;
     z: ptr complex; ldz: var integer; work: ptr complex;
     lwork: var integer; rwork: ptr real; lrwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "chpgvd_".}
  
  proc chpgvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; ap: ptr complex; bp: ptr complex;
     vl: ptr real; vu: ptr real; il: var integer; iu: var integer;
     abstol: ptr real; m: var integer; w: ptr real; z: ptr complex;
     ldz: var integer; work: ptr complex; rwork: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "chpgvx_".}
  
  proc chprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; afp: ptr complex; ipiv: var cint;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "chprfs_".}
  
  proc chpsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr complex; ipiv: var cint; b: ptr complex;
    ldb: var integer; info: var integer): cint {.importc: "chpsv_".}
  
  proc chpsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; afp: ptr complex; ipiv: var cint;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "chpsvx_".}
  
  proc chptrd*(uplo: var cstring; n: var integer; ap: ptr complex; d: ptr real;
     e: ptr real; tau: ptr complex; info: var integer): cint {.importc: "chptrd_".}
  
  proc chptrf*(uplo: var cstring; n: var integer; ap: ptr complex;
     ipiv: var cint; info: var integer): cint {.importc: "chptrf_".}
  
  proc chptri*(uplo: var cstring; n: var integer; ap: ptr complex;
     ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "chptri_".}
  
  proc chptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; ipiv: var cint; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "chptrs_".}
  
  proc chsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;
     select: ptr logical; n: var integer; h: ptr complex;
     ldh: var integer; w: ptr complex; vl: ptr complex;
     ldvl: var integer; vr: ptr complex; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr complex;
     rwork: ptr real; ifaill: var integer; ifailr: var integer;
     info: var integer): cint {.importc: "chsein_".}
  
  proc chseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; h: ptr complex; ldh: var integer;
     w: ptr complex; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "chseqr_".}
  
  proc cla_gbamv*(trans: var integer; m: var integer; n: var integer;
         kl: var integer; ku: var integer; alpha: ptr real;
         ab: ptr complex; ldab: var integer; x: ptr complex;
         incx: var integer; beta: ptr real; y: ptr real;
         incy: var integer): cint {.importc: "cla_gbamv__".}

  proc cla_gbrcond_c*(trans: var cstring; n: var integer; kl: var integer;
             ku: var integer; ab: ptr complex; ldab: var integer;
             afb: ptr complex; ldafb: var integer; ipiv: var cint;
             c: ptr real; capply: ptr logical; info: var integer;
             work: ptr complex; rwork: ptr real; trans_len: ftnlen): doublereal {.importc: "cla_gbrcond_c__".}

  proc cla_gbrcond_x*(trans: var cstring; n: var integer; kl: var integer;
             ku: var integer; ab: ptr complex; ldab: var integer;
             afb: ptr complex; ldafb: var integer; ipiv: var cint;
             x: ptr complex; info: var integer; work: ptr complex;
             rwork: ptr real; trans_len: ftnlen): doublereal {.importc: "cla_gbrcond_x__".}
  
  proc cla_gbrfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    kl: var integer; ku: var integer;
    
    nrhs: var integer; ab: ptr complex;
    
    ldab: var integer; afb: ptr complex;
    
    ldafb: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr real;
    
    b: ptr complex; ldb: var integer; y: ptr complex;
    
    ldy: var integer; berr_out: ptr real;
    
    n_norms: var integer; errs_n: ptr real;
    
    errs_c: ptr real; res: ptr complex;
    
    ayb: ptr real; dy: ptr complex;
    
    y_tail: ptr complex; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer): cint {.importc: "cla_gbrfsx_extended__".}

  proc cla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;
            ncols: var integer; ab: ptr complex; ldab: var integer;
            afb: ptr complex; ldafb: var integer): doublereal {.importc: "cla_gbrpvgrw__".}
  
  proc cla_geamv*(trans: var integer; m: var integer; n: var integer;
         alpha: ptr real; a: ptr complex; lda: var integer;
         x: ptr complex; incx: var integer; beta: ptr real;
         y: ptr real; incy: var integer): cint {.importc: "cla_geamv__".}
  proc cla_gercond_c*(trans: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             ipiv: var cint; c: ptr real; capply: ptr logical;
             info: var integer; work: ptr complex; rwork: ptr real;
             trans_len: ftnlen): doublereal {.importc: "cla_gercond_c__".}
  proc cla_gercond_x*(trans: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             ipiv: var cint; x: ptr complex; info: var integer;
             work: ptr complex; rwork: ptr real; trans_len: ftnlen): doublereal {.importc: "cla_gercond_x__".}
  
  proc cla_gerfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    nrhs: var integer; a: ptr complex;
    
    lda: var integer; af: ptr complex;
    
    ldaf: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr real;
    
    b: ptr complex; ldb: var integer; y: ptr complex;
    
    ldy: var integer; berr_out: ptr real;
    
    n_norms: var integer; errs_n: ptr real;
    
    errs_c: ptr real; res: ptr complex;
    
    ayb: ptr real; dy: ptr complex;
    
    y_tail: ptr complex; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer): cint {.importc: "cla_gerfsx_extended__".}
  
  proc cla_heamv*(uplo: var integer; n: var integer; alpha: ptr real;
         a: ptr complex; lda: var integer; x: ptr complex;
         incx: var integer; beta: ptr real; y: ptr real;
         incy: var integer): cint {.importc: "cla_heamv__".}
  proc cla_hercond_c*(uplo: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             ipiv: var cint; c: ptr real; capply: ptr logical;
             info: var integer; work: ptr complex; rwork: ptr real;
             uplo_len: ftnlen): doublereal {.importc: "cla_hercond_c__".}
  proc cla_hercond_x*(uplo: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             ipiv: var cint; x: ptr complex; info: var integer;
             work: ptr complex; rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_hercond_x__".}
  
  proc cla_herfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer; a: ptr complex;
    
    lda: var integer; af: ptr complex;
    
    ldaf: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr real;
    
    b: ptr complex; ldb: var integer; y: ptr complex;
    
    ldy: var integer; berr_out: ptr real;
    
    n_norms: var integer; errs_n: ptr real;
    
    errs_c: ptr real; res: ptr complex;
    
    ayb: ptr real; dy: ptr complex;
    
    y_tail: ptr complex; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer; uplo_len: ftnlen): cint {.importc: "cla_herfsx_extended__".}
  proc cla_herpvgrw*(uplo: var cstring; n: var integer; info: var integer;
            a: ptr complex; lda: var integer; af: ptr complex;
            ldaf: var integer; ipiv: var cint; work: ptr real;
            uplo_len: ftnlen): doublereal {.importc: "cla_herpvgrw__".}
  
  proc cla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;
            res: ptr complex; ayb: ptr real; berr: ptr real): cint {.importc: "cla_lin_berr__".}
  proc cla_porcond_c*(uplo: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             c: ptr real; capply: ptr logical; info: var integer;
             work: ptr complex; rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_porcond_c__".}
  proc cla_porcond_x*(uplo: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             x: ptr complex; info: var integer; work: ptr complex;
             rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_porcond_x__".}
  
  proc cla_porfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer; a: ptr complex;
    
    lda: var integer; af: ptr complex;
    
    ldaf: var integer; colequ: ptr logical;
    
    c: ptr real; b: ptr complex; ldb: var integer;
    
    y: ptr complex; ldy: var integer;
    
    berr_out: ptr real; n_norms: var integer;
    
    errs_n: ptr real; errs_c: ptr real;
    
    res: ptr complex; ayb: ptr real; dy: ptr complex;
    
    y_tail: ptr complex; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer; uplo_len: ftnlen): cint {.importc: "cla_porfsx_extended__".}
  proc cla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr complex;
            lda: var integer; af: ptr complex; ldaf: var integer;
            work: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_porpvgrw__".}
  proc cla_rpvgrw*(n: var integer; ncols: var integer; a: ptr complex;
          lda: var integer; af: ptr complex; ldaf: var integer): doublereal {.importc: "cla_rpvgrw__".}
  
  proc cla_syamv*(uplo: var integer; n: var integer; alpha: ptr real;
         a: ptr complex; lda: var integer; x: ptr complex;
         incx: var integer; beta: ptr real; y: ptr real;
         incy: var integer): cint {.importc: "cla_syamv__".}
  proc cla_syrcond_c*(uplo: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             ipiv: var cint; c: ptr real; capply: ptr logical;
             info: var integer; work: ptr complex; rwork: ptr real;
             uplo_len: ftnlen): doublereal {.importc: "cla_syrcond_c__".}
  proc cla_syrcond_x*(uplo: var cstring; n: var integer; a: ptr complex;
             lda: var integer; af: ptr complex; ldaf: var integer;
             ipiv: var cint; x: ptr complex; info: var integer;
             work: ptr complex; rwork: ptr real; uplo_len: ftnlen): doublereal {.importc: "cla_syrcond_x__".}
  
  proc cla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer; a: ptr complex;
    
    lda: var integer; af: ptr complex;
    
    ldaf: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr real;
    
    b: ptr complex; ldb: var integer; y: ptr complex;
    
    ldy: var integer; berr_out: ptr real;
    
    n_norms: var integer; errs_n: ptr real;
    
    errs_c: ptr real; res: ptr complex;
    
    ayb: ptr real; dy: ptr complex;
    
    y_tail: ptr complex; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer; uplo_len: ftnlen): cint {.importc: "cla_syrfsx_extended__".}
  proc cla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;
            a: ptr complex; lda: var integer; af: ptr complex;
            ldaf: var integer; ipiv: var cint; work: ptr real;
            uplo_len: ftnlen): doublereal {.importc: "cla_syrpvgrw__".}
  
  proc cla_wwaddw*(n: var integer; x: ptr complex; y: ptr complex;
          w: ptr complex): cint {.importc: "cla_wwaddw__".}
  
  proc clabrd*(m: var integer; n: var integer; nb: var integer; a: ptr complex;
     lda: var integer; d: ptr real; e: ptr real; tauq: ptr complex;
     taup: ptr complex; x: ptr complex; ldx: var integer;
     y: ptr complex; ldy: var integer): cint {.importc: "clabrd_".}
  
  proc clacgv*(n: var integer; x: ptr complex; incx: var integer): cint {.importc: "clacgv_".}
  
  proc clacn2*(n: var integer; v: ptr complex; x: ptr complex; est: ptr real;
     kase: var integer; isave: var integer): cint {.importc: "clacn2_".}
  
  proc clacon*(n: var integer; v: ptr complex; x: ptr complex; est: ptr real;
     kase: var integer): cint {.importc: "clacon_".}
  
  proc clacp2*(uplo: var cstring; m: var integer; n: var integer; a: ptr real;
     lda: var integer; b: ptr complex; ldb: var integer): cint {.importc: "clacp2_".}
  
  proc clacpy*(uplo: var cstring; m: var integer; n: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer): cint {.importc: "clacpy_".}
  
  proc clacrm*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; b: ptr real; ldb: var integer;
     c: ptr complex; ldc: var integer; rwork: ptr real): cint {.importc: "clacrm_".}
  
  proc clacrt*(n: var integer; cx: ptr complex; incx: var integer;
     cy: ptr complex; incy: var integer; c: ptr complex;
     s: ptr complex): cint {.importc: "clacrt_".}
  # Complex 
  proc cladiv*(ret_val: ptr complex; x: ptr complex; y: ptr complex): VOID {.importc: "cladiv_".}
  
  proc claed0*(qsiz: var integer; n: var integer; d: ptr real; e: ptr real;
     q: ptr complex; ldq: var integer; qstore: ptr complex;
     ldqs: var integer; rwork: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "claed0_".}
  
  proc claed7*(n: var integer; cutpnt: var integer; qsiz: var integer;
     tlvls: var integer; curlvl: var integer; curpbm: var integer;
     d: ptr real; q: ptr complex; ldq: var integer; rho: ptr real;
     indxq: var integer; qstore: ptr real; qptr: var integer;
     prmptr: var integer; perm: var integer; givptr: var integer;
     givcol: var integer; givnum: ptr real; work: ptr complex;
     rwork: ptr real; iwork: var integer; info: var integer): cint {.importc: "claed7_".}
  
  proc claed8*(k: var integer; n: var integer; qsiz: var integer;
     q: ptr complex; ldq: var integer; d: ptr real; rho: ptr real;
     cutpnt: var integer; z: ptr real; dlamda: ptr real;
     q2: ptr complex; ldq2: var integer; w: ptr real;
     indxp: var integer; indx: var integer; indxq: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     givnum: ptr real; info: var integer): cint {.importc: "claed8_".}
  
  proc claein*(rightv: ptr logical; noinit: ptr logical; n: var integer;
     h: ptr complex; ldh: var integer; w: ptr complex;
     v: ptr complex; b: ptr complex; ldb: var integer;
     rwork: ptr real; eps3: ptr real; smlnum: ptr real;
     info: var integer): cint {.importc: "claein_".}
  
  proc claesy*(a: ptr complex; b: ptr complex; c: ptr complex;
     rt1: ptr complex; rt2: ptr complex; evscal: ptr complex;
     cs1: ptr complex; sn1: ptr complex): cint {.importc: "claesy_".}
  
  proc claev2*(a: ptr complex; b: ptr complex; c: ptr complex; rt1: ptr real;
     rt2: ptr real; cs1: ptr real; sn1: ptr complex): cint {.importc: "claev2_".}
  
  proc clag2z*(m: var integer; n: var integer; sa: ptr complex;
     ldsa: var integer; a: ptr doublecomplex; lda: var integer;
     info: var integer): cint {.importc: "clag2z_".}
  
  proc clags2*(upper: ptr logical; a1: ptr real; a2: ptr complex; a3: ptr real;
     b1: ptr real; b2: ptr complex; b3: ptr real; csu: ptr real;
     snu: ptr complex; csv: ptr real; snv: ptr complex;
     csq: ptr real; snq: ptr complex): cint {.importc: "clags2_".}
  
  proc clagtm*(trans: var cstring; n: var integer; nrhs: var integer;
     alpha: ptr real; dl: ptr complex; d: ptr complex;
     du: ptr complex; x: ptr complex; ldx: var integer;
     beta: ptr real; b: ptr complex; ldb: var integer): cint {.importc: "clagtm_".}
  
  proc clahef*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;
     a: ptr complex; lda: var integer; ipiv: var cint;
     w: ptr complex; ldw: var integer; info: var integer): cint {.importc: "clahef_".}
  
  proc clahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr complex;
     ldh: var integer; w: ptr complex; iloz: var integer;
     ihiz: var integer; z: ptr complex; ldz: var integer;
     info: var integer): cint {.importc: "clahqr_".}
  
  proc clahr2*(n: var integer; k: var integer; nb: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; t: ptr complex;
     ldt: var integer; y: ptr complex; ldy: var integer): cint {.importc: "clahr2_".}
  
  proc clahrd*(n: var integer; k: var integer; nb: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; t: ptr complex;
     ldt: var integer; y: ptr complex; ldy: var integer): cint {.importc: "clahrd_".}
  
  proc claic1*(job: var integer; j: var integer; x: ptr complex;
     sest: ptr real; w: ptr complex; gamma: ptr complex;
     sestpr: ptr real; s: ptr complex; c: ptr complex): cint {.importc: "claic1_".}
  
  proc clals0*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; nrhs: var integer; b: ptr complex;
     ldb: var integer; bx: ptr complex; ldbx: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     ldgcol: var integer; givnum: ptr real; ldgnum: var integer;
     poles: ptr real; difl: ptr real; difr: ptr real; z: ptr real;
     k: var integer; c: ptr real; s: ptr real; rwork: ptr real;
     info: var integer): cint {.importc: "clals0_".}
  
  proc clalsa*(icompq: var integer; smlsiz: var integer; n: var integer;
     nrhs: var integer; b: ptr complex; ldb: var integer;
     bx: ptr complex; ldbx: var integer; u: ptr real;
     ldu: var integer; vt: ptr real; k: var integer; difl: ptr real;
     difr: ptr real; z: ptr real; poles: ptr real;
     givptr: var integer; givcol: var integer; ldgcol: var integer;
     perm: var integer; givnum: ptr real; c: ptr real; s: ptr real;
     rwork: ptr real; iwork: var integer; info: var integer): cint {.importc: "clalsa_".}
  
  proc clalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;
     nrhs: var integer; d: ptr real; e: ptr real; b: ptr complex;
     ldb: var integer; rcond: ptr real; rank: var integer;
     work: ptr complex; rwork: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "clalsd_".}
  proc clangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr complex; ldab: var integer; work: ptr real): doublereal {.importc: "clangb_".}
  proc clange*(norm: var cstring; m: var integer; n: var integer; a: ptr complex;
     lda: var integer; work: ptr real): doublereal {.importc: "clange_".}
  proc clangt*(norm: var cstring; n: var integer; dl: ptr complex;
     d: ptr complex; du: ptr complex): doublereal {.importc: "clangt_".}
  proc clanhb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;
     ab: ptr complex; ldab: var integer; work: ptr real): doublereal {.importc: "clanhb_".}
  proc clanhe*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
     lda: var integer; work: ptr real): doublereal {.importc: "clanhe_".}
  proc clanhf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr complex; work: ptr real): doublereal {.importc: "clanhf_".}
  proc clanhp*(norm: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;
     work: ptr real): doublereal {.importc: "clanhp_".}
  proc clanhs*(norm: var cstring; n: var integer; a: ptr complex; lda: var integer;
     work: ptr real): doublereal {.importc: "clanhs_".}
  proc clanht*(norm: var cstring; n: var integer; d: ptr real; e: ptr complex): doublereal {.importc: "clanht_".}
  proc clansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;
     ab: ptr complex; ldab: var integer; work: ptr real): doublereal {.importc: "clansb_".}
  proc clansp*(norm: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;
     work: ptr real): doublereal {.importc: "clansp_".}
  proc clansy*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
     lda: var integer; work: ptr real): doublereal {.importc: "clansy_".}
  proc clantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     k: var integer; ab: ptr complex; ldab: var integer;
     work: ptr real): doublereal {.importc: "clantb_".}
  proc clantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr complex; work: ptr real): doublereal {.importc: "clantp_".}
  proc clantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;
     n: var integer; a: ptr complex; lda: var integer; work: ptr real): doublereal {.importc: "clantr_".}
  
  proc clapll*(n: var integer; x: ptr complex; incx: var integer;
     y: ptr complex; incy: var integer; ssmin: ptr real): cint {.importc: "clapll_".}
  
  proc clapmt*(forwrd: ptr logical; m: var integer; n: var integer;
     x: ptr complex; ldx: var integer; k: var integer): cint {.importc: "clapmt_".}
  
  proc claqgb*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr complex; ldab: var integer;
     r: ptr real; c: ptr real; rowcnd: ptr real;
     colcnd: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqgb_".}
  
  proc claqge*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; r: ptr real; c: ptr real;
     rowcnd: ptr real; colcnd: ptr real; amax: ptr real;
     equed: var cstring): cint {.importc: "claqge_".}
  
  proc claqhb*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;
     equed: var cstring): cint {.importc: "claqhb_".}
  
  proc claqhe*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     s: ptr real; scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqhe_".}
  
  proc claqhp*(uplo: var cstring; n: var integer; ap: ptr complex; s: ptr real;
     scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqhp_".}
  
  proc claqp2*(m: var integer; n: var integer; offset: var integer;
     a: ptr complex; lda: var integer; jpvt: var integer;
     tau: ptr complex; vn1: ptr real; vn2: ptr real;
     work: ptr complex): cint {.importc: "claqp2_".}
  
  proc claqps*(m: var integer; n: var integer; offset: var integer;
     nb: var integer; kb: var integer; a: ptr complex;
     lda: var integer; jpvt: var integer; tau: ptr complex;
     vn1: ptr real; vn2: ptr real; auxv: ptr complex; f: ptr complex;
     ldf: var integer): cint {.importc: "claqps_".}
  
  proc claqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr complex;
     ldh: var integer; w: ptr complex; iloz: var integer;
     ihiz: var integer; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "claqr0_".}
  
  proc claqr1*(n: var integer; h: ptr complex; ldh: var integer;
     s1: ptr complex; s2: ptr complex; v: ptr complex): cint {.importc: "claqr1_".}
  
  proc claqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr complex; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr complex; ldz: var integer;
     ns: var integer; nd: var integer; sh: ptr complex;
     v: ptr complex; ldv: var integer; nh: var integer;
     t: ptr complex; ldt: var integer; nv: var integer;
     wv: ptr complex; ldwv: var integer; work: ptr complex;
     lwork: var integer): cint {.importc: "claqr2_".}
  
  proc claqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr complex; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr complex; ldz: var integer;
     ns: var integer; nd: var integer; sh: ptr complex;
     v: ptr complex; ldv: var integer; nh: var integer;
     t: ptr complex; ldt: var integer; nv: var integer;
     wv: ptr complex; ldwv: var integer; work: ptr complex;
     lwork: var integer): cint {.importc: "claqr3_".}
  
  proc claqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr complex;
     ldh: var integer; w: ptr complex; iloz: var integer;
     ihiz: var integer; z: ptr complex; ldz: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "claqr4_".}
  
  proc claqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;
     n: var integer; ktop: var integer; kbot: var integer;
     nshfts: var integer; s: ptr complex; h: ptr complex;
     ldh: var integer; iloz: var integer; ihiz: var integer;
     z: ptr complex; ldz: var integer; v: ptr complex;
     ldv: var integer; u: ptr complex; ldu: var integer;
     nv: var integer; wv: ptr complex; ldwv: var integer;
     nh: var integer; wh: ptr complex; ldwh: var integer): cint {.importc: "claqr5_".}
  
  proc claqsb*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;
     equed: var cstring): cint {.importc: "claqsb_".}
  
  proc claqsp*(uplo: var cstring; n: var integer; ap: ptr complex; s: ptr real;
     scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqsp_".}
  
  proc claqsy*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     s: ptr real; scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "claqsy_".}
  
  proc clar1v*(n: var integer; b1: var integer; bn: var integer;
     lambdas: ptr real; d: ptr real; l: ptr real; ld: ptr real;
     lld: ptr real; pivmin: ptr real; gaptol: ptr real;
     z: ptr complex; wantnc: ptr logical; negcnt: var integer;
     ztz: ptr real; mingma: ptr real; r: var integer;
     isuppz: var integer; nrminv: ptr real; resid: ptr real;
     rqcorr: ptr real; work: ptr real): cint {.importc: "clar1v_".}
  
  proc clar2v*(n: var integer; x: ptr complex; y: ptr complex;
     z: ptr complex; incx: var integer; c: ptr real;
     s: ptr complex; incc: var integer): cint {.importc: "clar2v_".}
  
  proc clarcm*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     b: ptr complex; ldb: var integer; c: ptr complex;
     ldc: var integer; rwork: ptr real): cint {.importc: "clarcm_".}
  
  proc clarf*(side: var cstring; m: var integer; n: var integer; v: ptr complex;
    incv: var integer; tau: ptr complex; c: ptr complex;
    ldc: var integer; work: ptr complex): cint {.importc: "clarf_".}
  
  proc clarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer; v: ptr complex;
     ldv: var integer; t: ptr complex; ldt: var integer;
     c: ptr complex; ldc: var integer; work: ptr complex;
     ldwork: var integer): cint {.importc: "clarfb_".}
  
  proc clarfg*(n: var integer; alpha: ptr complex; x: ptr complex;
     incx: var integer; tau: ptr complex): cint {.importc: "clarfg_".}
  
  proc clarfp*(n: var integer; alpha: ptr complex; x: ptr complex;
     incx: var integer; tau: ptr complex): cint {.importc: "clarfp_".}
  
  proc clarft*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr complex; ldv: var integer;
     tau: ptr complex; t: ptr complex; ldt: var integer): cint {.importc: "clarft_".}
  
  proc clarfx*(side: var cstring; m: var integer; n: var integer; v: ptr complex;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex): cint {.importc: "clarfx_".}
  
  proc clargv*(n: var integer; x: ptr complex; incx: var integer;
     y: ptr complex; incy: var integer; c: ptr real;
     incc: var integer): cint {.importc: "clargv_".}
  
  proc clarnv*(idist: var integer; iseed: var integer; n: var integer;
     x: ptr complex): cint {.importc: "clarnv_".}
  
  proc clarrv*(n: var integer; vl: ptr real; vu: ptr real; d: ptr real;
     l: ptr real; pivmin: ptr real; isplit: var integer;
     m: var integer; dol: var integer; dou: var integer;
     minrgp: ptr real; rtol1: ptr real; rtol2: ptr real; w: ptr real;
     werr: ptr real; wgap: ptr real; iblock: var integer;
     indexw: var integer; gers: ptr real; z: ptr complex;
     ldz: var integer; isuppz: var integer; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "clarrv_".}
  
  proc clarscl2*(m: var integer; n: var integer; d: ptr real; x: ptr complex;
       ldx: var integer): cint {.importc: "clarscl2_".}
  
  proc clartg*(f: ptr complex; g: ptr complex; cs: ptr real; sn: ptr complex;
     r: ptr complex): cint {.importc: "clartg_".}
  
  proc clartv*(n: var integer; x: ptr complex; incx: var integer;
     y: ptr complex; incy: var integer; c: ptr real;
     s: ptr complex; incc: var integer): cint {.importc: "clartv_".}
  
  proc clarz*(side: var cstring; m: var integer; n: var integer; l: var integer;
    v: ptr complex; incv: var integer; tau: ptr complex;
    c: ptr complex; ldc: var integer; work: ptr complex): cint {.importc: "clarz_".}
  
  proc clarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer; l: var integer;
     v: ptr complex; ldv: var integer; t: ptr complex;
     ldt: var integer; c: ptr complex; ldc: var integer;
     work: ptr complex; ldwork: var integer): cint {.importc: "clarzb_".}
  
  proc clarzt*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr complex; ldv: var integer;
     tau: ptr complex; t: ptr complex; ldt: var integer): cint {.importc: "clarzt_".}
  
  proc clascl*(ctype: var cstring; kl: var integer; ku: var integer;
     cfrom: ptr real; cto: ptr real; m: var integer; n: var integer;
     a: ptr complex; lda: var integer; info: var integer): cint {.importc: "clascl_".}
  
  proc clascl2*(m: var integer; n: var integer; d: ptr real; x: ptr complex;
      ldx: var integer): cint {.importc: "clascl2_".}
  
  proc claset*(uplo: var cstring; m: var integer; n: var integer;
     alpha: ptr complex; beta: ptr complex; a: ptr complex;
     lda: var integer): cint {.importc: "claset_".}
  
  proc clasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;
    n: var integer; c: ptr real; s: ptr real; a: ptr complex;
    lda: var integer): cint {.importc: "clasr_".}
  
  proc classq*(n: var integer; x: ptr complex; incx: var integer;
     scale: ptr real; sumsq: ptr real): cint {.importc: "classq_".}
  
  proc claswp*(n: var integer; a: ptr complex; lda: var integer;
     k1: var integer; k2: var integer; ipiv: var cint;
     incx: var integer): cint {.importc: "claswp_".}
  
  proc clasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;
     a: ptr complex; lda: var integer; ipiv: var cint;
     w: ptr complex; ldw: var integer; info: var integer): cint {.importc: "clasyf_".}
  
  proc clatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; x: ptr complex; scale: ptr real;
     cnorm: ptr real; info: var integer): cint {.importc: "clatbs_".}
  
  proc clatdf*(ijob: var integer; n: var integer; z: ptr complex;
     ldz: var integer; rhs: ptr complex; rdsum: ptr real;
     rdscal: ptr real; ipiv: var cint; jpiv: var cint): cint {.importc: "clatdf_".}
  
  proc clatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; ap: ptr complex; x: ptr complex;
     scale: ptr real; cnorm: ptr real; info: var integer): cint {.importc: "clatps_".}
  
  proc clatrd*(uplo: var cstring; n: var integer; nb: var integer; a: ptr complex;
     lda: var integer; e: ptr real; tau: ptr complex; w: ptr complex;
     ldw: var integer): cint {.importc: "clatrd_".}
  
  proc clatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; a: ptr complex; lda: var integer;
     x: ptr complex; scale: ptr real; cnorm: ptr real;
     info: var integer): cint {.importc: "clatrs_".}
  
  proc clatrz*(m: var integer; n: var integer; l: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex): cint {.importc: "clatrz_".}
  
  proc clatzm*(side: var cstring; m: var integer; n: var integer; v: ptr complex;
     incv: var integer; tau: ptr complex; c1: ptr complex;
     c2: ptr complex; ldc: var integer; work: ptr complex): cint {.importc: "clatzm_".}
  
  proc clauu2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     info: var integer): cint {.importc: "clauu2_".}
  
  proc clauum*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     info: var integer): cint {.importc: "clauum_".}
  
  proc cpbcon*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; anorm: ptr real; rcond: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cpbcon_".}
  
  proc cpbequ*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;
     info: var integer): cint {.importc: "cpbequ_".}
  
  proc cpbrfs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr complex; ldab: var integer;
     afb: ptr complex; ldafb: var integer; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cpbrfs_".}
  
  proc cpbstf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; info: var integer): cint {.importc: "cpbstf_".}
  
  proc cpbsv*(uplo: var cstring; n: var integer; kd: var integer;
    nrhs: var integer; ab: ptr complex; ldab: var integer;
    b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cpbsv_".}
  
  proc cpbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr complex; ldab: var integer;
     afb: ptr complex; ldafb: var integer; equed: var cstring;
     s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cpbsvx_".}
  
  proc cpbtf2*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; info: var integer): cint {.importc: "cpbtf2_".}
  
  proc cpbtrf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr complex;
     ldab: var integer; info: var integer): cint {.importc: "cpbtrf_".}
  
  proc cpbtrs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr complex; ldab: var integer;
     b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cpbtrs_".}
  
  proc cpftrf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
     info: var integer): cint {.importc: "cpftrf_".}
  
  proc cpftri*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
     info: var integer): cint {.importc: "cpftri_".}
  
  proc cpftrs*(transr: var cstring; uplo: var cstring; n: var integer;
     nrhs: var integer; a: ptr complex; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "cpftrs_".}
  
  proc cpocon*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     anorm: ptr real; rcond: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cpocon_".}
  
  proc cpoequ*(n: var integer; a: ptr complex; lda: var integer; s: ptr real;
     scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "cpoequ_".}
  
  proc cpoequb*(n: var integer; a: ptr complex; lda: var integer; s: ptr real;
      scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "cpoequb_".}
  
  proc cporfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; b: ptr complex; ldb: var integer;
     x: ptr complex; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cporfs_".}
  
  proc cporfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; s: ptr real;
      b: ptr complex; ldb: var integer; x: ptr complex;
      ldx: var integer; rcond: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr complex; rwork: ptr real;
      info: var integer): cint {.importc: "cporfsx_".}
  
  proc cposv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr complex;
    lda: var integer; b: ptr complex; ldb: var integer;
    info: var integer): cint {.importc: "cposv_".}
  
  proc cposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; equed: var cstring; s: ptr real; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cposvx_".}
  
  proc cposvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; equed: var cstring;
      s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;
      ldx: var integer; rcond: ptr real; rpvgrw: ptr real;
      berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr complex;
      rwork: ptr real; info: var integer): cint {.importc: "cposvxx_".}
  
  proc cpotf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     info: var integer): cint {.importc: "cpotf2_".}
  
  proc cpotrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     info: var integer): cint {.importc: "cpotrf_".}
  
  proc cpotri*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     info: var integer): cint {.importc: "cpotri_".}
  
  proc cpotrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "cpotrs_".}
  
  proc cppcon*(uplo: var cstring; n: var integer; ap: ptr complex; anorm: ptr real;
     rcond: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cppcon_".}
  
  proc cppequ*(uplo: var cstring; n: var integer; ap: ptr complex; s: ptr real;
     scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "cppequ_".}
  
  proc cpprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; afp: ptr complex; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cpprfs_".}
  
  proc cppsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr complex; b: ptr complex; ldb: var integer;
    info: var integer): cint {.importc: "cppsv_".}
  
  proc cppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; afp: ptr complex; equed: var cstring; s: ptr real;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cppsvx_".}
  
  proc cpptrf*(uplo: var cstring; n: var integer; ap: ptr complex;
     info: var integer): cint {.importc: "cpptrf_".}
  
  proc cpptri*(uplo: var cstring; n: var integer; ap: ptr complex;
     info: var integer): cint {.importc: "cpptri_".}
  
  proc cpptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; b: ptr complex; ldb: var integer;
     info: var integer): cint {.importc: "cpptrs_".}
  
  proc cpstf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     piv: var integer; rank: var integer; tol: ptr real;
     work: ptr real; info: var integer): cint {.importc: "cpstf2_".}
  
  proc cpstrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     piv: var integer; rank: var integer; tol: ptr real;
     work: ptr real; info: var integer): cint {.importc: "cpstrf_".}
  
  proc cptcon*(n: var integer; d: ptr real; e: ptr complex; anorm: ptr real;
     rcond: ptr real; rwork: ptr real; info: var integer): cint {.importc: "cptcon_".}
  
  proc cpteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr complex; ldz: var integer; work: ptr real;
     info: var integer): cint {.importc: "cpteqr_".}
  
  proc cptrfs*(uplo: var cstring; n: var integer; nrhs: var integer; d: ptr real;
     e: ptr complex; df: ptr real; ef: ptr complex; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "cptrfs_".}
  
  proc cptsv*(n: var integer; nrhs: var integer; d: ptr real; e: ptr complex;
    b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "cptsv_".}
  
  proc cptsvx*(fact: var cstring; n: var integer; nrhs: var integer; d: ptr real;
     e: ptr complex; df: ptr real; ef: ptr complex; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "cptsvx_".}
  
  proc cpttrf*(n: var integer; d: ptr real; e: ptr complex; info: var integer): cint {.importc: "cpttrf_".}
  
  proc cpttrs*(uplo: var cstring; n: var integer; nrhs: var integer; d: ptr real;
     e: ptr complex; b: ptr complex; ldb: var integer;
     info: var integer): cint {.importc: "cpttrs_".}
  
  proc cptts2*(iuplo: var integer; n: var integer; nrhs: var integer;
     d: ptr real; e: ptr complex; b: ptr complex; ldb: var integer): cint {.importc: "cptts2_".}
  
  proc crot*(n: var integer; cx: ptr complex; incx: var integer;              cy: ptr complex; incy: var integer; c: ptr real; s: ptr complex): cint {.importc: "crot_".}
  
  proc cspcon*(uplo: var cstring; n: var integer; ap: ptr complex;
     ipiv: var cint; anorm: ptr real; rcond: ptr real;
     work: ptr complex; info: var integer): cint {.importc: "cspcon_".}
  
  proc cspmv*(uplo: var cstring; n: var integer; alpha: ptr complex;
    ap: ptr complex; x: ptr complex; incx: var integer;
    beta: ptr complex; y: ptr complex; incy: var integer): cint {.importc: "cspmv_".}
  
  proc cspr*(uplo: var cstring; n: var integer; alpha: ptr complex; x: ptr complex;              incx: var integer; ap: ptr complex): cint {.importc: "cspr_".}
  
  proc csprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; afp: ptr complex; ipiv: var cint;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "csprfs_".}
  
  proc cspsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr complex; ipiv: var cint; b: ptr complex;
    ldb: var integer; info: var integer): cint {.importc: "cspsv_".}
  
  proc cspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; afp: ptr complex; ipiv: var cint;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "cspsvx_".}
  
  proc csptrf*(uplo: var cstring; n: var integer; ap: ptr complex;
     ipiv: var cint; info: var integer): cint {.importc: "csptrf_".}
  
  proc csptri*(uplo: var cstring; n: var integer; ap: ptr complex;
     ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "csptri_".}
  
  proc csptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr complex; ipiv: var cint; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "csptrs_".}
  
  proc csrscl*(n: var integer; sa: ptr real; sx: ptr complex; incx: var integer): cint {.importc: "csrscl_".}
  
  proc cstedc*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr complex; ldz: var integer; work: ptr complex;
     lwork: var integer; rwork: ptr real; lrwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "cstedc_".}
  
  proc cstegr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;
     e: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr complex; ldz: var integer; isuppz: var integer;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "cstegr_".}
  
  proc cstein*(n: var integer; d: ptr real; e: ptr real; m: var integer;
     w: ptr real; iblock: var integer; isplit: var integer;
     z: ptr complex; ldz: var integer; work: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "cstein_".}
  
  proc cstemr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;
     e: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; m: var integer; w: ptr real; z: ptr complex;
     ldz: var integer; nzc: var integer; isuppz: var integer;
     tryrac: ptr logical; work: ptr real; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "cstemr_".}
  
  proc csteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr complex; ldz: var integer; work: ptr real;
     info: var integer): cint {.importc: "csteqr_".}
  
  proc csycon*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; anorm: ptr real; rcond: ptr real;
     work: ptr complex; info: var integer): cint {.importc: "csycon_".}
  
  proc csyequb*(uplo: var cstring; n: var integer; a: ptr complex;
      lda: var integer; s: ptr real; scond: ptr real; amax: ptr real;
      work: ptr complex; info: var integer): cint {.importc: "csyequb_".}
  
  proc csymv*(uplo: var cstring; n: var integer; alpha: ptr complex;
    a: ptr complex; lda: var integer; x: ptr complex;
    incx: var integer; beta: ptr complex; y: ptr complex;
    incy: var integer): cint {.importc: "csymv_".}
  
  proc csyr*(uplo: var cstring; n: var integer; alpha: ptr complex; x: ptr complex;              incx: var integer; a: ptr complex; lda: var integer): cint {.importc: "csyr_".}
  
  proc csyrfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; ipiv: var cint; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "csyrfs_".}
  
  proc csyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; ipiv: var cint;
      s: ptr real; b: ptr complex; ldb: var integer; x: ptr complex;
      ldx: var integer; rcond: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr complex; rwork: ptr real;
      info: var integer): cint {.importc: "csyrfsx_".}
  
  proc csysv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr complex;
    lda: var integer; ipiv: var cint; b: ptr complex;
    ldb: var integer; work: ptr complex; lwork: var integer;
    info: var integer): cint {.importc: "csysv_".}
  
  proc csysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; af: ptr complex;
     ldaf: var integer; ipiv: var cint; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real;
     work: ptr complex; lwork: var integer; rwork: ptr real;
     info: var integer): cint {.importc: "csysvx_".}
  
  proc csysvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr complex; lda: var integer;
      af: ptr complex; ldaf: var integer; ipiv: var cint;
      equed: var cstring; s: ptr real; b: ptr complex; ldb: var integer;
      x: ptr complex; ldx: var integer; rcond: ptr real;
      rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr complex;
      rwork: ptr real; info: var integer): cint {.importc: "csysvxx_".}
  
  proc csytf2*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "csytf2_".}
  
  proc csytrf*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "csytrf_".}
  
  proc csytri*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ipiv: var cint; work: ptr complex; info: var integer): cint {.importc: "csytri_".}
  
  proc csytrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr complex; lda: var integer; ipiv: var cint;
     b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "csytrs_".}
  
  proc ctbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     kd: var integer; ab: ptr complex; ldab: var integer;
     rcond: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "ctbcon_".}
  
  proc ctbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr complex;
     ldab: var integer; b: ptr complex; ldb: var integer;
     x: ptr complex; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr complex; rwork: ptr real;
     info: var integer): cint {.importc: "ctbrfs_".}
  
  proc ctbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr complex;
     ldab: var integer; b: ptr complex; ldb: var integer;
     info: var integer): cint {.importc: "ctbtrs_".}
  
  proc ctfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;
    diag: var cstring; m: var integer; n: var integer;
    alpha: ptr complex; a: ptr complex; b: ptr complex;
    ldb: var integer): cint {.importc: "ctfsm_".}
  
  proc ctftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr complex; info: var integer): cint {.importc: "ctftri_".}
  
  proc ctfttp*(transr: var cstring; uplo: var cstring; n: var integer;
     arf: ptr complex; ap: ptr complex; info: var integer): cint {.importc: "ctfttp_".}
  
  proc ctfttr*(transr: var cstring; uplo: var cstring; n: var integer;
     arf: ptr complex; a: ptr complex; lda: var integer;
     info: var integer): cint {.importc: "ctfttr_".}
  
  proc ctgevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; s: ptr complex; lds: var integer;
     p: ptr complex; ldp: var integer; vl: ptr complex;
     ldvl: var integer; vr: ptr complex; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "ctgevc_".}
  
  proc ctgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; q: ptr complex; ldq: var integer;
     z: ptr complex; ldz: var integer; j1: var integer;
     info: var integer): cint {.importc: "ctgex2_".}
  
  proc ctgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; q: ptr complex; ldq: var integer;
     z: ptr complex; ldz: var integer; ifst: var integer;
     ilst: var integer; info: var integer): cint {.importc: "ctgexc_".}
  
  proc ctgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;
     select: ptr logical; n: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     alpha: ptr complex; beta: ptr complex; q: ptr complex;
     ldq: var integer; z: ptr complex; ldz: var integer;
     m: var integer; pl: ptr real; pr: ptr real; dif: ptr real;
     work: ptr complex; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "ctgsen_".}
  
  proc ctgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; k: var integer; l: var integer;
     a: ptr complex; lda: var integer; b: ptr complex;
     ldb: var integer; tola: ptr real; tolb: ptr real;
     alpha: ptr real; beta: ptr real; u: ptr complex;
     ldu: var integer; v: ptr complex; ldv: var integer;
     q: ptr complex; ldq: var integer; work: ptr complex;
     ncycle: var integer; info: var integer): cint {.importc: "ctgsja_".}
  
  proc ctgsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; vl: ptr complex;
     ldvl: var integer; vr: ptr complex; ldvr: var integer;
     s: ptr real; dif: ptr real; mm: var integer; m: var integer;
     work: ptr complex; lwork: var integer; iwork: var integer;
     info: var integer): cint {.importc: "ctgsna_".}
  
  proc ctgsy2*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; c: ptr complex;
     ldc: var integer; d: ptr complex; ldd: var integer;
     e: ptr complex; lde: var integer; f: ptr complex;
     ldf: var integer; scale: ptr real; rdsum: ptr real;
     rdscal: ptr real; info: var integer): cint {.importc: "ctgsy2_".}
  
  proc ctgsyl*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; c: ptr complex;
     ldc: var integer; d: ptr complex; ldd: var integer;
     e: ptr complex; lde: var integer; f: ptr complex;
     ldf: var integer; scale: ptr real; dif: ptr real;
     work: ptr complex; lwork: var integer; iwork: var integer;
     info: var integer): cint {.importc: "ctgsyl_".}
  
  proc ctpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr complex; rcond: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "ctpcon_".}
  
  proc ctprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr complex; b: ptr complex;
     ldb: var integer; x: ptr complex; ldx: var integer;
     ferr: ptr real; berr: ptr real; work: ptr complex;
     rwork: ptr real; info: var integer): cint {.importc: "ctprfs_".}
  
  proc ctptri*(uplo: var cstring; diag: var cstring; n: var integer; ap: ptr complex;
     info: var integer): cint {.importc: "ctptri_".}
  
  proc ctptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr complex; b: ptr complex;
     ldb: var integer; info: var integer): cint {.importc: "ctptrs_".}
  
  proc ctpttf*(transr: var cstring; uplo: var cstring; n: var integer; ap: ptr complex;
     arf: ptr complex; info: var integer): cint {.importc: "ctpttf_".}
  
  proc ctpttr*(uplo: var cstring; n: var integer; ap: ptr complex; a: ptr complex;
     lda: var integer; info: var integer): cint {.importc: "ctpttr_".}
  
  proc ctrcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr complex; lda: var integer; rcond: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "ctrcon_".}
  
  proc ctrevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr complex; ldt: var integer;
     vl: ptr complex; ldvl: var integer; vr: ptr complex;
     ldvr: var integer; mm: var integer; m: var integer;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "ctrevc_".}
  
  proc ctrexc*(compq: var cstring; n: var integer; t: ptr complex;
     ldt: var integer; q: ptr complex; ldq: var integer;
     ifst: var integer; ilst: var integer; info: var integer): cint {.importc: "ctrexc_".}
  
  proc ctrrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; x: ptr complex;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr complex; rwork: ptr real; info: var integer): cint {.importc: "ctrrfs_".}
  
  proc ctrsen*(job: var cstring; compq: var cstring; select: ptr logical;
     n: var integer; t: ptr complex; ldt: var integer;
     q: ptr complex; ldq: var integer; w: ptr complex;
     m: var integer; s: ptr real; sep: ptr real; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "ctrsen_".}
  
  proc ctrsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr complex; ldt: var integer;
     vl: ptr complex; ldvl: var integer; vr: ptr complex;
     ldvr: var integer; s: ptr real; sep: ptr real; mm: var integer;
     m: var integer; work: ptr complex; ldwork: var integer;
     rwork: ptr real; info: var integer): cint {.importc: "ctrsna_".}
  
  proc ctrsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;
     m: var integer; n: var integer; a: ptr complex;
     lda: var integer; b: ptr complex; ldb: var integer;
     c: ptr complex; ldc: var integer; scale: ptr real;
     info: var integer): cint {.importc: "ctrsyl_".}
  
  proc ctrti2*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr complex;
     lda: var integer; info: var integer): cint {.importc: "ctrti2_".}
  
  proc ctrtri*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr complex;
     lda: var integer; info: var integer): cint {.importc: "ctrtri_".}
  
  proc ctrtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr complex; lda: var integer;
     b: ptr complex; ldb: var integer; info: var integer): cint {.importc: "ctrtrs_".}
  
  proc ctrttf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr complex;
     lda: var integer; arf: ptr complex; info: var integer): cint {.importc: "ctrttf_".}
  
  proc ctrttp*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     ap: ptr complex; info: var integer): cint {.importc: "ctrttp_".}
  
  proc ctzrqf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; info: var integer): cint {.importc: "ctzrqf_".}
  
  proc ctzrzf*(m: var integer; n: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "ctzrzf_".}
  
  proc cung2l*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cung2l_".}
  
  proc cung2r*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cung2r_".}
  
  proc cungbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;
     a: ptr complex; lda: var integer; tau: ptr complex;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cungbr_".}
  
  proc cunghr*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr complex; lda: var integer; tau: ptr complex;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunghr_".}
  
  proc cungl2*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cungl2_".}
  
  proc cunglq*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cunglq_".}
  
  proc cungql*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cungql_".}
  
  proc cungqr*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cungqr_".}
  
  proc cungr2*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     info: var integer): cint {.importc: "cungr2_".}
  
  proc cungrq*(m: var integer; n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; work: ptr complex;
     lwork: var integer; info: var integer): cint {.importc: "cungrq_".}
  
  proc cungtr*(uplo: var cstring; n: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "cungtr_".}
  
  proc cunm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; info: var integer): cint {.importc: "cunm2l_".}
  
  proc cunm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; info: var integer): cint {.importc: "cunm2r_".}
  
  proc cunmbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;
     n: var integer; k: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; c: ptr complex;
     ldc: var integer; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "cunmbr_".}
  
  proc cunmhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; c: ptr complex;
     ldc: var integer; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "cunmhr_".}
  
  proc cunml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; info: var integer): cint {.importc: "cunml2_".}
  
  proc cunmlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmlq_".}
  
  proc cunmql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmql_".}
  
  proc cunmqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmqr_".}
  
  proc cunmr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; info: var integer): cint {.importc: "cunmr2_".}
  
  proc cunmr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; c: ptr complex;
     ldc: var integer; work: ptr complex; info: var integer): cint {.importc: "cunmr3_".}
  
  proc cunmrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmrq_".}
  
  proc cunmrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr complex;
     lda: var integer; tau: ptr complex; c: ptr complex;
     ldc: var integer; work: ptr complex; lwork: var integer;
     info: var integer): cint {.importc: "cunmrz_".}
  
  proc cunmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; a: ptr complex; lda: var integer;
     tau: ptr complex; c: ptr complex; ldc: var integer;
     work: ptr complex; lwork: var integer; info: var integer): cint {.importc: "cunmtr_".}
  
  proc cupgtr*(uplo: var cstring; n: var integer; ap: ptr complex;
     tau: ptr complex; q: ptr complex; ldq: var integer;
     work: ptr complex; info: var integer): cint {.importc: "cupgtr_".}
  
  proc cupmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; ap: ptr complex; tau: ptr complex;
     c: ptr complex; ldc: var integer; work: ptr complex;
     info: var integer): cint {.importc: "cupmtr_".}
  
  #___________________________________________________________________________
  #
  # Real, double precision
  #___________________________________________________________________________

  proc dbdsdc*(uplo: var cstring; compq: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; u: ptr doublereal;
     ldu: var integer; vt: ptr doublereal; ldvt: var integer;
     q: ptr doublereal; iq: var integer; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dbdsdc_".}
  
  proc dbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;
     nru: var integer; ncc: var integer; d: ptr doublereal;
     e: ptr doublereal; vt: ptr doublereal; ldvt: var integer;
     u: ptr doublereal; ldu: var integer; c: ptr doublereal;
     ldc: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dbdsqr_".}
  
  proc ddisna*(job: var cstring; m: var integer; n: var integer;
     d: ptr doublereal; sep: ptr doublereal; info: var integer): cint {.importc: "ddisna_".}
  
  proc dgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;
     kl: var integer; ku: var integer; ab: ptr doublereal;
     ldab: var integer; d: ptr doublereal; e: ptr doublereal;
     q: ptr doublereal; ldq: var integer; pt: ptr doublereal;
     ldpt: var integer; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dgbbrd_".}
  
  proc dgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr doublereal; ldab: var integer; ipiv: var cint;
     anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgbcon_".}
  
  proc dgbequ*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublereal; ldab: var integer;
     r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; info: var integer): cint {.importc: "dgbequ_".}
  
  proc dgbequb*(m: var integer; n: var integer; kl: var integer;
      ku: var integer; ab: ptr doublereal; ldab: var integer;
      r: ptr doublereal; c: ptr doublereal;
      rowcnd: ptr doublereal; colcnd: ptr doublereal;
      amax: ptr doublereal; info: var integer): cint {.importc: "dgbequb_".}
  
  proc dgbrfs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr doublereal;
     ldab: var integer; afb: ptr doublereal; ldafb: var integer;
     ipiv: var cint; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dgbrfs_".}
  
  proc dgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;
      kl: var integer; ku: var integer; nrhs: var integer;
      ab: ptr doublereal; ldab: var integer; afb: ptr doublereal;
      ldafb: var integer; ipiv: var cint; r: ptr doublereal;
      c: ptr doublereal; b: ptr doublereal; ldb: var integer;
      x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dgbrfsx_".}
  
  proc dgbsv*(n: var integer; kl: var integer; ku: var integer;
    nrhs: var integer; ab: ptr doublereal; ldab: var integer;
    ipiv: var cint; b: ptr doublereal; ldb: var integer;
    info: var integer): cint {.importc: "dgbsv_".}
  
  proc dgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr doublereal;
     ldab: var integer; afb: ptr doublereal; ldafb: var integer;
     ipiv: var cint; equed: var cstring; r: ptr doublereal;
     c: ptr doublereal; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgbsvx_".}
  
  proc dgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
      ku: var integer; nrhs: var integer; ab: ptr doublereal;
      ldab: var integer; afb: ptr doublereal; ldafb: var integer;
      ipiv: var cint; equed: var cstring; r: ptr doublereal;
      c: ptr doublereal; b: ptr doublereal; ldb: var integer;
      x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
      rpvgrw: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dgbsvxx_".}
  
  proc dgbtf2*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublereal; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "dgbtf2_".}
  
  proc dgbtrf*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublereal; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "dgbtrf_".}
  
  proc dgbtrs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr doublereal;
     ldab: var integer; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dgbtrs_".}
  
  proc dgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; scale: ptr doublereal; m: var integer;
     v: ptr doublereal; ldv: var integer; info: var integer): cint {.importc: "dgebak_".}
  
  proc dgebal*(job: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; ilo: var integer; ihi: var integer;
     scale: ptr doublereal; info: var integer): cint {.importc: "dgebal_".}
  
  proc dgebd2*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tauq: ptr doublereal; taup: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dgebd2_".}
  
  proc dgebrd*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tauq: ptr doublereal; taup: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dgebrd_".}
  
  proc dgecon*(norm: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgecon_".}
  
  proc dgeequ*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; info: var integer): cint {.importc: "dgeequ_".}
  
  proc dgeequb*(m: var integer; n: var integer; a: ptr doublereal;
      lda: var integer; r: ptr doublereal; c: ptr doublereal;
      rowcnd: ptr doublereal; colcnd: ptr doublereal;
      amax: ptr doublereal; info: var integer): cint {.importc: "dgeequb_".}
  
  proc dgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;
    a: ptr doublereal; lda: var integer; sdim: var integer;
    wr: ptr doublereal; wi: ptr doublereal; vs: ptr doublereal;
    ldvs: var integer; work: ptr doublereal; lwork: var integer;
    bwork: ptr logical; info: var integer): cint {.importc: "dgees_".}
  
  proc dgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;
     n: var integer; a: ptr doublereal; lda: var integer;
     sdim: var integer; wr: ptr doublereal; wi: ptr doublereal;
     vs: ptr doublereal; ldvs: var integer; rconde: ptr doublereal;
     rcondv: ptr doublereal; work: ptr doublereal;
     lwork: var integer; iwork: var integer; liwork: var integer;
     bwork: ptr logical; info: var integer): cint {.importc: "dgeesx_".}
  
  proc dgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; wr: ptr doublereal;
    wi: ptr doublereal; vl: ptr doublereal; ldvl: var integer;
    vr: ptr doublereal; ldvr: var integer; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dgeev_".}
  
  proc dgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr doublereal; lda: var integer;
     wr: ptr doublereal; wi: ptr doublereal; vl: ptr doublereal;
     ldvl: var integer; vr: ptr doublereal; ldvr: var integer;
     ilo: var integer; ihi: var integer; scale: ptr doublereal;
     abnrm: ptr doublereal; rconde: ptr doublereal;
     rcondv: ptr doublereal; work: ptr doublereal;
     lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "dgeevx_".}
  
  proc dgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer; alphar: ptr doublereal; alphai: ptr doublereal;
    beta: ptr doublereal; vsl: ptr doublereal; ldvsl: var integer;
    vsr: ptr doublereal; ldvsr: var integer; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dgegs_".}
  
  proc dgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer; alphar: ptr doublereal; alphai: ptr doublereal;
    beta: ptr doublereal; vl: ptr doublereal; ldvl: var integer;
    vr: ptr doublereal; ldvr: var integer; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dgegv_".}
  
  proc dgehd2*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dgehd2_".}
  
  proc dgehrd*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dgehrd_".}
  
  proc dgejsv*(joba: var cstring; jobu: var cstring; jobv: var cstring; jobr: var cstring;
     jobt: var cstring; jobp: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; sva: ptr doublereal;
     u: ptr doublereal; ldu: var integer; v: ptr doublereal;
     ldv: var integer; work: ptr doublereal; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "dgejsv_".}
  
  proc dgelq2*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     info: var integer): cint {.importc: "dgelq2_".}
  
  proc dgelqf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dgelqf_".}
  
  proc dgels*(trans: var cstring; m: var integer; n: var integer;
    nrhs: var integer; a: ptr doublereal; lda: var integer;
    b: ptr doublereal; ldb: var integer; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dgels_".}
  
  proc dgelsd*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;
     rank: var integer; work: ptr doublereal; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "dgelsd_".}
  
  proc dgelss*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;
     rank: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dgelss_".}
  
  proc dgelsx*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; jpvt: var integer; rcond: ptr doublereal;
     rank: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dgelsx_".}
  
  proc dgelsy*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; jpvt: var integer; rcond: ptr doublereal;
     rank: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dgelsy_".}
  
  proc dgeql2*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     info: var integer): cint {.importc: "dgeql2_".}
  
  proc dgeqlf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dgeqlf_".}
  
  proc dgeqp3*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; jpvt: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dgeqp3_".}
  
  proc dgeqpf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; jpvt: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dgeqpf_".}
  
  proc dgeqr2*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     info: var integer): cint {.importc: "dgeqr2_".}
  
  proc dgeqrf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dgeqrf_".}
  
  proc dgerfs*(trans: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; af: ptr doublereal;
     ldaf: var integer; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgerfs_".}
  
  proc dgerfsx*(trans: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublereal; lda: var integer;
      af: ptr doublereal; ldaf: var integer; ipiv: var cint;
      r: ptr doublereal; c: ptr doublereal; b: ptr doublereal;
      ldb: var integer; x: ptr doublereal; ldx: var integer;
      rcond: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dgerfsx_".}
  
  proc dgerq2*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     info: var integer): cint {.importc: "dgerq2_".}
  
  proc dgerqf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dgerqf_".}
  
  proc dgesc2*(n: var integer; a: ptr doublereal; lda: var integer;
     rhs: ptr doublereal; ipiv: var cint; jpiv: var cint;
     scale: ptr doublereal): cint {.importc: "dgesc2_".}
  
  proc dgesdd*(jobz: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; s: ptr doublereal;
     u: ptr doublereal; ldu: var integer; vt: ptr doublereal;
     ldvt: var integer; work: ptr doublereal; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "dgesdd_".}
  
  proc dgesv*(n: var integer; nrhs: var integer; a: ptr doublereal;
    lda: var integer; ipiv: ptr cint; b: ptr doublereal;
    ldb: var integer; info: var integer): cint {.importc: "dgesv_".}
  
  proc dgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; s: ptr doublereal;
     u: ptr doublereal; ldu: var integer; vt: ptr doublereal;
     ldvt: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dgesvd_".}
  
  proc dgesvj*(joba: var cstring; jobu: var cstring; jobv: var cstring; m: var integer;
     n: var integer; a: ptr doublereal; lda: var integer;
     sva: ptr doublereal; mv: var integer; v: ptr doublereal;
     ldv: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dgesvj_".}
  
  proc dgesvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublereal; lda: var integer;
     af: ptr doublereal; ldaf: var integer; ipiv: var cint;
     equed: var cstring; r: ptr doublereal; c: ptr doublereal;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dgesvx_".}
  
  proc dgesvxx*(fact: var cstring; trans: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublereal; lda: var integer;
      af: ptr doublereal; ldaf: var integer; ipiv: var cint;
      equed: var cstring; r: ptr doublereal; c: ptr doublereal;
      b: ptr doublereal; ldb: var integer; x: ptr doublereal;
      ldx: var integer; rcond: ptr doublereal;
      rpvgrw: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dgesvxx_".}
  
  proc dgetc2*(n: var integer; a: ptr doublereal; lda: var integer;
     ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "dgetc2_".}
  
  proc dgetf2*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "dgetf2_".}
  
  proc dgetrf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "dgetrf_".}
  
  proc dgetri*(n: var integer; a: ptr doublereal; lda: var integer;
     ipiv: var cint; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dgetri_".}
  
  proc dgetrs*(trans: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; ipiv: var cint;
     b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dgetrs_".}
  
  proc dggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr doublereal;
     rscale: ptr doublereal; m: var integer; v: ptr doublereal;
     ldv: var integer; info: var integer): cint {.importc: "dggbak_".}
  
  proc dggbal*(job: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     ilo: var integer; ihi: var integer; lscale: ptr doublereal;
     rscale: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dggbal_".}
  
  proc dgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
    n: var integer; a: ptr doublereal; lda: var integer;
    b: ptr doublereal; ldb: var integer; sdim: var integer;
    alphar: ptr doublereal; alphai: ptr doublereal;
    beta: ptr doublereal; vsl: ptr doublereal; ldvsl: var integer;
    vsr: ptr doublereal; ldvsr: var integer; work: ptr doublereal;
    lwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "dgges_".}
  
  proc dggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
     sense: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     sdim: var integer; alphar: ptr doublereal;
     alphai: ptr doublereal; beta: ptr doublereal;
     vsl: ptr doublereal; ldvsl: var integer; vsr: ptr doublereal;
     ldvsr: var integer; rconde: ptr doublereal;
     rcondv: ptr doublereal; work: ptr doublereal;
     lwork: var integer; iwork: var integer; liwork: var integer;
     bwork: ptr logical; info: var integer): cint {.importc: "dggesx_".}
  
  proc dggev*(jobvl: var cstring; jobvr: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer; alphar: ptr doublereal; alphai: ptr doublereal;
    beta: ptr doublereal; vl: ptr doublereal; ldvl: var integer;
    vr: ptr doublereal; ldvr: var integer; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dggev_".}
  
  proc dggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; alphar: ptr doublereal;
     alphai: ptr doublereal; beta: ptr doublereal;
     vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;
     ldvr: var integer; ilo: var integer; ihi: var integer;
     lscale: ptr doublereal; rscale: ptr doublereal;
     abnrm: ptr doublereal; bbnrm: ptr doublereal;
     rconde: ptr doublereal; rcondv: ptr doublereal;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     bwork: ptr logical; info: var integer): cint {.importc: "dggevx_".}
  
  proc dggglm*(n: var integer; m: var integer; p: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; d: ptr doublereal; x: ptr doublereal;
     y: ptr doublereal; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dggglm_".}
  
  proc dgghrd*(compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     q: ptr doublereal; ldq: var integer; z: ptr doublereal;
     ldz: var integer; info: var integer): cint {.importc: "dgghrd_".}
  
  proc dgglse*(m: var integer; n: var integer; p: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; c: ptr doublereal; d: ptr doublereal;
     x: ptr doublereal; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dgglse_".}
  
  proc dggqrf*(n: var integer; m: var integer; p: var integer;
     a: ptr doublereal; lda: var integer; taua: ptr doublereal;
     b: ptr doublereal; ldb: var integer; taub: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dggqrf_".}
  
  proc dggrqf*(m: var integer; p: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; taua: ptr doublereal;
     b: ptr doublereal; ldb: var integer; taub: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dggrqf_".}
  
  proc dggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     n: var integer; p: var integer; k: var integer; l: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; alpha: ptr doublereal; beta: ptr doublereal;
     u: ptr doublereal; ldu: var integer; v: ptr doublereal;
     ldv: var integer; q: ptr doublereal; ldq: var integer;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dggsvd_".}
  
  proc dggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     tola: ptr doublereal; tolb: ptr doublereal; k: var integer;
     l: var integer; u: ptr doublereal; ldu: var integer;
     v: ptr doublereal; ldv: var integer; q: ptr doublereal;
     ldq: var integer; iwork: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dggsvp_".}
  
  proc dgsvj0*(jobv: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; d: ptr doublereal;
     sva: ptr doublereal; mv: var integer; v: ptr doublereal;
     ldv: var integer; eps: ptr doublereal; sfmin: ptr doublereal;
     tol: ptr doublereal; nsweep: var integer; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dgsvj0_".}
  
  proc dgsvj1*(jobv: var cstring; m: var integer; n: var integer; n1: var integer;
     a: ptr doublereal; lda: var integer; d: ptr doublereal;
     sva: ptr doublereal; mv: var integer; v: ptr doublereal;
     ldv: var integer; eps: ptr doublereal; sfmin: ptr doublereal;
     tol: ptr doublereal; nsweep: var integer; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dgsvj1_".}
  
  proc dgtcon*(norm: var cstring; n: var integer; dl: ptr doublereal;
     d: ptr doublereal; du: ptr doublereal; du2: ptr doublereal;
     ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgtcon_".}
  
  proc dgtrfs*(trans: var cstring; n: var integer; nrhs: var integer;
     dl: ptr doublereal; d: ptr doublereal; du: ptr doublereal;
     dlf: ptr doublereal; df: ptr doublereal; duf: ptr doublereal;
     du2: ptr doublereal; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dgtrfs_".}
  
  proc dgtsv*(n: var integer; nrhs: var integer; dl: ptr doublereal;
    d: ptr doublereal; du: ptr doublereal; b: ptr doublereal;
    ldb: var integer; info: var integer): cint {.importc: "dgtsv_".}
  
  proc dgtsvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; dl: ptr doublereal; d: ptr doublereal;
     du: ptr doublereal; dlf: ptr doublereal; df: ptr doublereal;
     duf: ptr doublereal; du2: ptr doublereal; ipiv: var cint;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dgtsvx_".}
  
  proc dgttrf*(n: var integer; dl: ptr doublereal; d: ptr doublereal;
     du: ptr doublereal; du2: ptr doublereal; ipiv: var cint;
     info: var integer): cint {.importc: "dgttrf_".}
  
  proc dgttrs*(trans: var cstring; n: var integer; nrhs: var integer;
     dl: ptr doublereal; d: ptr doublereal; du: ptr doublereal;
     du2: ptr doublereal; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dgttrs_".}
  
  proc dgtts2*(itrans: var integer; n: var integer; nrhs: var integer;
     dl: ptr doublereal; d: ptr doublereal; du: ptr doublereal;
     du2: ptr doublereal; ipiv: var cint; b: ptr doublereal;
     ldb: var integer): cint {.importc: "dgtts2_".}
  
  proc dhgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublereal;
     ldh: var integer; t: ptr doublereal; ldt: var integer;
     alphar: ptr doublereal; alphai: ptr doublereal;
     beta: ptr doublereal; q: ptr doublereal; ldq: var integer;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dhgeqz_".}
  
  proc dhsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;
     select: ptr logical; n: var integer; h: ptr doublereal;
     ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;
     vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;
     ldvr: var integer; mm: var integer; m: var integer;
     work: ptr doublereal; ifaill: var integer; ifailr: var integer;
     info: var integer): cint {.importc: "dhsein_".}
  
  proc dhseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; h: ptr doublereal; ldh: var integer;
     wr: ptr doublereal; wi: ptr doublereal; z: ptr doublereal;
     ldz: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dhseqr_".}
  proc disnan*(din: ptr doublereal): logical {.importc: "disnan_".}
  
  proc dla_gbamv*(trans: var integer; m: var integer; n: var integer;
         kl: var integer; ku: var integer; alpha: ptr doublereal;
         ab: ptr doublereal; ldab: var integer; x: ptr doublereal;
         incx: var integer; beta: ptr doublereal; y: ptr doublereal;
         incy: var integer): cint {.importc: "dla_gbamv__".}
  proc dla_gbrcond*(trans: var cstring; n: var integer; kl: var integer;
           ku: var integer; ab: ptr doublereal; ldab: var integer;
           afb: ptr doublereal; ldafb: var integer;
           ipiv: var cint; cmode: var integer;
           c: ptr doublereal; info: var integer;
           work: ptr doublereal; iwork: var integer;
           trans_len: ftnlen): doublereal {.importc: "dla_gbrcond__".}
  
  proc dla_gbrfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    kl: var integer; ku: var integer;
    
    nrhs: var integer; ab: ptr doublereal;
    
    ldab: var integer; afb: ptr doublereal;
    
    ldafb: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr doublereal;
    
    b: ptr doublereal; ldb: var integer;
    
    y: ptr doublereal; ldy: var integer;
    
    berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublereal;
    
    ayb: ptr doublereal; dy: ptr doublereal;
    
    y_tail: ptr doublereal; rcond: ptr doublereal;
    
    ithresh: var integer; rthresh: ptr doublereal;
    
    dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer): cint {.importc: "dla_gbrfsx_extended__".}
  proc dla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;
            ncols: var integer; ab: ptr doublereal;
            ldab: var integer; afb: ptr doublereal;
            ldafb: var integer): doublereal {.importc: "dla_gbrpvgrw__".}
  
  proc dla_geamv*(trans: var integer; m: var integer; n: var integer;
         alpha: ptr doublereal; a: ptr doublereal; lda: var integer;
         x: ptr doublereal; incx: var integer; beta: ptr doublereal;
         y: ptr doublereal; incy: var integer): cint {.importc: "dla_geamv__".}
  proc dla_gercond*(trans: var cstring; n: var integer; a: ptr doublereal;
           lda: var integer; af: ptr doublereal; ldaf: var integer;
           ipiv: var cint; cmode: var integer;
           c: ptr doublereal; info: var integer;
           work: ptr doublereal; iwork: var integer;
           trans_len: ftnlen): doublereal {.importc: "dla_gercond__".}
  
  proc dla_gerfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    nrhs: var integer; a: ptr doublereal;
    
    lda: var integer; af: ptr doublereal;
    
    ldaf: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr doublereal;
    
    b: ptr doublereal; ldb: var integer;
    
    y: ptr doublereal; ldy: var integer;
    
    berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublereal;
    
    ayb: ptr doublereal; dy: ptr doublereal;
    
    y_tail: ptr doublereal; rcond: ptr doublereal;
    
    ithresh: var integer; rthresh: ptr doublereal;
    
    dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer): cint {.importc: "dla_gerfsx_extended__".}
  
  proc dla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;
            res: ptr doublereal; ayb: ptr doublereal;
            berr: ptr doublereal): cint {.importc: "dla_lin_berr__".}
  proc dla_porcond*(uplo: var cstring; n: var integer; a: ptr doublereal;
           lda: var integer; af: ptr doublereal; ldaf: var integer;
           cmode: var integer; c: ptr doublereal;
           info: var integer; work: ptr doublereal;
           iwork: var integer; uplo_len: ftnlen): doublereal {.importc: "dla_porcond__".}
  
  proc dla_porfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer;
    
    a: ptr doublereal; lda: var integer;
    
    af: ptr doublereal; ldaf: var integer;
    
    colequ: ptr logical; c: ptr doublereal;
    
    b: ptr doublereal; ldb: var integer;
    
    y: ptr doublereal; ldy: var integer;
    
    berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublereal;
    
    ayb: ptr doublereal; dy: ptr doublereal;
    
    y_tail: ptr doublereal; rcond: ptr doublereal;
    
    ithresh: var integer; rthresh: ptr doublereal;
    
    dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer;
    
    uplo_len: ftnlen): cint {.importc: "dla_porfsx_extended__".}
  proc dla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr doublereal;
            lda: var integer; af: ptr doublereal; ldaf: var integer;
            work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "dla_porpvgrw__".}
  proc dla_rpvgrw*(n: var integer; ncols: var integer; a: ptr doublereal;
          lda: var integer; af: ptr doublereal; ldaf: var integer): doublereal {.importc: "dla_rpvgrw__".}
  
  proc dla_syamv*(uplo: var integer; n: var integer; alpha: ptr doublereal;
         a: ptr doublereal; lda: var integer; x: ptr doublereal;
         incx: var integer; beta: ptr doublereal; y: ptr doublereal;
         incy: var integer): cint {.importc: "dla_syamv__".}
  proc dla_syrcond*(uplo: var cstring; n: var integer; a: ptr doublereal;
           lda: var integer; af: ptr doublereal; ldaf: var integer;
           ipiv: var cint; cmode: var integer;
           c: ptr doublereal; info: var integer;
           work: ptr doublereal; iwork: var integer; uplo_len: ftnlen): doublereal {.importc: "dla_syrcond__".}
  
  proc dla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer;
    
    a: ptr doublereal; lda: var integer;
    
    af: ptr doublereal; ldaf: var integer;
    
    ipiv: var cint; colequ: ptr logical;
    
    c: ptr doublereal; b: ptr doublereal;
    
    ldb: var integer; y: ptr doublereal;
    
    ldy: var integer; berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublereal;
    
    ayb: ptr doublereal; dy: ptr doublereal;
    
    y_tail: ptr doublereal; rcond: ptr doublereal;
    
    ithresh: var integer; rthresh: ptr doublereal;
    
    dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer;
    
    uplo_len: ftnlen): cint {.importc: "dla_syrfsx_extended__".}
  proc dla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;
            a: ptr doublereal; lda: var integer; af: ptr doublereal;
            ldaf: var integer; ipiv: var cint;
            work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "dla_syrpvgrw__".}
  
  proc dla_wwaddw*(n: var integer; x: ptr doublereal; y: ptr doublereal;
          w: ptr doublereal): cint {.importc: "dla_wwaddw__".}
  
  proc dlabad*(small: ptr doublereal; large: ptr doublereal): cint {.importc: "dlabad_".}
  
  proc dlabrd*(m: var integer; n: var integer; nb: var integer;
     a: ptr doublereal; lda: var integer; d: ptr doublereal;
     e: ptr doublereal; tauq: ptr doublereal; taup: ptr doublereal;
     x: ptr doublereal; ldx: var integer; y: ptr doublereal;
     ldy: var integer): cint {.importc: "dlabrd_".}
  
  proc dlacn2*(n: var integer; v: ptr doublereal; x: ptr doublereal;
     isgn: var integer; est: ptr doublereal; kase: var integer;
     isave: var integer): cint {.importc: "dlacn2_".}
  
  proc dlacon*(n: var integer; v: ptr doublereal; x: ptr doublereal;
     isgn: var integer; est: ptr doublereal; kase: var integer): cint {.importc: "dlacon_".}
  
  proc dlacpy*(uplo: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer): cint {.importc: "dlacpy_".}
  
  proc dladiv*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;
     d: ptr doublereal; p: ptr doublereal; q: ptr doublereal): cint {.importc: "dladiv_".}
  
  proc dlae2*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;
    rt1: ptr doublereal; rt2: ptr doublereal): cint {.importc: "dlae2_".}
  
  proc dlaebz*(ijob: var integer; nitmax: var integer; n: var integer;
     mmax: var integer; minp: var integer; nbmin: var integer;
     abstol: ptr doublereal; reltol: ptr doublereal;
     pivmin: ptr doublereal; d: ptr doublereal; e: ptr doublereal;
     e2: ptr doublereal; nval: var integer; ab: ptr doublereal;
     c: ptr doublereal; mout: var integer; nab: var integer;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dlaebz_".}
  
  proc dlaed0*(icompq: var integer; qsiz: var integer; n: var integer;
     d: ptr doublereal; e: ptr doublereal; q: ptr doublereal;
     ldq: var integer; qstore: ptr doublereal; ldqs: var integer;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dlaed0_".}
  
  proc dlaed1*(n: var integer; d: ptr doublereal; q: ptr doublereal;
     ldq: var integer; indxq: var integer; rho: ptr doublereal;
     cutpnt: var integer; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dlaed1_".}
  
  proc dlaed2*(k: var integer; n: var integer; n1: var integer;
     d: ptr doublereal; q: ptr doublereal; ldq: var integer;
     indxq: var integer; rho: ptr doublereal; z: ptr doublereal;
     dlamda: ptr doublereal; w: ptr doublereal; q2: ptr doublereal;
     indx: var integer; indxc: var integer; indxp: var integer;
     coltyp: var integer; info: var integer): cint {.importc: "dlaed2_".}
  
  proc dlaed3*(k: var integer; n: var integer; n1: var integer;
     d: ptr doublereal; q: ptr doublereal; ldq: var integer;
     rho: ptr doublereal; dlamda: ptr doublereal; q2: ptr doublereal;
     indx: var integer; ctot: var integer; w: ptr doublereal;
     s: ptr doublereal; info: var integer): cint {.importc: "dlaed3_".}
  
  proc dlaed4*(n: var integer; i: var integer; d: ptr doublereal;
     z: ptr doublereal; delta: ptr doublereal; rho: ptr doublereal;
     dlam: ptr doublereal; info: var integer): cint {.importc: "dlaed4_".}
  
  proc dlaed5*(i: var integer; d: ptr doublereal; z: ptr doublereal;
     delta: ptr doublereal; rho: ptr doublereal; dlam: ptr doublereal): cint {.importc: "dlaed5_".}
  
  proc dlaed6*(kniter: var integer; orgati: ptr logical; rho: ptr doublereal;
     d: ptr doublereal; z: ptr doublereal; finit: ptr doublereal;
     tau: ptr doublereal; info: var integer): cint {.importc: "dlaed6_".}
  
  proc dlaed7*(icompq: var integer; n: var integer; qsiz: var integer;
     tlvls: var integer; curlvl: var integer; curpbm: var integer;
     d: ptr doublereal; q: ptr doublereal; ldq: var integer;
     indxq: var integer; rho: ptr doublereal; cutpnt: var integer;
     qstore: ptr doublereal; qptr: var integer; prmptr: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     givnum: ptr doublereal; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dlaed7_".}
  
  proc dlaed8*(icompq: var integer; k: var integer; n: var integer;
     qsiz: var integer; d: ptr doublereal; q: ptr doublereal;
     ldq: var integer; indxq: var integer; rho: ptr doublereal;
     cutpnt: var integer; z: ptr doublereal;
     dlamda: ptr doublereal; q2: ptr doublereal; ldq2: var integer;
     w: ptr doublereal; perm: var integer; givptr: var integer;
     givcol: var integer; givnum: ptr doublereal; indxp: var integer;
     indx: var integer; info: var integer): cint {.importc: "dlaed8_".}
  
  proc dlaed9*(k: var integer; kstart: var integer; kstop: var integer;
     n: var integer; d: ptr doublereal; q: ptr doublereal;
     ldq: var integer; rho: ptr doublereal; dlamda: ptr doublereal;
     w: ptr doublereal; s: ptr doublereal; lds: var integer;
     info: var integer): cint {.importc: "dlaed9_".}
  
  proc dlaeda*(n: var integer; tlvls: var integer; curlvl: var integer;
     curpbm: var integer; prmptr: var integer; perm: var integer;
     givptr: var integer; givcol: var integer;
     givnum: ptr doublereal; q: ptr doublereal; qptr: var integer;
     z: ptr doublereal; ztemp: ptr doublereal; info: var integer): cint {.importc: "dlaeda_".}
  
  proc dlaein*(rightv: ptr logical; noinit: ptr logical; n: var integer;
     h: ptr doublereal; ldh: var integer; wr: ptr doublereal;
     wi: ptr doublereal; vr: ptr doublereal; vi: ptr doublereal;
     b: ptr doublereal; ldb: var integer; work: ptr doublereal;
     eps3: ptr doublereal; smlnum: ptr doublereal;
     bignum: ptr doublereal; info: var integer): cint {.importc: "dlaein_".}
  
  proc dlaev2*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;
     rt1: ptr doublereal; rt2: ptr doublereal; cs1: ptr doublereal;
     sn1: ptr doublereal): cint {.importc: "dlaev2_".}
  
  proc dlaexc*(wantq: ptr logical; n: var integer; t: ptr doublereal;
     ldt: var integer; q: ptr doublereal; ldq: var integer;
     j1: var integer; n1: var integer; n2: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dlaexc_".}
  
  proc dlag2*(a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer; safmin: ptr doublereal; scale1: ptr doublereal;
    scale2: ptr doublereal; wr1: ptr doublereal; wr2: ptr doublereal;
    wi: ptr doublereal): cint {.importc: "dlag2_".}
  
  proc dlag2s*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; sa: ptr real; ldsa: var integer;
     info: var integer): cint {.importc: "dlag2s_".}
  
  proc dlags2*(upper: ptr logical; a1: ptr doublereal; a2: ptr doublereal;
     a3: ptr doublereal; b1: ptr doublereal; b2: ptr doublereal;
     b3: ptr doublereal; csu: ptr doublereal; snu: ptr doublereal;
     csv: ptr doublereal; snv: ptr doublereal; csq: ptr doublereal;
     snq: ptr doublereal): cint {.importc: "dlags2_".}
  
  proc dlagtf*(n: var integer; a: ptr doublereal; lambdas: ptr doublereal;
     b: ptr doublereal; c: ptr doublereal; tol: ptr doublereal;
     d: ptr doublereal; pm: var integer; info: var integer): cint {.importc: "dlagtf_".}
  
  proc dlagtm*(trans: var cstring; n: var integer; nrhs: var integer;
     alpha: ptr doublereal; dl: ptr doublereal; d: ptr doublereal;
     du: ptr doublereal; x: ptr doublereal; ldx: var integer;
     beta: ptr doublereal; b: ptr doublereal; ldb: var integer): cint {.importc: "dlagtm_".}
  
  proc dlagts*(job: var integer; n: var integer; a: ptr doublereal;
     b: ptr doublereal; c: ptr doublereal; d: ptr doublereal;
     pm: var integer; y: ptr doublereal; tol: ptr doublereal;
     info: var integer): cint {.importc: "dlagts_".}
  
  proc dlagv2*(a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; alphar: ptr doublereal;
     alphai: ptr doublereal; beta: ptr doublereal;
     csl: ptr doublereal; snl: ptr doublereal; csr: ptr doublereal;
     snr: ptr doublereal): cint {.importc: "dlagv2_".}
  
  proc dlahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublereal;
     ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;
     iloz: var integer; ihiz: var integer; z: ptr doublereal;
     ldz: var integer; info: var integer): cint {.importc: "dlahqr_".}
  
  proc dlahr2*(n: var integer; k: var integer; nb: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     t: ptr doublereal; ldt: var integer; y: ptr doublereal;
     ldy: var integer): cint {.importc: "dlahr2_".}
  
  proc dlahrd*(n: var integer; k: var integer; nb: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     t: ptr doublereal; ldt: var integer; y: ptr doublereal;
     ldy: var integer): cint {.importc: "dlahrd_".}
  
  proc dlaic1*(job: var integer; j: var integer; x: ptr doublereal;
     sest: ptr doublereal; w: ptr doublereal; gamma: ptr doublereal;
     sestpr: ptr doublereal; s: ptr doublereal; c: ptr doublereal): cint {.importc: "dlaic1_".}
  proc dlaisnan*(din1: ptr doublereal; din2: ptr doublereal): logical {.importc: "dlaisnan_".}
  
  proc dlaln2*(ltrans: ptr logical; na: var integer; nw: var integer;
     smin: ptr doublereal; ca: ptr doublereal; a: ptr doublereal;
     lda: var integer; d1: ptr doublereal; d2: ptr doublereal;
     b: ptr doublereal; ldb: var integer; wr: ptr doublereal;
     wi: ptr doublereal; x: ptr doublereal; ldx: var integer;
     scale: ptr doublereal; xnorm: ptr doublereal; info: var integer): cint {.importc: "dlaln2_".}
  
  proc dlals0*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; nrhs: var integer; b: ptr doublereal;
     ldb: var integer; bx: ptr doublereal; ldbx: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     ldgcol: var integer; givnum: ptr doublereal;
     ldgnum: var integer; poles: ptr doublereal;
     difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;
     k: var integer; c: ptr doublereal; s: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dlals0_".}
  
  proc dlalsa*(icompq: var integer; smlsiz: var integer; n: var integer;
     nrhs: var integer; b: ptr doublereal; ldb: var integer;
     bx: ptr doublereal; ldbx: var integer; u: ptr doublereal;
     ldu: var integer; vt: ptr doublereal; k: var integer;
     difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;
     poles: ptr doublereal; givptr: var integer; givcol: var integer;
     ldgcol: var integer; perm: var integer; givnum: ptr doublereal;
     c: ptr doublereal; s: ptr doublereal; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dlalsa_".}
  
  proc dlalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;
     nrhs: var integer; d: ptr doublereal; e: ptr doublereal;
     b: ptr doublereal; ldb: var integer; rcond: ptr doublereal;
     rank: var integer; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dlalsd_".}
  
  proc dlamrg*(n1: var integer; n2: var integer; a: ptr doublereal;
     dtrd1: var integer; dtrd2: var integer; index: var integer): cint {.importc: "dlamrg_".}
  proc dlaneg*(n: var integer; d: ptr doublereal; lld: ptr doublereal;
     sigma: ptr doublereal; pivmin: ptr doublereal; r: var integer): integer {.importc: "dlaneg_".}
  proc dlangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr doublereal; ldab: var integer; work: ptr doublereal): doublereal {.importc: "dlangb_".}
  proc dlange*(norm: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; work: ptr doublereal): doublereal {.importc: "dlange_".}
  proc dlangt*(norm: var cstring; n: var integer; dl: ptr doublereal;
     d: ptr doublereal; du: ptr doublereal): doublereal {.importc: "dlangt_".}
  proc dlanhs*(norm: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; work: ptr doublereal): doublereal {.importc: "dlanhs_".}
  proc dlansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;
     ab: ptr doublereal; ldab: var integer; work: ptr doublereal): doublereal {.importc: "dlansb_".}
  proc dlansf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublereal; work: ptr doublereal): doublereal {.importc: "dlansf_".}
  proc dlansp*(norm: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublereal; work: ptr doublereal): doublereal {.importc: "dlansp_".}
  proc dlanst*(norm: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal): doublereal {.importc: "dlanst_".}
  proc dlansy*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; work: ptr doublereal): doublereal {.importc: "dlansy_".}
  proc dlantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     k: var integer; ab: ptr doublereal; ldab: var integer;
     work: ptr doublereal): doublereal {.importc: "dlantb_".}
  proc dlantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr doublereal; work: ptr doublereal): doublereal {.importc: "dlantp_".}
  proc dlantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;
     n: var integer; a: ptr doublereal; lda: var integer;
     work: ptr doublereal): doublereal {.importc: "dlantr_".}
  
  proc dlanv2*(a: ptr doublereal; b: ptr doublereal; c: ptr doublereal;
     d: ptr doublereal; rt1r: ptr doublereal; rt1i: ptr doublereal;
     rt2r: ptr doublereal; rt2i: ptr doublereal; cs: ptr doublereal;
     sn: ptr doublereal): cint {.importc: "dlanv2_".}
  
  proc dlapll*(n: var integer; x: ptr doublereal; incx: var integer;
     y: ptr doublereal; incy: var integer; ssmin: ptr doublereal): cint {.importc: "dlapll_".}
  
  proc dlapmt*(forwrd: ptr logical; m: var integer; n: var integer;
     x: ptr doublereal; ldx: var integer; k: var integer): cint {.importc: "dlapmt_".}
  proc dlapy2*(x: ptr doublereal; y: ptr doublereal): doublereal {.importc: "dlapy2_".}
  proc dlapy3*(x: ptr doublereal; y: ptr doublereal; z: ptr doublereal): doublereal {.importc: "dlapy3_".}
  
  proc dlaqgb*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublereal; ldab: var integer;
     r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqgb_".}
  
  proc dlaqge*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqge_".}
  
  proc dlaqp2*(m: var integer; n: var integer; offset: var integer;
     a: ptr doublereal; lda: var integer; jpvt: var integer;
     tau: ptr doublereal; vn1: ptr doublereal; vn2: ptr doublereal;
     work: ptr doublereal): cint {.importc: "dlaqp2_".}
  
  proc dlaqps*(m: var integer; n: var integer; offset: var integer;
     nb: var integer; kb: var integer; a: ptr doublereal;
     lda: var integer; jpvt: var integer; tau: ptr doublereal;
     vn1: ptr doublereal; vn2: ptr doublereal; auxv: ptr doublereal;
     f: ptr doublereal; ldf: var integer): cint {.importc: "dlaqps_".}
  
  proc dlaqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublereal;
     ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;
     iloz: var integer; ihiz: var integer; z: ptr doublereal;
     ldz: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dlaqr0_".}
  
  proc dlaqr1*(n: var integer; h: ptr doublereal; ldh: var integer;
     sr1: ptr doublereal; si1: ptr doublereal; sr2: ptr doublereal;
     si2: ptr doublereal; v: ptr doublereal): cint {.importc: "dlaqr1_".}
  
  proc dlaqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr doublereal; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr doublereal; ldz: var integer;
     ns: var integer; nd: var integer; sr: ptr doublereal;
     si: ptr doublereal; v: ptr doublereal; ldv: var integer;
     nh: var integer; t: ptr doublereal; ldt: var integer;
     nv: var integer; wv: ptr doublereal; ldwv: var integer;
     work: ptr doublereal; lwork: var integer): cint {.importc: "dlaqr2_".}
  
  proc dlaqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr doublereal; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr doublereal; ldz: var integer;
     ns: var integer; nd: var integer; sr: ptr doublereal;
     si: ptr doublereal; v: ptr doublereal; ldv: var integer;
     nh: var integer; t: ptr doublereal; ldt: var integer;
     nv: var integer; wv: ptr doublereal; ldwv: var integer;
     work: ptr doublereal; lwork: var integer): cint {.importc: "dlaqr3_".}
  
  proc dlaqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublereal;
     ldh: var integer; wr: ptr doublereal; wi: ptr doublereal;
     iloz: var integer; ihiz: var integer; z: ptr doublereal;
     ldz: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dlaqr4_".}
  
  proc dlaqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;
     n: var integer; ktop: var integer; kbot: var integer;
     nshfts: var integer; sr: ptr doublereal; si: ptr doublereal;
     h: ptr doublereal; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr doublereal; ldz: var integer;
     v: ptr doublereal; ldv: var integer; u: ptr doublereal;
     ldu: var integer; nv: var integer; wv: ptr doublereal;
     ldwv: var integer; nh: var integer; wh: ptr doublereal;
     ldwh: var integer): cint {.importc: "dlaqr5_".}
  
  proc dlaqsb*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; s: ptr doublereal;
     scond: ptr doublereal; amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqsb_".}
  
  proc dlaqsp*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     equed: var cstring): cint {.importc: "dlaqsp_".}
  
  proc dlaqsy*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; s: ptr doublereal; scond: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "dlaqsy_".}
  
  proc dlaqtr*(ltran: ptr logical; lreal: ptr logical; n: var integer;
     t: ptr doublereal; ldt: var integer; b: ptr doublereal;
     w: ptr doublereal; scale: ptr doublereal; x: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dlaqtr_".}
  
  proc dlar1v*(n: var integer; b1: var integer; bn: var integer;
     lambdas: ptr doublereal; d: ptr doublereal; l: ptr doublereal;
     ld: ptr doublereal; lld: ptr doublereal; pivmin: ptr doublereal;
     gaptol: ptr doublereal; z: ptr doublereal;
     wantnc: ptr logical; negcnt: var integer; ztz: ptr doublereal;
     mingma: ptr doublereal; r: var integer; isuppz: var integer;
     nrminv: ptr doublereal; resid: ptr doublereal;
     rqcorr: ptr doublereal; work: ptr doublereal): cint {.importc: "dlar1v_".}
  
  proc dlar2v*(n: var integer; x: ptr doublereal; y: ptr doublereal;
     z: ptr doublereal; incx: var integer; c: ptr doublereal;
     s: ptr doublereal; incc: var integer): cint {.importc: "dlar2v_".}
  
  proc dlarf*(side: var cstring; m: var integer; n: var integer; v: ptr doublereal;
    incv: var integer; tau: ptr doublereal; c: ptr doublereal;
    ldc: var integer; work: ptr doublereal): cint {.importc: "dlarf_".}
  
  proc dlarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer;
     v: ptr doublereal; ldv: var integer; t: ptr doublereal;
     ldt: var integer; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; ldwork: var integer): cint {.importc: "dlarfb_".}
  
  proc dlarfg*(n: var integer; alpha: ptr doublereal; x: ptr doublereal;
     incx: var integer; tau: ptr doublereal): cint {.importc: "dlarfg_".}
  
  proc dlarfp*(n: var integer; alpha: ptr doublereal; x: ptr doublereal;
     incx: var integer; tau: ptr doublereal): cint {.importc: "dlarfp_".}
  
  proc dlarft*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr doublereal; ldv: var integer;
     tau: ptr doublereal; t: ptr doublereal; ldt: var integer): cint {.importc: "dlarft_".}
  
  proc dlarfx*(side: var cstring; m: var integer; n: var integer;
     v: ptr doublereal; tau: ptr doublereal; c: ptr doublereal;
     ldc: var integer; work: ptr doublereal): cint {.importc: "dlarfx_".}
  
  proc dlargv*(n: var integer; x: ptr doublereal; incx: var integer;
     y: ptr doublereal; incy: var integer; c: ptr doublereal;
     incc: var integer): cint {.importc: "dlargv_".}
  
  proc dlarnv*(idist: var integer; iseed: var integer; n: var integer;
     x: ptr doublereal): cint {.importc: "dlarnv_".}
  
  proc dlarra*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     e2: ptr doublereal; spltol: ptr doublereal;
     tnrm: ptr doublereal; nsplit: var integer; isplit: var integer;
     info: var integer): cint {.importc: "dlarra_".}
  
  proc dlarrb*(n: var integer; d: ptr doublereal; lld: ptr doublereal;
     ifirst: var integer; ilast: var integer; rtol1: ptr doublereal;
     rtol2: ptr doublereal; offset: var integer; w: ptr doublereal;
     wgap: ptr doublereal; werr: ptr doublereal;
     work: ptr doublereal; iwork: var integer;
     pivmin: ptr doublereal; spdiam: ptr doublereal;
     twist: var integer; info: var integer): cint {.importc: "dlarrb_".}
  
  proc dlarrc*(jobt: var cstring; n: var integer; vl: ptr doublereal;
     vu: ptr doublereal; d: ptr doublereal; e: ptr doublereal;
     pivmin: ptr doublereal; eigcnt: var integer; lcnt: var integer;
     rcnt: var integer; info: var integer): cint {.importc: "dlarrc_".}
  
  proc dlarrd*(range: var cstring; order: var cstring; n: var integer;
     vl: ptr doublereal; vu: ptr doublereal; il: var integer;
     iu: var integer; gers: ptr doublereal; reltol: ptr doublereal;
     d: ptr doublereal; e: ptr doublereal; e2: ptr doublereal;
     pivmin: ptr doublereal; nsplit: var integer;
     isplit: var integer; m: var integer; w: ptr doublereal;
     werr: ptr doublereal; wl: ptr doublereal; wu: ptr doublereal;
     iblock: var integer; indexw: var integer; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dlarrd_".}
  
  proc dlarre*(range: var cstring; n: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     d: ptr doublereal; e: ptr doublereal; e2: ptr doublereal;
     rtol1: ptr doublereal; rtol2: ptr doublereal;
     spltol: ptr doublereal; nsplit: var integer;
     isplit: var integer; m: var integer; w: ptr doublereal;
     werr: ptr doublereal; wgap: ptr doublereal; iblock: var integer;
     indexw: var integer; gers: ptr doublereal;
     pivmin: ptr doublereal; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dlarre_".}
  
  proc dlarrf*(n: var integer; d: ptr doublereal; l: ptr doublereal;
     ld: ptr doublereal; clstrt: var integer; clend: var integer;
     w: ptr doublereal; wgap: ptr doublereal; werr: ptr doublereal;
     spdiam: ptr doublereal; clgapl: ptr doublereal;
     clgapr: ptr doublereal; pivmin: ptr doublereal;
     sigma: ptr doublereal; dplus: ptr doublereal;
     lplus: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dlarrf_".}
  
  proc dlarrj*(n: var integer; d: ptr doublereal; e2: ptr doublereal;
     ifirst: var integer; ilast: var integer; rtol: ptr doublereal;
     offset: var integer; w: ptr doublereal; werr: ptr doublereal;
     work: ptr doublereal; iwork: var integer;
     pivmin: ptr doublereal; spdiam: ptr doublereal;
     info: var integer): cint {.importc: "dlarrj_".}
  
  proc dlarrk*(n: var integer; iw: var integer; gl: ptr doublereal;
     gu: ptr doublereal; d: ptr doublereal; e2: ptr doublereal;
     pivmin: ptr doublereal; reltol: ptr doublereal;
     w: ptr doublereal; werr: ptr doublereal; info: var integer): cint {.importc: "dlarrk_".}
  
  proc dlarrr*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     info: var integer): cint {.importc: "dlarrr_".}
  
  proc dlarrv*(n: var integer; vl: ptr doublereal; vu: ptr doublereal;
     d: ptr doublereal; l: ptr doublereal; pivmin: ptr doublereal;
     isplit: var integer; m: var integer; dol: var integer;
     dou: var integer; minrgp: ptr doublereal; rtol1: ptr doublereal;
     rtol2: ptr doublereal; w: ptr doublereal; werr: ptr doublereal;
     wgap: ptr doublereal; iblock: var integer; indexw: var integer;
     gers: ptr doublereal; z: ptr doublereal; ldz: var integer;
     isuppz: var integer; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dlarrv_".}
  
  proc dlarscl2*(m: var integer; n: var integer; d: ptr doublereal;
       x: ptr doublereal; ldx: var integer): cint {.importc: "dlarscl2_".}
  
  proc dlartg*(f: ptr doublereal; g: ptr doublereal; cs: ptr doublereal;
     sn: ptr doublereal; r: ptr doublereal): cint {.importc: "dlartg_".}
  
  proc dlartv*(n: var integer; x: ptr doublereal; incx: var integer;
     y: ptr doublereal; incy: var integer; c: ptr doublereal;
     s: ptr doublereal; incc: var integer): cint {.importc: "dlartv_".}
  
  proc dlaruv*(iseed: var integer; n: var integer; x: ptr doublereal): cint {.importc: "dlaruv_".}
  
  proc dlarz*(side: var cstring; m: var integer; n: var integer; l: var integer;
    v: ptr doublereal; incv: var integer; tau: ptr doublereal;
    c: ptr doublereal; ldc: var integer; work: ptr doublereal): cint {.importc: "dlarz_".}
  
  proc dlarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer; l: var integer;
     v: ptr doublereal; ldv: var integer; t: ptr doublereal;
     ldt: var integer; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; ldwork: var integer): cint {.importc: "dlarzb_".}
  
  proc dlarzt*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr doublereal; ldv: var integer;
     tau: ptr doublereal; t: ptr doublereal; ldt: var integer): cint {.importc: "dlarzt_".}
  
  proc dlas2*(f: ptr doublereal; g: ptr doublereal; h: ptr doublereal;
    ssmin: ptr doublereal; ssmax: ptr doublereal): cint {.importc: "dlas2_".}
  
  proc dlascl*(mtype: var cstring; kl: var integer; ku: var integer;
     cfrom: ptr doublereal; cto: ptr doublereal; m: var integer;
     n: var integer; a: ptr doublereal; lda: var integer;
     info: var integer): cint {.importc: "dlascl_".}
  
  proc dlascl2*(m: var integer; n: var integer; d: ptr doublereal;
      x: ptr doublereal; ldx: var integer): cint {.importc: "dlascl2_".}
  
  proc dlasd0*(n: var integer; sqre: var integer; d: ptr doublereal;
     e: ptr doublereal; u: ptr doublereal; ldu: var integer;
     vt: ptr doublereal; ldvt: var integer; smlsiz: var integer;
     iwork: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dlasd0_".}
  
  proc dlasd1*(nl: var integer; nr: var integer; sqre: var integer;
     d: ptr doublereal; alpha: ptr doublereal;
     beta: ptr doublereal; u: ptr doublereal; ldu: var integer;
     vt: ptr doublereal; ldvt: var integer; idxq: var integer;
     iwork: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dlasd1_".}
  
  proc dlasd2*(nl: var integer; nr: var integer; sqre: var integer;
     k: var integer; d: ptr doublereal; z: ptr doublereal;
     alpha: ptr doublereal; beta: ptr doublereal; u: ptr doublereal;
     ldu: var integer; vt: ptr doublereal; ldvt: var integer;
     dsigma: ptr doublereal; u2: ptr doublereal; ldu2: var integer;
     vt2: ptr doublereal; ldvt2: var integer; idxp: var integer;
     idx: var integer; idxc: var integer; idxq: var integer;
     coltyp: var integer; info: var integer): cint {.importc: "dlasd2_".}
  
  proc dlasd3*(nl: var integer; nr: var integer; sqre: var integer;
     k: var integer; d: ptr doublereal; q: ptr doublereal;
     ldq: var integer; dsigma: ptr doublereal; u: ptr doublereal;
     ldu: var integer; u2: ptr doublereal; ldu2: var integer;
     vt: ptr doublereal; ldvt: var integer; vt2: ptr doublereal;
     ldvt2: var integer; idxc: var integer; ctot: var integer;
     z: ptr doublereal; info: var integer): cint {.importc: "dlasd3_".}
  
  proc dlasd4*(n: var integer; i: var integer; d: ptr doublereal;
     z: ptr doublereal; delta: ptr doublereal; rho: ptr doublereal;
     sigma: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dlasd4_".}
  
  proc dlasd5*(i: var integer; d: ptr doublereal; z: ptr doublereal;
     delta: ptr doublereal; rho: ptr doublereal;
     dsigma: ptr doublereal; work: ptr doublereal): cint {.importc: "dlasd5_".}
  
  proc dlasd6*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; d: ptr doublereal; vf: ptr doublereal;
     vl: ptr doublereal; alpha: ptr doublereal; beta: ptr doublereal;
     idxq: var integer; perm: var integer; givptr: var integer;
     givcol: var integer; ldgcol: var integer;
     givnum: ptr doublereal; ldgnum: var integer;
     poles: ptr doublereal; difl: ptr doublereal;
     difr: ptr doublereal; z: ptr doublereal; k: var integer;
     c: ptr doublereal; s: ptr doublereal; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dlasd6_".}
  
  proc dlasd7*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; k: var integer; d: ptr doublereal;
     z: ptr doublereal; zw: ptr doublereal; vf: ptr doublereal;
     vfw: ptr doublereal; vl: ptr doublereal; vlw: ptr doublereal;
     alpha: ptr doublereal; beta: ptr doublereal;
     dsigma: ptr doublereal; idx: var integer; idxp: var integer;
     idxq: var integer; perm: var integer; givptr: var integer;
     givcol: var integer; ldgcol: var integer;
     givnum: ptr doublereal; ldgnum: var integer;
     c: ptr doublereal; s: ptr doublereal; info: var integer): cint {.importc: "dlasd7_".}
  
  proc dlasd8*(icompq: var integer; k: var integer; d: ptr doublereal;
     z: ptr doublereal; vf: ptr doublereal; vl: ptr doublereal;
     difl: ptr doublereal; difr: ptr doublereal; lddifr: var integer;
     dsigma: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dlasd8_".}
  
  proc dlasda*(icompq: var integer; smlsiz: var integer; n: var integer;
     sqre: var integer; d: ptr doublereal; e: ptr doublereal;
     u: ptr doublereal; ldu: var integer; vt: ptr doublereal;
     k: var integer; difl: ptr doublereal; difr: ptr doublereal;
     z: ptr doublereal; poles: ptr doublereal; givptr: var integer;
     givcol: var integer; ldgcol: var integer; perm: var integer;
     givnum: ptr doublereal; c: ptr doublereal; s: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dlasda_".}
  
  proc dlasdq*(uplo: var cstring; sqre: var integer; n: var integer;
     ncvt: var integer; nru: var integer; ncc: var integer;
     d: ptr doublereal; e: ptr doublereal; vt: ptr doublereal;
     ldvt: var integer; u: ptr doublereal; ldu: var integer;
     c: ptr doublereal; ldc: var integer; work: ptr doublereal;
     info: var integer): cint {.importc: "dlasdq_".}
  
  proc dlasdt*(n: var integer; lvl: var integer; nd: var integer;
     inode: var integer; ndiml: var integer; ndimr: var integer;
     msub: var integer): cint {.importc: "dlasdt_".}
  
  proc dlaset*(uplo: var cstring; m: var integer; n: var integer;
     alpha: ptr doublereal; beta: ptr doublereal; a: ptr doublereal;
     lda: var integer): cint {.importc: "dlaset_".}
  
  proc dlasq1*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dlasq1_".}
  
  proc dlasq2*(n: var integer; z: ptr doublereal; info: var integer): cint {.importc: "dlasq2_".}
  
  proc dlasq3*(i0: var integer; n0: var integer; z: ptr doublereal;
     pp: var integer; dmin: ptr doublereal; sigma: ptr doublereal;
     desig: ptr doublereal; qmax: ptr doublereal; nfail: var integer;
     iter: var integer; ndiv: var integer; ieee: ptr logical;
     ttype: var integer; dmin1: ptr doublereal;
     dmin2: ptr doublereal; dn: ptr doublereal; dn1: ptr doublereal;
     dn2: ptr doublereal; g: ptr doublereal; tau: ptr doublereal): cint {.importc: "dlasq3_".}
  
  proc dlasq4*(i0: var integer; n0: var integer; z: ptr doublereal;
     pp: var integer; n0in: var integer; dmin: ptr doublereal;
     dmin1: ptr doublereal; dmin2: ptr doublereal;
     dn: ptr doublereal; dn1: ptr doublereal; dn2: ptr doublereal;
     tau: ptr doublereal; ttype: var integer; g: ptr doublereal): cint {.importc: "dlasq4_".}
  
  proc dlasq5*(i0: var integer; n0: var integer; z: ptr doublereal;
     pp: var integer; tau: ptr doublereal; dmin: ptr doublereal;
     dmin1: ptr doublereal; dmin2: ptr doublereal;
     dn: ptr doublereal; dnm1: ptr doublereal; dnm2: ptr doublereal;
     ieee: ptr logical): cint {.importc: "dlasq5_".}
  
  proc dlasq6*(i0: var integer; n0: var integer; z: ptr doublereal;
     pp: var integer; dmin: ptr doublereal; dmin1: ptr doublereal;
     dmin2: ptr doublereal; dn: ptr doublereal; dnm1: ptr doublereal;
     dnm2: ptr doublereal): cint {.importc: "dlasq6_".}
  
  proc dlasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;
    n: var integer; c: ptr doublereal; s: ptr doublereal;
    a: ptr doublereal; lda: var integer): cint {.importc: "dlasr_".}
  
  proc dlasrt*(id: var cstring; n: var integer; d: ptr doublereal;
     info: var integer): cint {.importc: "dlasrt_".}
  
  proc dlassq*(n: var integer; x: ptr doublereal; incx: var integer;
     scale: ptr doublereal; sumsq: ptr doublereal): cint {.importc: "dlassq_".}
  
  proc dlasv2*(f: ptr doublereal; g: ptr doublereal; h: ptr doublereal;
     ssmin: ptr doublereal; ssmax: ptr doublereal;
     snr: ptr doublereal; csr: ptr doublereal; snl: ptr doublereal;
     csl: ptr doublereal): cint {.importc: "dlasv2_".}
  
  proc dlaswp*(n: var integer; a: ptr doublereal; lda: var integer;
     k1: var integer; k2: var integer; ipiv: var cint;
     incx: var integer): cint {.importc: "dlaswp_".}
  
  proc dlasy2*(ltranl: ptr logical; ltranr: ptr logical; isgn: var integer;
     n1: var integer; n2: var integer; tl: ptr doublereal;
     ldtl: var integer; tr: ptr doublereal; ldtr: var integer;
     b: ptr doublereal; ldb: var integer; scale: ptr doublereal;
     x: ptr doublereal; ldx: var integer; xnorm: ptr doublereal;
     info: var integer): cint {.importc: "dlasy2_".}
  
  proc dlasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;
     a: ptr doublereal; lda: var integer; ipiv: var cint;
     w: ptr doublereal; ldw: var integer; info: var integer): cint {.importc: "dlasyf_".}
  
  proc dlat2s*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; sa: ptr real; ldsa: var integer;
     info: var integer): cint {.importc: "dlat2s_".}
  
  proc dlatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; kd: var integer; ab: ptr doublereal;
     ldab: var integer; x: ptr doublereal; scale: ptr doublereal;
     cnorm: ptr doublereal; info: var integer): cint {.importc: "dlatbs_".}
  
  proc dlatdf*(ijob: var integer; n: var integer; z: ptr doublereal;
     ldz: var integer; rhs: ptr doublereal; rdsum: ptr doublereal;
     rdscal: ptr doublereal; ipiv: var cint; jpiv: var cint): cint {.importc: "dlatdf_".}
  
  proc dlatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; ap: ptr doublereal; x: ptr doublereal;
     scale: ptr doublereal; cnorm: ptr doublereal; info: var integer): cint {.importc: "dlatps_".}
  
  proc dlatrd*(uplo: var cstring; n: var integer; nb: var integer;
     a: ptr doublereal; lda: var integer; e: ptr doublereal;
     tau: ptr doublereal; w: ptr doublereal; ldw: var integer): cint {.importc: "dlatrd_".}
  
  proc dlatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; a: ptr doublereal; lda: var integer;
     x: ptr doublereal; scale: ptr doublereal; cnorm: ptr doublereal;
     info: var integer): cint {.importc: "dlatrs_".}
  
  proc dlatrz*(m: var integer; n: var integer; l: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal): cint {.importc: "dlatrz_".}
  
  proc dlatzm*(side: var cstring; m: var integer; n: var integer;
     v: ptr doublereal; incv: var integer; tau: ptr doublereal;
     c1: ptr doublereal; c2: ptr doublereal; ldc: var integer;
     work: ptr doublereal): cint {.importc: "dlatzm_".}
  
  proc dlauu2*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dlauu2_".}
  
  proc dlauum*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dlauum_".}
  
  proc dopgtr*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     tau: ptr doublereal; q: ptr doublereal; ldq: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dopgtr_".}
  
  proc dopmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; ap: ptr doublereal; tau: ptr doublereal;
     c: ptr doublereal; ldc: var integer; work: ptr doublereal;
     info: var integer): cint {.importc: "dopmtr_".}
  
  proc dorg2l*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dorg2l_".}
  
  proc dorg2r*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dorg2r_".}
  
  proc dorgbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgbr_".}
  
  proc dorghr*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorghr_".}
  
  proc dorgl2*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dorgl2_".}
  
  proc dorglq*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorglq_".}
  
  proc dorgql*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgql_".}
  
  proc dorgqr*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgqr_".}
  
  proc dorgr2*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dorgr2_".}
  
  proc dorgrq*(m: var integer; n: var integer; k: var integer;
     a: ptr doublereal; lda: var integer; tau: ptr doublereal;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dorgrq_".}
  
  proc dorgtr*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dorgtr_".}
  
  proc dorm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dorm2l_".}
  
  proc dorm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dorm2r_".}
  
  proc dormbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;
     n: var integer; k: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; c: ptr doublereal;
     ldc: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dormbr_".}
  
  proc dormhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; c: ptr doublereal;
     ldc: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dormhr_".}
  
  proc dorml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dorml2_".}
  
  proc dormlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormlq_".}
  
  proc dormql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormql_".}
  
  proc dormqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormqr_".}
  
  proc dormr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dormr2_".}
  
  proc dormr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; c: ptr doublereal;
     ldc: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dormr3_".}
  
  proc dormrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormrq_".}
  
  proc dormrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; c: ptr doublereal;
     ldc: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dormrz_".}
  
  proc dormtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; a: ptr doublereal; lda: var integer;
     tau: ptr doublereal; c: ptr doublereal; ldc: var integer;
     work: ptr doublereal; lwork: var integer; info: var integer): cint {.importc: "dormtr_".}
  
  proc dpbcon*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; anorm: ptr doublereal;
     rcond: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dpbcon_".}
  
  proc dpbequ*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; s: ptr doublereal;
     scond: ptr doublereal; amax: ptr doublereal; info: var integer): cint {.importc: "dpbequ_".}
  
  proc dpbrfs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr doublereal; ldab: var integer;
     afb: ptr doublereal; ldafb: var integer; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpbrfs_".}
  
  proc dpbstf*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; info: var integer): cint {.importc: "dpbstf_".}
  
  proc dpbsv*(uplo: var cstring; n: var integer; kd: var integer;
    nrhs: var integer; ab: ptr doublereal; ldab: var integer;
    b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dpbsv_".}
  
  proc dpbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr doublereal; ldab: var integer;
     afb: ptr doublereal; ldafb: var integer; equed: var cstring;
     s: ptr doublereal; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpbsvx_".}
  
  proc dpbtf2*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; info: var integer): cint {.importc: "dpbtf2_".}
  
  proc dpbtrf*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; info: var integer): cint {.importc: "dpbtrf_".}
  
  proc dpbtrs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr doublereal; ldab: var integer;
     b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dpbtrs_".}
  
  proc dpftrf*(transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublereal; info: var integer): cint {.importc: "dpftrf_".}
  
  proc dpftri*(transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublereal; info: var integer): cint {.importc: "dpftri_".}
  
  proc dpftrs*(transr: var cstring; uplo: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublereal; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dpftrs_".}
  
  proc dpocon*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpocon_".}
  
  proc dpoequ*(n: var integer; a: ptr doublereal; lda: var integer;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     info: var integer): cint {.importc: "dpoequ_".}
  
  proc dpoequb*(n: var integer; a: ptr doublereal; lda: var integer;
      s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
      info: var integer): cint {.importc: "dpoequb_".}
  
  proc dporfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; af: ptr doublereal;
     ldaf: var integer; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dporfs_".}
  
  proc dporfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublereal; lda: var integer;
      af: ptr doublereal; ldaf: var integer; s: ptr doublereal;
      b: ptr doublereal; ldb: var integer; x: ptr doublereal;
      ldx: var integer; rcond: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dporfsx_".}
  
  proc dposv*(uplo: var cstring; n: var integer; nrhs: var integer;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer; info: var integer): cint {.importc: "dposv_".}
  
  proc dposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; af: ptr doublereal;
     ldaf: var integer; equed: var cstring; s: ptr doublereal;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dposvx_".}
  
  proc dposvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublereal; lda: var integer;
      af: ptr doublereal; ldaf: var integer; equed: var cstring;
      s: ptr doublereal; b: ptr doublereal; ldb: var integer;
      x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
      rpvgrw: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dposvxx_".}
  
  proc dpotf2*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dpotf2_".}
  
  proc dpotrf*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dpotrf_".}
  
  proc dpotri*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dpotri_".}
  
  proc dpotrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dpotrs_".}
  
  proc dppcon*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dppcon_".}
  
  proc dppequ*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     info: var integer): cint {.importc: "dppequ_".}
  
  proc dpprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublereal; afp: ptr doublereal; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dpprfs_".}
  
  proc dppsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr doublereal; b: ptr doublereal; ldb: var integer;
    info: var integer): cint {.importc: "dppsv_".}
  
  proc dppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublereal; afp: ptr doublereal; equed: var cstring;
     s: ptr doublereal; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dppsvx_".}
  
  proc dpptrf*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     info: var integer): cint {.importc: "dpptrf_".}
  
  proc dpptri*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     info: var integer): cint {.importc: "dpptri_".}
  
  proc dpptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublereal; b: ptr doublereal; ldb: var integer;
     info: var integer): cint {.importc: "dpptrs_".}
  
  proc dpstf2*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; piv: var integer; rank: var integer;
     tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dpstf2_".}
  
  proc dpstrf*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; piv: var integer; rank: var integer;
     tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dpstrf_".}
  
  proc dptcon*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dptcon_".}
  
  proc dpteqr*(compz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dpteqr_".}
  
  proc dptrfs*(n: var integer; nrhs: var integer; d: ptr doublereal;
     e: ptr doublereal; df: ptr doublereal; ef: ptr doublereal;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dptrfs_".}
  
  proc dptsv*(n: var integer; nrhs: var integer; d: ptr doublereal;
    e: ptr doublereal; b: ptr doublereal; ldb: var integer;
    info: var integer): cint {.importc: "dptsv_".}
  
  proc dptsvx*(fact: var cstring; n: var integer; nrhs: var integer;
     d: ptr doublereal; e: ptr doublereal; df: ptr doublereal;
     ef: ptr doublereal; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; info: var integer): cint {.importc: "dptsvx_".}
  
  proc dpttrf*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     info: var integer): cint {.importc: "dpttrf_".}
  
  proc dpttrs*(n: var integer; nrhs: var integer; d: ptr doublereal;
     e: ptr doublereal; b: ptr doublereal; ldb: var integer;
     info: var integer): cint {.importc: "dpttrs_".}
  
  proc dptts2*(n: var integer; nrhs: var integer; d: ptr doublereal;
     e: ptr doublereal; b: ptr doublereal; ldb: var integer): cint {.importc: "dptts2_".}
  
  proc drscl*(n: var integer; sa: ptr doublereal; sx: ptr doublereal;
    incx: var integer): cint {.importc: "drscl_".}
  
  proc dsbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
    ab: ptr doublereal; ldab: var integer; w: ptr doublereal;
    z: ptr doublereal; ldz: var integer; work: ptr doublereal;
    info: var integer): cint {.importc: "dsbev_".}
  
  proc dsbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "dsbevd_".}
  
  proc dsbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     kd: var integer; ab: ptr doublereal; ldab: var integer;
     q: ptr doublereal; ldq: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "dsbevx_".}
  
  proc dsbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr doublereal; ldab: var integer;
     bb: ptr doublereal; ldbb: var integer; x: ptr doublereal;
     ldx: var integer; work: ptr doublereal; info: var integer): cint {.importc: "dsbgst_".}
  
  proc dsbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
    kb: var integer; ab: ptr doublereal; ldab: var integer;
    bb: ptr doublereal; ldbb: var integer; w: ptr doublereal;
    z: ptr doublereal; ldz: var integer; work: ptr doublereal;
    info: var integer): cint {.importc: "dsbgv_".}
  
  proc dsbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr doublereal; ldab: var integer;
     bb: ptr doublereal; ldbb: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "dsbgvd_".}
  
  proc dsbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ka: var integer; kb: var integer; ab: ptr doublereal;
     ldab: var integer; bb: ptr doublereal; ldbb: var integer;
     q: ptr doublereal; ldq: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "dsbgvx_".}
  
  proc dsbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublereal; ldab: var integer; d: ptr doublereal;
     e: ptr doublereal; q: ptr doublereal; ldq: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dsbtrd_".}
  
  proc dsfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;
    k: var integer; alpha: ptr doublereal; a: ptr doublereal;
    lda: var integer; beta: ptr doublereal; c: ptr doublereal): cint {.importc: "dsfrk_".}
  
  proc dsgesv*(n: var integer; nrhs: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     work: ptr doublereal; swork: ptr real; iter: var integer;
     info: var integer): cint {.importc: "dsgesv_".}
  
  proc dspcon*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dspcon_".}
  
  proc dspev*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr doublereal;
    w: ptr doublereal; z: ptr doublereal; ldz: var integer;
    work: ptr doublereal; info: var integer): cint {.importc: "dspev_".}
  
  proc dspevd*(jobz: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublereal; w: ptr doublereal; z: ptr doublereal;
     ldz: var integer; work: ptr doublereal; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "dspevd_".}
  
  proc dspevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublereal; vl: ptr doublereal; vu: ptr doublereal;
     il: var integer; iu: var integer; abstol: ptr doublereal;
     m: var integer; w: ptr doublereal; z: ptr doublereal;
     ldz: var integer; work: ptr doublereal; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "dspevx_".}
  
  proc dspgst*(itype: var integer; uplo: var cstring; n: var integer;
     ap: ptr doublereal; bp: ptr doublereal; info: var integer): cint {.importc: "dspgst_".}
  
  proc dspgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    ap: ptr doublereal; bp: ptr doublereal; w: ptr doublereal;
    z: ptr doublereal; ldz: var integer; work: ptr doublereal;
    info: var integer): cint {.importc: "dspgv_".}
  
  proc dspgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; ap: ptr doublereal; bp: ptr doublereal;
     w: ptr doublereal; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dspgvd_".}
  
  proc dspgvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; ap: ptr doublereal;
     bp: ptr doublereal; vl: ptr doublereal; vu: ptr doublereal;
     il: var integer; iu: var integer; abstol: ptr doublereal;
     m: var integer; w: ptr doublereal; z: ptr doublereal;
     ldz: var integer; work: ptr doublereal; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "dspgvx_".}
  
  proc dsposv*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     work: ptr doublereal; swork: ptr real; iter: var integer;
     info: var integer): cint {.importc: "dsposv_".}
  
  proc dsprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublereal; afp: ptr doublereal; ipiv: var cint;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dsprfs_".}
  
  proc dspsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr doublereal; ipiv: var cint; b: ptr doublereal;
    ldb: var integer; info: var integer): cint {.importc: "dspsv_".}
  
  proc dspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublereal; afp: ptr doublereal; ipiv: var cint;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dspsvx_".}
  
  proc dsptrd*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     d: ptr doublereal; e: ptr doublereal; tau: ptr doublereal;
     info: var integer): cint {.importc: "dsptrd_".}
  
  proc dsptrf*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     ipiv: var cint; info: var integer): cint {.importc: "dsptrf_".}
  
  proc dsptri*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     ipiv: var cint; work: ptr doublereal; info: var integer): cint {.importc: "dsptri_".}
  
  proc dsptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublereal; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dsptrs_".}
  
  proc dstebz*(range: var cstring; order: var cstring; n: var integer;
     vl: ptr doublereal; vu: ptr doublereal; il: var integer;
     iu: var integer; abstol: ptr doublereal; d: ptr doublereal;
     e: ptr doublereal; m: var integer; nsplit: var integer;
     w: ptr doublereal; iblock: var integer; isplit: var integer;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dstebz_".}
  
  proc dstedc*(compz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dstedc_".}
  
  proc dstegr*(jobz: var cstring; range: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; isuppz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dstegr_".}
  
  proc dstein*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     m: var integer; w: ptr doublereal; iblock: var integer;
     isplit: var integer; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "dstein_".}
  
  proc dstemr*(jobz: var cstring; range: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     m: var integer; w: ptr doublereal; z: ptr doublereal;
     ldz: var integer; nzc: var integer; isuppz: var integer;
     tryrac: ptr logical; work: ptr doublereal; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "dstemr_".}
  
  proc dsteqr*(compz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dsteqr_".}
  
  proc dsterf*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     info: var integer): cint {.importc: "dsterf_".}
  
  proc dstev*(jobz: var cstring; n: var integer; d: ptr doublereal;
    e: ptr doublereal; z: ptr doublereal; ldz: var integer;
    work: ptr doublereal; info: var integer): cint {.importc: "dstev_".}
  
  proc dstevd*(jobz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dstevd_".}
  
  proc dstevr*(jobz: var cstring; range: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; isuppz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dstevr_".}
  
  proc dstevx*(jobz: var cstring; range: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "dstevx_".}
  
  proc dsycon*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; anorm: ptr doublereal;
     rcond: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dsycon_".}
  
  proc dsyequb*(uplo: var cstring; n: var integer; a: ptr doublereal;
      lda: var integer; s: ptr doublereal; scond: ptr doublereal;
      amax: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "dsyequb_".}
  
  proc dsyev*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr doublereal;
    lda: var integer; w: ptr doublereal; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dsyev_".}
  
  proc dsyevd*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; w: ptr doublereal; work: ptr doublereal;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "dsyevd_".}
  
  proc dsyevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublereal; lda: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; isuppz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dsyevr_".}
  
  proc dsyevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublereal; lda: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublereal; ldz: var integer; work: ptr doublereal;
     lwork: var integer; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "dsyevx_".}
  
  proc dsygs2*(itype: var integer; uplo: var cstring; n: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dsygs2_".}
  
  proc dsygst*(itype: var integer; uplo: var cstring; n: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dsygst_".}
  
  proc dsygv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    a: ptr doublereal; lda: var integer; b: ptr doublereal;
    ldb: var integer; w: ptr doublereal; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dsygv_".}
  
  proc dsygvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; w: ptr doublereal;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dsygvd_".}
  
  proc dsygvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     vl: ptr doublereal; vu: ptr doublereal; il: var integer;
     iu: var integer; abstol: ptr doublereal; m: var integer;
     w: ptr doublereal; z: ptr doublereal; ldz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "dsygvx_".}
  
  proc dsyrfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; af: ptr doublereal;
     ldaf: var integer; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dsyrfs_".}
  
  proc dsyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublereal; lda: var integer;
      af: ptr doublereal; ldaf: var integer; ipiv: var cint;
      s: ptr doublereal; b: ptr doublereal; ldb: var integer;
      x: ptr doublereal; ldx: var integer; rcond: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dsyrfsx_".}
  
  proc dsysv*(uplo: var cstring; n: var integer; nrhs: var integer;
    a: ptr doublereal; lda: var integer; ipiv: var cint;
    b: ptr doublereal; ldb: var integer; work: ptr doublereal;
    lwork: var integer; info: var integer): cint {.importc: "dsysv_".}
  
  proc dsysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; af: ptr doublereal;
     ldaf: var integer; ipiv: var cint; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "dsysvx_".}
  
  proc dsysvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublereal; lda: var integer;
      af: ptr doublereal; ldaf: var integer; ipiv: var cint;
      equed: var cstring; s: ptr doublereal; b: ptr doublereal;
      ldb: var integer; x: ptr doublereal; ldx: var integer;
      rcond: ptr doublereal; rpvgrw: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublereal;
      iwork: var integer; info: var integer): cint {.importc: "dsysvxx_".}
  
  proc dsytd2*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tau: ptr doublereal; info: var integer): cint {.importc: "dsytd2_".}
  
  proc dsytf2*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "dsytf2_".}
  
  proc dsytrd*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tau: ptr doublereal; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dsytrd_".}
  
  proc dsytrf*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dsytrf_".}
  
  proc dsytri*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; ipiv: var cint; work: ptr doublereal;
     info: var integer): cint {.importc: "dsytri_".}
  
  proc dsytrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublereal; lda: var integer; ipiv: var cint;
     b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dsytrs_".}
  
  proc dtbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     kd: var integer; ab: ptr doublereal; ldab: var integer;
     rcond: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dtbcon_".}
  
  proc dtbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr doublereal;
     ldab: var integer; b: ptr doublereal; ldb: var integer;
     x: ptr doublereal; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "dtbrfs_".}
  
  proc dtbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr doublereal;
     ldab: var integer; b: ptr doublereal; ldb: var integer;
     info: var integer): cint {.importc: "dtbtrs_".}
  
  proc dtfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;
    diag: var cstring; m: var integer; n: var integer;
    alpha: ptr doublereal; a: ptr doublereal; b: ptr doublereal;
    ldb: var integer): cint {.importc: "dtfsm_".}
  
  proc dtftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr doublereal; info: var integer): cint {.importc: "dtftri_".}
  
  proc dtfttp*(transr: var cstring; uplo: var cstring; n: var integer;
     arf: ptr doublereal; ap: ptr doublereal; info: var integer): cint {.importc: "dtfttp_".}
  
  proc dtfttr*(transr: var cstring; uplo: var cstring; n: var integer;
     arf: ptr doublereal; a: ptr doublereal; lda: var integer;
     info: var integer): cint {.importc: "dtfttr_".}
  
  proc dtgevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; s: ptr doublereal; lds: var integer;
     p: ptr doublereal; ldp: var integer; vl: ptr doublereal;
     ldvl: var integer; vr: ptr doublereal; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr doublereal;
     info: var integer): cint {.importc: "dtgevc_".}
  
  proc dtgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; q: ptr doublereal; ldq: var integer;
     z: ptr doublereal; ldz: var integer; j1: var integer;
     n1: var integer; n2: var integer; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dtgex2_".}
  
  proc dtgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; q: ptr doublereal; ldq: var integer;
     z: ptr doublereal; ldz: var integer; ifst: var integer;
     ilst: var integer; work: ptr doublereal; lwork: var integer;
     info: var integer): cint {.importc: "dtgexc_".}
  
  proc dtgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;
     select: ptr logical; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     alphar: ptr doublereal; alphai: ptr doublereal;
     beta: ptr doublereal; q: ptr doublereal; ldq: var integer;
     z: ptr doublereal; ldz: var integer; m: var integer;
     pl: ptr doublereal; pr: ptr doublereal; dif: ptr doublereal;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "dtgsen_".}
  
  proc dtgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; k: var integer; l: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublereal;
     ldb: var integer; tola: ptr doublereal; tolb: ptr doublereal;
     alpha: ptr doublereal; beta: ptr doublereal; u: ptr doublereal;
     ldu: var integer; v: ptr doublereal; ldv: var integer;
     q: ptr doublereal; ldq: var integer; work: ptr doublereal;
     ncycle: var integer; info: var integer): cint {.importc: "dtgsja_".}
  
  proc dtgsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; vl: ptr doublereal;
     ldvl: var integer; vr: ptr doublereal; ldvr: var integer;
     s: ptr doublereal; dif: ptr doublereal; mm: var integer;
     m: var integer; work: ptr doublereal; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "dtgsna_".}
  
  proc dtgsy2*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; c: ptr doublereal;
     ldc: var integer; d: ptr doublereal; ldd: var integer;
     e: ptr doublereal; lde: var integer; f: ptr doublereal;
     ldf: var integer; scale: ptr doublereal; rdsum: ptr doublereal;
     rdscal: ptr doublereal; iwork: var integer; pq: var integer;
     info: var integer): cint {.importc: "dtgsy2_".}
  
  proc dtgsyl*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; c: ptr doublereal;
     ldc: var integer; d: ptr doublereal; ldd: var integer;
     e: ptr doublereal; lde: var integer; f: ptr doublereal;
     ldf: var integer; scale: ptr doublereal; dif: ptr doublereal;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     info: var integer): cint {.importc: "dtgsyl_".}
  
  proc dtpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr doublereal; rcond: ptr doublereal; work: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "dtpcon_".}
  
  proc dtprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr doublereal; b: ptr doublereal;
     ldb: var integer; x: ptr doublereal; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dtprfs_".}
  
  proc dtptri*(uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr doublereal; info: var integer): cint {.importc: "dtptri_".}
  
  proc dtptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr doublereal; b: ptr doublereal;
     ldb: var integer; info: var integer): cint {.importc: "dtptrs_".}
  
  proc dtpttf*(transr: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublereal; arf: ptr doublereal; info: var integer): cint {.importc: "dtpttf_".}
  
  proc dtpttr*(uplo: var cstring; n: var integer; ap: ptr doublereal;
     a: ptr doublereal; lda: var integer; info: var integer): cint {.importc: "dtpttr_".}
  
  proc dtrcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr doublereal; lda: var integer; rcond: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dtrcon_".}
  
  proc dtrevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr doublereal; ldt: var integer;
     vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;
     ldvr: var integer; mm: var integer; m: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "dtrevc_".}
  
  proc dtrexc*(compq: var cstring; n: var integer; t: ptr doublereal;
     ldt: var integer; q: ptr doublereal; ldq: var integer;
     ifst: var integer; ilst: var integer; work: ptr doublereal;
     info: var integer): cint {.importc: "dtrexc_".}
  
  proc dtrrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; x: ptr doublereal;
     ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "dtrrfs_".}
  
  proc dtrsen*(job: var cstring; compq: var cstring; select: ptr logical;
     n: var integer; t: ptr doublereal; ldt: var integer;
     q: ptr doublereal; ldq: var integer; wr: ptr doublereal;
     wi: ptr doublereal; m: var integer; s: ptr doublereal;
     sep: ptr doublereal; work: ptr doublereal; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "dtrsen_".}
  
  proc dtrsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr doublereal; ldt: var integer;
     vl: ptr doublereal; ldvl: var integer; vr: ptr doublereal;
     ldvr: var integer; s: ptr doublereal; sep: ptr doublereal;
     mm: var integer; m: var integer; work: ptr doublereal;
     ldwork: var integer; iwork: var integer; info: var integer): cint {.importc: "dtrsna_".}
  
  proc dtrsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;
     m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     c: ptr doublereal; ldc: var integer; scale: ptr doublereal;
     info: var integer): cint {.importc: "dtrsyl_".}
  
  proc dtrti2*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dtrti2_".}
  
  proc dtrtri*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; info: var integer): cint {.importc: "dtrtri_".}
  
  proc dtrtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublereal; lda: var integer;
     b: ptr doublereal; ldb: var integer; info: var integer): cint {.importc: "dtrtrs_".}
  
  proc dtrttf*(transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublereal; lda: var integer; arf: ptr doublereal;
     info: var integer): cint {.importc: "dtrttf_".}
  
  proc dtrttp*(uplo: var cstring; n: var integer; a: ptr doublereal;
     lda: var integer; ap: ptr doublereal; info: var integer): cint {.importc: "dtrttp_".}
  
  proc dtzrqf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; info: var integer): cint {.importc: "dtzrqf_".}
  
  proc dtzrzf*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; tau: ptr doublereal; work: ptr doublereal;
     lwork: var integer; info: var integer): cint {.importc: "dtzrzf_".}
  proc dzsum1*(n: var integer; cx: ptr doublecomplex; incx: var integer): doublereal {.importc: "dzsum1_".}

  #___________________________________________________________________________
  #
  # 
  #___________________________________________________________________________

  proc icmax1*(n: var integer; cx: ptr complex; incx: var integer): integer {.importc: "icmax1_".}
  proc ieeeck*(ispec: var integer; zero: ptr real; one: ptr real): integer {.importc: "ieeeck_".}
  proc ilaclc*(m: var integer; n: var integer; a: ptr complex; lda: var integer): integer {.importc: "ilaclc_".}
  proc ilaclr*(m: var integer; n: var integer; a: ptr complex; lda: var integer): integer {.importc: "ilaclr_".}
  proc iladiag*(diag: var cstring): integer {.importc: "iladiag_".}
  proc iladlc*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer): integer {.importc: "iladlc_".}
  proc iladlr*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer): integer {.importc: "iladlr_".}
  proc ilaenv*(ispec: var integer; name: var cstring; opts: var cstring;
     n1: var integer; n2: var integer; n3: var integer;
     n4: var integer): integer {.importc: "ilaenv_".}
  proc ilaprec*(prec: var cstring): integer {.importc: "ilaprec_".}
  proc ilaslc*(m: var integer; n: var integer; a: ptr real; lda: var integer): integer {.importc: "ilaslc_".}
  proc ilaslr*(m: var integer; n: var integer; a: ptr real; lda: var integer): integer {.importc: "ilaslr_".}
  proc ilatrans*(trans: var cstring): integer {.importc: "ilatrans_".}
  proc ilauplo*(uplo: var cstring): integer {.importc: "ilauplo_".}
  
  proc ilaver*(vers_major: var integer; vers_minor: var integer;
     vers_patch: var integer): cint {.importc: "ilaver_".}
  proc ilazlc*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer): integer {.importc: "ilazlc_".}
  proc ilazlr*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer): integer {.importc: "ilazlr_".}
  proc iparmq*(ispec: var integer; name: var cstring; opts: var cstring;
     n: var integer; ilo: var integer; ihi: var integer;
     lwork: var integer): integer {.importc: "iparmq_".}
  proc izmax1*(n: var integer; cx: ptr doublecomplex; incx: var integer): integer {.importc: "izmax1_".}
  proc lsamen*(n: var integer; ca: var cstring; cb: var cstring): logical {.importc: "lsamen_".}
  proc smaxloc*(a: ptr real; dimm: var integer): integer {.importc: "smaxloc_".}

  #___________________________________________________________________________
  #
  # Real, single precision
  #___________________________________________________________________________
  
  proc sbdsdc*(uplo: var cstring; compq: var cstring; n: var integer; d: ptr real;
     e: ptr real; u: ptr real; ldu: var integer; vt: ptr real;
     ldvt: var integer; q: ptr real; iq: var integer; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sbdsdc_".}
  
  proc sbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;
     nru: var integer; ncc: var integer; d: ptr real; e: ptr real;
     vt: ptr real; ldvt: var integer; u: ptr real; ldu: var integer;
     c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sbdsqr_".}
  proc scsum1*(n: var integer; cx: ptr complex; incx: var integer): doublereal {.importc: "scsum1_".}
  
  proc sdisna*(job: var cstring; m: var integer; n: var integer; d: ptr real;
     sep: ptr real; info: var integer): cint {.importc: "sdisna_".}
  
  proc sgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;
     kl: var integer; ku: var integer; ab: ptr real;
     ldab: var integer; d: ptr real; e: ptr real; q: ptr real;
     ldq: var integer; pt: ptr real; ldpt: var integer;
     c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sgbbrd_".}
  
  proc sgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr real; ldab: var integer; ipiv: var cint;
     anorm: ptr real; rcond: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sgbcon_".}
  
  proc sgbequ*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr real; ldab: var integer; r: ptr real;
     c: ptr real; rowcnd: ptr real; colcnd: ptr real;
     amax: ptr real; info: var integer): cint {.importc: "sgbequ_".}
  
  proc sgbequb*(m: var integer; n: var integer; kl: var integer;
      ku: var integer; ab: ptr real; ldab: var integer;
      r: ptr real; c: ptr real; rowcnd: ptr real;
      colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "sgbequb_".}
  
  proc sgbrfs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr real;
     ldab: var integer; afb: ptr real; ldafb: var integer;
     ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "sgbrfs_".}
  
  proc sgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;
      kl: var integer; ku: var integer; nrhs: var integer;
      ab: ptr real; ldab: var integer; afb: ptr real;
      ldafb: var integer; ipiv: var cint; r: ptr real;
      c: ptr real; b: ptr real; ldb: var integer; x: ptr real;
      ldx: var integer; rcond: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr real; iwork: var integer;
      info: var integer): cint {.importc: "sgbrfsx_".}
  
  proc sgbsv*(n: var integer; kl: var integer; ku: var integer;
    nrhs: var integer; ab: ptr real; ldab: var integer;
    ipiv: var cint; b: ptr real; ldb: var integer;
    info: var integer): cint {.importc: "sgbsv_".}
  
  proc sgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr real;
     ldab: var integer; afb: ptr real; ldafb: var integer;
     ipiv: var cint; equed: var cstring; r: ptr real; c: ptr real;
     b: ptr real; ldb: var integer; x: ptr real; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sgbsvx_".}
  
  proc sgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
      ku: var integer; nrhs: var integer; ab: ptr real;
      ldab: var integer; afb: ptr real; ldafb: var integer;
      ipiv: var cint; equed: var cstring; r: ptr real;
      c: ptr real; b: ptr real; ldb: var integer; x: ptr real;
      ldx: var integer; rcond: ptr real; rpvgrw: ptr real;
      berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr real;
      iwork: var integer; info: var integer): cint {.importc: "sgbsvxx_".}
  
  proc sgbtf2*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr real; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "sgbtf2_".}
  
  proc sgbtrf*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr real; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "sgbtrf_".}
  
  proc sgbtrs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr real;
     ldab: var integer; ipiv: var cint; b: ptr real;
     ldb: var integer; info: var integer): cint {.importc: "sgbtrs_".}
  
  proc sgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; scale: ptr real; m: var integer; v: ptr real;
     ldv: var integer; info: var integer): cint {.importc: "sgebak_".}
  
  proc sgebal*(job: var cstring; n: var integer; a: ptr real; lda: var integer;
     ilo: var integer; ihi: var integer; scale: ptr real;
     info: var integer): cint {.importc: "sgebal_".}
  
  proc sgebd2*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     d: ptr real; e: ptr real; tauq: ptr real; taup: ptr real;
     work: ptr real; info: var integer): cint {.importc: "sgebd2_".}
  
  proc sgebrd*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     d: ptr real; e: ptr real; tauq: ptr real; taup: ptr real;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgebrd_".}
  
  proc sgecon*(norm: var cstring; n: var integer; a: ptr real; lda: var integer;
     anorm: ptr real; rcond: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sgecon_".}
  
  proc sgeequ*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     r: ptr real; c: ptr real; rowcnd: ptr real;
     colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "sgeequ_".}
  
  proc sgeequb*(m: var integer; n: var integer; a: ptr real; lda: var integer;
      r: ptr real; c: ptr real; rowcnd: ptr real;
      colcnd: ptr real; amax: ptr real; info: var integer): cint {.importc: "sgeequb_".}
  
  proc sgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;
    a: ptr real; lda: var integer; sdim: var integer; wr: ptr real;
    wi: ptr real; vs: ptr real; ldvs: var integer; work: ptr real;
    lwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "sgees_".}
  
  proc sgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;
     n: var integer; a: ptr real; lda: var integer;
     sdim: var integer; wr: ptr real; wi: ptr real; vs: ptr real;
     ldvs: var integer; rconde: ptr real; rcondv: ptr real;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "sgeesx_".}
  
  proc sgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr real;
    lda: var integer; wr: ptr real; wi: ptr real; vl: ptr real;
    ldvl: var integer; vr: ptr real; ldvr: var integer;
    work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgeev_".}
  
  proc sgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr real; lda: var integer; wr: ptr real;
     wi: ptr real; vl: ptr real; ldvl: var integer; vr: ptr real;
     ldvr: var integer; ilo: var integer; ihi: var integer;
     scale: ptr real; abnrm: ptr real; rconde: ptr real;
     rcondv: ptr real; work: ptr real; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "sgeevx_".}
  
  proc sgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer; a: ptr real;
    lda: var integer; b: ptr real; ldb: var integer;
    alphar: ptr real; alphai: ptr real; beta: ptr real;
    vsl: ptr real; ldvsl: var integer; vsr: ptr real;
    ldvsr: var integer; work: ptr real; lwork: var integer;
    info: var integer): cint {.importc: "sgegs_".}
  
  proc sgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr real;
    lda: var integer; b: ptr real; ldb: var integer;
    alphar: ptr real; alphai: ptr real; beta: ptr real; vl: ptr real;
    ldvl: var integer; vr: ptr real; ldvr: var integer;
    work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgegv_".}
  
  proc sgehd2*(n: var integer; ilo: var integer; ihi: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sgehd2_".}
  
  proc sgehrd*(n: var integer; ilo: var integer; ihi: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sgehrd_".}
  
  proc sgejsv*(joba: var cstring; jobu: var cstring; jobv: var cstring; jobr: var cstring;
     jobt: var cstring; jobp: var cstring; m: var integer; n: var integer;
     a: ptr real; lda: var integer; sva: ptr real; u: ptr real;
     ldu: var integer; v: ptr real; ldv: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "sgejsv_".}
  
  proc sgelq2*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgelq2_".}
  
  proc sgelqf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sgelqf_".}
  
  proc sgels*(trans: var cstring; m: var integer; n: var integer;
    nrhs: var integer; a: ptr real; lda: var integer; b: ptr real;
    ldb: var integer; work: ptr real; lwork: var integer;
    info: var integer): cint {.importc: "sgels_".}
  
  proc sgelsd*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer; s: ptr real;
     rcond: ptr real; rank: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "sgelsd_".}
  
  proc sgelss*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer; s: ptr real;
     rcond: ptr real; rank: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sgelss_".}
  
  proc sgelsx*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer;
     jpvt: var integer; rcond: ptr real; rank: var integer;
     work: ptr real; info: var integer): cint {.importc: "sgelsx_".}
  
  proc sgelsy*(m: var integer; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer;
     jpvt: var integer; rcond: ptr real; rank: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgelsy_".}
  
  proc sgeql2*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgeql2_".}
  
  proc sgeqlf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sgeqlf_".}
  
  proc sgeqp3*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     jpvt: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sgeqp3_".}
  
  proc sgeqpf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     jpvt: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sgeqpf_".}
  
  proc sgeqr2*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgeqr2_".}
  
  proc sgeqrf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sgeqrf_".}
  
  proc sgerfs*(trans: var cstring; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; af: ptr real; ldaf: var integer;
     ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "sgerfs_".}
  
  proc sgerfsx*(trans: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
      ldaf: var integer; ipiv: var cint; r: ptr real;
      c: ptr real; b: ptr real; ldb: var integer; x: ptr real;
      ldx: var integer; rcond: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr real; iwork: var integer;
      info: var integer): cint {.importc: "sgerfsx_".}
  
  proc sgerq2*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; info: var integer): cint {.importc: "sgerq2_".}
  
  proc sgerqf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sgerqf_".}
  
  proc sgesc2*(n: var integer; a: ptr real; lda: var integer; rhs: ptr real;
     ipiv: var cint; jpiv: var cint; scale: ptr real): cint {.importc: "sgesc2_".}
  
  proc sgesdd*(jobz: var cstring; m: var integer; n: var integer; a: ptr real;
     lda: var integer; s: ptr real; u: ptr real; ldu: var integer;
     vt: ptr real; ldvt: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; info: var integer): cint {.importc: "sgesdd_".}
  
  proc sgesv*(n: var integer; nrhs: var integer; a: ptr real; lda: var integer;
    ipiv: var cint; b: ptr real; ldb: var integer;
    info: var integer): cint {.importc: "sgesv_".}
  
  proc sgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;
     a: ptr real; lda: var integer; s: ptr real; u: ptr real;
     ldu: var integer; vt: ptr real; ldvt: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgesvd_".}
  
  proc sgesvj*(joba: var cstring; jobu: var cstring; jobv: var cstring; m: var integer;
     n: var integer; a: ptr real; lda: var integer; sva: ptr real;
     mv: var integer; v: ptr real; ldv: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sgesvj_".}
  
  proc sgesvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
     ldaf: var integer; ipiv: var cint; equed: var cstring;
     r: ptr real; c: ptr real; b: ptr real; ldb: var integer;
     x: ptr real; ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sgesvx_".}
  
  proc sgesvxx*(fact: var cstring; trans: var cstring; n: var integer;
      nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
      ldaf: var integer; ipiv: var cint; equed: var cstring;
      r: ptr real; c: ptr real; b: ptr real; ldb: var integer;
      x: ptr real; ldx: var integer; rcond: ptr real;
      rpvgrw: ptr real; berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr real;
      iwork: var integer; info: var integer): cint {.importc: "sgesvxx_".}
  
  proc sgetc2*(n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "sgetc2_".}
  
  proc sgetf2*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "sgetf2_".}
  
  proc sgetrf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "sgetrf_".}
  
  proc sgetri*(n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sgetri_".}
  
  proc sgetrs*(trans: var cstring; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; ipiv: var cint; b: ptr real;
     ldb: var integer; info: var integer): cint {.importc: "sgetrs_".}
  
  proc sggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr real; rscale: ptr real;
     m: var integer; v: ptr real; ldv: var integer; info: var integer): cint {.importc: "sggbak_".}
  
  proc sggbal*(job: var cstring; n: var integer; a: ptr real; lda: var integer;
     b: ptr real; ldb: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr real; rscale: ptr real;
     work: ptr real; info: var integer): cint {.importc: "sggbal_".}
  
  proc sgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
    n: var integer; a: ptr real; lda: var integer; b: ptr real;
    ldb: var integer; sdim: var integer; alphar: ptr real;
    alphai: ptr real; beta: ptr real; vsl: ptr real;
    ldvsl: var integer; vsr: ptr real; ldvsr: var integer;
    work: ptr real; lwork: var integer; bwork: ptr logical;
    info: var integer): cint {.importc: "sgges_".}
  
  proc sggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
     sense: var cstring; n: var integer; a: ptr real; lda: var integer;
     b: ptr real; ldb: var integer; sdim: var integer;
     alphar: ptr real; alphai: ptr real; beta: ptr real;
     vsl: ptr real; ldvsl: var integer; vsr: ptr real;
     ldvsr: var integer; rconde: ptr real; rcondv: ptr real;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; bwork: ptr logical; info: var integer): cint {.importc: "sggesx_".}
  
  proc sggev*(jobvl: var cstring; jobvr: var cstring; n: var integer; a: ptr real;
    lda: var integer; b: ptr real; ldb: var integer;
    alphar: ptr real; alphai: ptr real; beta: ptr real; vl: ptr real;
    ldvl: var integer; vr: ptr real; ldvr: var integer;
    work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sggev_".}
  
  proc sggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; alphar: ptr real; alphai: ptr real;
     beta: ptr real; vl: ptr real; ldvl: var integer; vr: ptr real;
     ldvr: var integer; ilo: var integer; ihi: var integer;
     lscale: ptr real; rscale: ptr real; abnrm: ptr real;
     bbnrm: ptr real; rconde: ptr real; rcondv: ptr real;
     work: ptr real; lwork: var integer; iwork: var integer;
     bwork: ptr logical; info: var integer): cint {.importc: "sggevx_".}
  
  proc sggglm*(n: var integer; m: var integer; p: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer; d: ptr real;
     x: ptr real; y: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sggglm_".}
  
  proc sgghrd*(compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer; q: ptr real;
     ldq: var integer; z: ptr real; ldz: var integer;
     info: var integer): cint {.importc: "sgghrd_".}
  
  proc sgglse*(m: var integer; n: var integer; p: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer; c: ptr real;
     d: ptr real; x: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sgglse_".}
  
  proc sggqrf*(n: var integer; m: var integer; p: var integer; a: ptr real;
     lda: var integer; taua: ptr real; b: ptr real; ldb: var integer;
     taub: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sggqrf_".}
  
  proc sggrqf*(m: var integer; p: var integer; n: var integer; a: ptr real;
     lda: var integer; taua: ptr real; b: ptr real; ldb: var integer;
     taub: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sggrqf_".}
  
  proc sggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     n: var integer; p: var integer; k: var integer; l: var integer;
     a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
     alpha: ptr real; beta: ptr real; u: ptr real; ldu: var integer;
     v: ptr real; ldv: var integer; q: ptr real; ldq: var integer;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "sggsvd_".}
  
  proc sggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; a: ptr real; lda: var integer;
     b: ptr real; ldb: var integer; tola: ptr real; tolb: ptr real;
     k: var integer; l: var integer; u: ptr real; ldu: var integer;
     v: ptr real; ldv: var integer; q: ptr real; ldq: var integer;
     iwork: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sggsvp_".}
  
  proc sgsvj0*(jobv: var cstring; m: var integer; n: var integer; a: ptr real;
     lda: var integer; d: ptr real; sva: ptr real; mv: var integer;
     v: ptr real; ldv: var integer; eps: ptr real; sfmin: ptr real;
     tol: ptr real; nsweep: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sgsvj0_".}
  
  proc sgsvj1*(jobv: var cstring; m: var integer; n: var integer; n1: var integer;
     a: ptr real; lda: var integer; d: ptr real; sva: ptr real;
     mv: var integer; v: ptr real; ldv: var integer; eps: ptr real;
     sfmin: ptr real; tol: ptr real; nsweep: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "sgsvj1_".}
  
  proc sgtcon*(norm: var cstring; n: var integer; dl: ptr real; d: ptr real;
     du: ptr real; du2: ptr real; ipiv: var cint; anorm: ptr real;
     rcond: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sgtcon_".}
  
  proc sgtrfs*(trans: var cstring; n: var integer; nrhs: var integer; dl: ptr real;
     d: ptr real; du: ptr real; dlf: ptr real; df: ptr real;
     duf: ptr real; du2: ptr real; ipiv: var cint; b: ptr real;
     ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sgtrfs_".}
  
  proc sgtsv*(n: var integer; nrhs: var integer; dl: ptr real; d: ptr real;
    du: ptr real; b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sgtsv_".}
  
  proc sgtsvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; dl: ptr real; d: ptr real; du: ptr real;
     dlf: ptr real; df: ptr real; duf: ptr real; du2: ptr real;
     ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sgtsvx_".}
  
  proc sgttrf*(n: var integer; dl: ptr real; d: ptr real; du: ptr real;
     du2: ptr real; ipiv: var cint; info: var integer): cint {.importc: "sgttrf_".}
  
  proc sgttrs*(trans: var cstring; n: var integer; nrhs: var integer; dl: ptr real;
     d: ptr real; du: ptr real; du2: ptr real; ipiv: var cint;
     b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sgttrs_".}
  
  proc sgtts2*(itrans: var integer; n: var integer; nrhs: var integer;
     dl: ptr real; d: ptr real; du: ptr real; du2: ptr real;
     ipiv: var cint; b: ptr real; ldb: var integer): cint {.importc: "sgtts2_".}
  
  proc shgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr real;
     ldh: var integer; t: ptr real; ldt: var integer;
     alphar: ptr real; alphai: ptr real; beta: ptr real; q: ptr real;
     ldq: var integer; z: ptr real; ldz: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "shgeqz_".}
  
  proc shsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;
     select: ptr logical; n: var integer; h: ptr real;
     ldh: var integer; wr: ptr real; wi: ptr real; vl: ptr real;
     ldvl: var integer; vr: ptr real; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr real;
     ifaill: var integer; ifailr: var integer; info: var integer): cint {.importc: "shsein_".}
  
  proc shseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; h: ptr real; ldh: var integer; wr: ptr real;
     wi: ptr real; z: ptr real; ldz: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "shseqr_".}
  proc sisnan*(sin: ptr real): logical {.importc: "sisnan_".}
  
  proc sla_gbamv*(trans: var integer; m: var integer; n: var integer;
         kl: var integer; ku: var integer; alpha: ptr real;
         ab: ptr real; ldab: var integer; x: ptr real;
         incx: var integer; beta: ptr real; y: ptr real;
         incy: var integer): cint {.importc: "sla_gbamv__".}
  proc sla_gbrcond*(trans: var cstring; n: var integer; kl: var integer;
           ku: var integer; ab: ptr real; ldab: var integer;
           afb: ptr real; ldafb: var integer; ipiv: var cint;
           cmode: var integer; c: ptr real; info: var integer;
           work: ptr real; iwork: var integer; trans_len: ftnlen): doublereal {.importc: "sla_gbrcond__".}
  
  proc sla_gbrfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    kl: var integer; ku: var integer;
    
    nrhs: var integer; ab: ptr real;
    
    ldab: var integer; afb: ptr real;
    
    ldafb: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr real; b: ptr real;
    
    ldb: var integer; y: ptr real; ldy: var integer;
    
    berr_out: ptr real; n_norms: var integer;
    
    errs_n: ptr real; errs_c: ptr real;
    
    res: ptr real; ayb: ptr real; dy: ptr real;
    
    y_tail: ptr real; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer): cint {.importc: "sla_gbrfsx_extended__".}
  proc sla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;
            ncols: var integer; ab: ptr real; ldab: var integer;
            afb: ptr real; ldafb: var integer): doublereal {.importc: "sla_gbrpvgrw__".}
  
  proc sla_geamv*(trans: var integer; m: var integer; n: var integer;
         alpha: ptr real; a: ptr real; lda: var integer; x: ptr real;
         incx: var integer; beta: ptr real; y: ptr real;
         incy: var integer): cint {.importc: "sla_geamv__".}
  proc sla_gercond*(trans: var cstring; n: var integer; a: ptr real;
           lda: var integer; af: ptr real; ldaf: var integer;
           ipiv: var cint; cmode: var integer; c: ptr real;
           info: var integer; work: ptr real; iwork: var integer;
           trans_len: ftnlen): doublereal {.importc: "sla_gercond__".}
  
  proc sla_gerfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    nrhs: var integer; a: ptr real; lda: var integer;
    
    af: ptr real; ldaf: var integer;
    
    ipiv: var cint; colequ: ptr logical;
    
    c: ptr real; b: ptr real; ldb: var integer;
    
    y: ptr real; ldy: var integer;
    
    berr_out: ptr real; n_norms: var integer;
    
    errs_n: ptr real; errs_c: ptr real;
    
    res: ptr real; ayb: ptr real; dy: ptr real;
    
    y_tail: ptr real; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer): cint {.importc: "sla_gerfsx_extended__".}
  
  proc sla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;
            res: ptr real; ayb: ptr real; berr: ptr real): cint {.importc: "sla_lin_berr__".}
  proc sla_porcond*(uplo: var cstring; n: var integer; a: ptr real;
           lda: var integer; af: ptr real; ldaf: var integer;
           cmode: var integer; c: ptr real; info: var integer;
           work: ptr real; iwork: var integer; uplo_len: ftnlen): doublereal {.importc: "sla_porcond__".}
  
  proc sla_porfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer; a: ptr real;
    
    lda: var integer; af: ptr real; ldaf: var integer;
    
    colequ: ptr logical; c: ptr real; b: ptr real;
    
    ldb: var integer; y: ptr real; ldy: var integer;
    
    berr_out: ptr real; n_norms: var integer;
    
    errs_n: ptr real; errs_c: ptr real;
    
    res: ptr real; ayb: ptr real; dy: ptr real;
    
    y_tail: ptr real; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer; uplo_len: ftnlen): cint {.importc: "sla_porfsx_extended__".}
  proc sla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr real;
            lda: var integer; af: ptr real; ldaf: var integer;
            work: ptr real; uplo_len: ftnlen): doublereal {.importc: "sla_porpvgrw__".}
  proc sla_rpvgrw*(n: var integer; ncols: var integer; a: ptr real;
          lda: var integer; af: ptr real; ldaf: var integer): doublereal {.importc: "sla_rpvgrw__".}
  
  proc sla_syamv*(uplo: var integer; n: var integer; alpha: ptr real;
         a: ptr real; lda: var integer; x: ptr real;
         incx: var integer; beta: ptr real; y: ptr real;
         incy: var integer): cint {.importc: "sla_syamv__".}
  proc sla_syrcond*(uplo: var cstring; n: var integer; a: ptr real;
           lda: var integer; af: ptr real; ldaf: var integer;
           ipiv: var cint; cmode: var integer; c: ptr real;
           info: var integer; work: ptr real; iwork: var integer;
           uplo_len: ftnlen): doublereal {.importc: "sla_syrcond__".}
  
  proc sla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer; a: ptr real;
    
    lda: var integer; af: ptr real; ldaf: var integer;
    
    ipiv: var cint; colequ: ptr logical;
    
    c: ptr real; b: ptr real; ldb: var integer;
    
    y: ptr real; ldy: var integer;
    
    berr_out: ptr real; n_norms: var integer;
    
    errs_n: ptr real; errs_c: ptr real;
    
    res: ptr real; ayb: ptr real; dy: ptr real;
    
    y_tail: ptr real; rcond: ptr real;
    
    ithresh: var integer; rthresh: ptr real;
    
    dz_ub: ptr real; ignore_cwise: ptr logical;
    
    info: var integer; uplo_len: ftnlen): cint {.importc: "sla_syrfsx_extended__".}
  proc sla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;
            a: ptr real; lda: var integer; af: ptr real;
            ldaf: var integer; ipiv: var cint; work: ptr real;
            uplo_len: ftnlen): doublereal {.importc: "sla_syrpvgrw__".}
  
  proc sla_wwaddw*(n: var integer; x: ptr real; y: ptr real; w: ptr real): cint {.importc: "sla_wwaddw__".}
  
  proc slabad*(small: ptr real; large: ptr real): cint {.importc: "slabad_".}
  
  proc slabrd*(m: var integer; n: var integer; nb: var integer; a: ptr real;
     lda: var integer; d: ptr real; e: ptr real; tauq: ptr real;
     taup: ptr real; x: ptr real; ldx: var integer; y: ptr real;
     ldy: var integer): cint {.importc: "slabrd_".}
  
  proc slacn2*(n: var integer; v: ptr real; x: ptr real; isgn: var integer;
     est: ptr real; kase: var integer; isave: var integer): cint {.importc: "slacn2_".}
  
  proc slacon*(n: var integer; v: ptr real; x: ptr real; isgn: var integer;
     est: ptr real; kase: var integer): cint {.importc: "slacon_".}
  
  proc slacpy*(uplo: var cstring; m: var integer; n: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer): cint {.importc: "slacpy_".}
  
  proc sladiv*(a: ptr real; b: ptr real; c: ptr real; d: ptr real;
     p: ptr real; q: ptr real): cint {.importc: "sladiv_".}
  
  proc slae2*(a: ptr real; b: ptr real; c: ptr real; rt1: ptr real;
    rt2: ptr real): cint {.importc: "slae2_".}
  
  proc slaebz*(ijob: var integer; nitmax: var integer; n: var integer;
     mmax: var integer; minp: var integer; nbmin: var integer;
     abstol: ptr real; reltol: ptr real; pivmin: ptr real;
     d: ptr real; e: ptr real; e2: ptr real; nval: var integer;
     ab: ptr real; c: ptr real; mout: var integer;
     nab: var integer; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "slaebz_".}
  
  proc slaed0*(icompq: var integer; qsiz: var integer; n: var integer;
     d: ptr real; e: ptr real; q: ptr real; ldq: var integer;
     qstore: ptr real; ldqs: var integer; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "slaed0_".}
  
  proc slaed1*(n: var integer; d: ptr real; q: ptr real; ldq: var integer;
     indxq: var integer; rho: ptr real; cutpnt: var integer;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slaed1_".}
  
  proc slaed2*(k: var integer; n: var integer; n1: var integer; d: ptr real;
     q: ptr real; ldq: var integer; indxq: var integer;
     rho: ptr real; z: ptr real; dlamda: ptr real; w: ptr real;
     q2: ptr real; indx: var integer; indxc: var integer;
     indxp: var integer; coltyp: var integer; info: var integer): cint {.importc: "slaed2_".}
  
  proc slaed3*(k: var integer; n: var integer; n1: var integer; d: ptr real;
     q: ptr real; ldq: var integer; rho: ptr real; dlamda: ptr real;
     q2: ptr real; indx: var integer; ctot: var integer; w: ptr real;
     s: ptr real; info: var integer): cint {.importc: "slaed3_".}
  
  proc slaed4*(n: var integer; i: var integer; d: ptr real; z: ptr real;
     delta: ptr real; rho: ptr real; dlam: ptr real;
     info: var integer): cint {.importc: "slaed4_".}
  
  proc slaed5*(i: var integer; d: ptr real; z: ptr real; delta: ptr real;
     rho: ptr real; dlam: ptr real): cint {.importc: "slaed5_".}
  
  proc slaed6*(kniter: var integer; orgati: ptr logical; rho: ptr real;
     d: ptr real; z: ptr real; finit: ptr real; tau: ptr real;
     info: var integer): cint {.importc: "slaed6_".}
  
  proc slaed7*(icompq: var integer; n: var integer; qsiz: var integer;
     tlvls: var integer; curlvl: var integer; curpbm: var integer;
     d: ptr real; q: ptr real; ldq: var integer;
     indxq: var integer; rho: ptr real; cutpnt: var integer;
     qstore: ptr real; qptr: var integer; prmptr: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     givnum: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "slaed7_".}
  
  proc slaed8*(icompq: var integer; k: var integer; n: var integer;
     qsiz: var integer; d: ptr real; q: ptr real; ldq: var integer;
     indxq: var integer; rho: ptr real; cutpnt: var integer;
     z: ptr real; dlamda: ptr real; q2: ptr real;
     ldq2: var integer; w: ptr real; perm: var integer;
     givptr: var integer; givcol: var integer; givnum: ptr real;
     indxp: var integer; indx: var integer; info: var integer): cint {.importc: "slaed8_".}
  
  proc slaed9*(k: var integer; kstart: var integer; kstop: var integer;
     n: var integer; d: ptr real; q: ptr real; ldq: var integer;
     rho: ptr real; dlamda: ptr real; w: ptr real; s: ptr real;
     lds: var integer; info: var integer): cint {.importc: "slaed9_".}
  
  proc slaeda*(n: var integer; tlvls: var integer; curlvl: var integer;
     curpbm: var integer; prmptr: var integer; perm: var integer;
     givptr: var integer; givcol: var integer; givnum: ptr real;
     q: ptr real; qptr: var integer; z: ptr real; ztemp: ptr real;
     info: var integer): cint {.importc: "slaeda_".}
  
  proc slaein*(rightv: ptr logical; noinit: ptr logical; n: var integer;
     h: ptr real; ldh: var integer; wr: ptr real; wi: ptr real;
     vr: ptr real; vi: ptr real; b: ptr real; ldb: var integer;
     work: ptr real; eps3: ptr real; smlnum: ptr real;
     bignum: ptr real; info: var integer): cint {.importc: "slaein_".}
  
  proc slaev2*(a: ptr real; b: ptr real; c: ptr real; rt1: ptr real;
     rt2: ptr real; cs1: ptr real; sn1: ptr real): cint {.importc: "slaev2_".}
  
  proc slaexc*(wantq: ptr logical; n: var integer; t: ptr real;
     ldt: var integer; q: ptr real; ldq: var integer;
     j1: var integer; n1: var integer; n2: var integer;
     work: ptr real; info: var integer): cint {.importc: "slaexc_".}
  
  proc slag2*(a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
    safmin: ptr real; scale1: ptr real; scale2: ptr real;
    wr1: ptr real; wr2: ptr real; wi: ptr real): cint {.importc: "slag2_".}
  
  proc slag2d*(m: var integer; n: var integer; sa: ptr real; ldsa: var integer;
     a: ptr doublereal; lda: var integer; info: var integer): cint {.importc: "slag2d_".}
  
  proc slags2*(upper: ptr logical; a1: ptr real; a2: ptr real; a3: ptr real;
     b1: ptr real; b2: ptr real; b3: ptr real; csu: ptr real;
     snu: ptr real; csv: ptr real; snv: ptr real; csq: ptr real;
     snq: ptr real): cint {.importc: "slags2_".}
  
  proc slagtf*(n: var integer; a: ptr real; lambdas: ptr real; b: ptr real;
     c: ptr real; tol: ptr real; d: ptr real; pm: var integer;
     info: var integer): cint {.importc: "slagtf_".}
  
  proc slagtm*(trans: var cstring; n: var integer; nrhs: var integer;
     alpha: ptr real; dl: ptr real; d: ptr real; du: ptr real;
     x: ptr real; ldx: var integer; beta: ptr real; b: ptr real;
     ldb: var integer): cint {.importc: "slagtm_".}
  
  proc slagts*(job: var integer; n: var integer; a: ptr real; b: ptr real;
     c: ptr real; d: ptr real; pm: var integer; y: ptr real;
     tol: ptr real; info: var integer): cint {.importc: "slagts_".}
  
  proc slagv2*(a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
     alphar: ptr real; alphai: ptr real; beta: ptr real;
     csl: ptr real; snl: ptr real; csr: ptr real; snr: ptr real): cint {.importc: "slagv2_".}
  
  proc slahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr real;
     ldh: var integer; wr: ptr real; wi: ptr real; iloz: var integer;
     ihiz: var integer; z: ptr real; ldz: var integer;
     info: var integer): cint {.importc: "slahqr_".}
  
  proc slahr2*(n: var integer; k: var integer; nb: var integer; a: ptr real;
     lda: var integer; tau: ptr real; t: ptr real; ldt: var integer;
     y: ptr real; ldy: var integer): cint {.importc: "slahr2_".}
  
  proc slahrd*(n: var integer; k: var integer; nb: var integer; a: ptr real;
     lda: var integer; tau: ptr real; t: ptr real; ldt: var integer;
     y: ptr real; ldy: var integer): cint {.importc: "slahrd_".}
  
  proc slaic1*(job: var integer; j: var integer; x: ptr real; sest: ptr real;
     w: ptr real; gamma: ptr real; sestpr: ptr real; s: ptr real;
     c: ptr real): cint {.importc: "slaic1_".}
  proc slaisnan*(sin1: ptr real; sin2: ptr real): logical {.importc: "slaisnan_".}
  
  proc slaln2*(ltrans: ptr logical; na: var integer; nw: var integer;
     smin: ptr real; ca: ptr real; a: ptr real; lda: var integer;
     d1: ptr real; d2: ptr real; b: ptr real; ldb: var integer;
     wr: ptr real; wi: ptr real; x: ptr real; ldx: var integer;
     scale: ptr real; xnorm: ptr real; info: var integer): cint {.importc: "slaln2_".}
  
  proc slals0*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; nrhs: var integer; b: ptr real;
     ldb: var integer; bx: ptr real; ldbx: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     ldgcol: var integer; givnum: ptr real; ldgnum: var integer;
     poles: ptr real; difl: ptr real; difr: ptr real; z: ptr real;
     k: var integer; c: ptr real; s: ptr real; work: ptr real;
     info: var integer): cint {.importc: "slals0_".}
  
  proc slalsa*(icompq: var integer; smlsiz: var integer; n: var integer;
     nrhs: var integer; b: ptr real; ldb: var integer; bx: ptr real;
     ldbx: var integer; u: ptr real; ldu: var integer; vt: ptr real;
     k: var integer; difl: ptr real; difr: ptr real; z: ptr real;
     poles: ptr real; givptr: var integer; givcol: var integer;
     ldgcol: var integer; perm: var integer; givnum: ptr real;
     c: ptr real; s: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "slalsa_".}
  
  proc slalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;
     nrhs: var integer; d: ptr real; e: ptr real; b: ptr real;
     ldb: var integer; rcond: ptr real; rank: var integer;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slalsd_".}
  
  proc slamrg*(n1: var integer; n2: var integer; a: ptr real;
     strd1: var integer; strd2: var integer; index: var integer): cint {.importc: "slamrg_".}
  proc slaneg*(n: var integer; d: ptr real; lld: ptr real; sigma: ptr real;
     pivmin: ptr real; r: var integer): integer {.importc: "slaneg_".}
  proc slangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr real; ldab: var integer; work: ptr real): doublereal {.importc: "slangb_".}
  proc slange*(norm: var cstring; m: var integer; n: var integer; a: ptr real;
     lda: var integer; work: ptr real): doublereal {.importc: "slange_".}
  proc slangt*(norm: var cstring; n: var integer; dl: ptr real; d: ptr real;
     du: ptr real): doublereal {.importc: "slangt_".}
  proc slanhs*(norm: var cstring; n: var integer; a: ptr real; lda: var integer;
     work: ptr real): doublereal {.importc: "slanhs_".}
  proc slansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;
     ab: ptr real; ldab: var integer; work: ptr real): doublereal {.importc: "slansb_".}
  proc slansf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr real; work: ptr real): doublereal {.importc: "slansf_".}
  proc slansp*(norm: var cstring; uplo: var cstring; n: var integer; ap: ptr real;
     work: ptr real): doublereal {.importc: "slansp_".}
  proc slanst*(norm: var cstring; n: var integer; d: ptr real; e: ptr real): doublereal {.importc: "slanst_".}
  proc slansy*(norm: var cstring; uplo: var cstring; n: var integer; a: ptr real;
     lda: var integer; work: ptr real): doublereal {.importc: "slansy_".}
  proc slantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     k: var integer; ab: ptr real; ldab: var integer; work: ptr real): doublereal {.importc: "slantb_".}
  proc slantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr real; work: ptr real): doublereal {.importc: "slantp_".}
  proc slantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;
     n: var integer; a: ptr real; lda: var integer; work: ptr real): doublereal {.importc: "slantr_".}
  
  proc slanv2*(a: ptr real; b: ptr real; c: ptr real; d: ptr real;
     rt1r: ptr real; rt1i: ptr real; rt2r: ptr real; rt2i: ptr real;
     cs: ptr real; sn: ptr real): cint {.importc: "slanv2_".}
  
  proc slapll*(n: var integer; x: ptr real; incx: var integer; y: ptr real;
     incy: var integer; ssmin: ptr real): cint {.importc: "slapll_".}
  
  proc slapmt*(forwrd: ptr logical; m: var integer; n: var integer;
     x: ptr real; ldx: var integer; k: var integer): cint {.importc: "slapmt_".}
  proc slapy2*(x: ptr real; y: ptr real): doublereal {.importc: "slapy2_".}
  proc slapy3*(x: ptr real; y: ptr real; z: ptr real): doublereal {.importc: "slapy3_".}
  
  proc slaqgb*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr real; ldab: var integer; r: ptr real;
     c: ptr real; rowcnd: ptr real; colcnd: ptr real;
     amax: ptr real; equed: var cstring): cint {.importc: "slaqgb_".}
  
  proc slaqge*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     r: ptr real; c: ptr real; rowcnd: ptr real;
     colcnd: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "slaqge_".}
  
  proc slaqp2*(m: var integer; n: var integer; offset: var integer;
     a: ptr real; lda: var integer; jpvt: var integer; tau: ptr real;
     vn1: ptr real; vn2: ptr real; work: ptr real): cint {.importc: "slaqp2_".}
  
  proc slaqps*(m: var integer; n: var integer; offset: var integer;
     nb: var integer; kb: var integer; a: ptr real; lda: var integer;
     jpvt: var integer; tau: ptr real; vn1: ptr real; vn2: ptr real;
     auxv: ptr real; f: ptr real; ldf: var integer): cint {.importc: "slaqps_".}
  
  proc slaqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr real;
     ldh: var integer; wr: ptr real; wi: ptr real; iloz: var integer;
     ihiz: var integer; z: ptr real; ldz: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "slaqr0_".}
  
  proc slaqr1*(n: var integer; h: ptr real; ldh: var integer; sr1: ptr real;
     si1: ptr real; sr2: ptr real; si2: ptr real; v: ptr real): cint {.importc: "slaqr1_".}
  
  proc slaqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr real; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr real; ldz: var integer;
     ns: var integer; nd: var integer; sr: ptr real; si: ptr real;
     v: ptr real; ldv: var integer; nh: var integer; t: ptr real;
     ldt: var integer; nv: var integer; wv: ptr real;
     ldwv: var integer; work: ptr real; lwork: var integer): cint {.importc: "slaqr2_".}
  
  proc slaqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr real; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr real; ldz: var integer;
     ns: var integer; nd: var integer; sr: ptr real; si: ptr real;
     v: ptr real; ldv: var integer; nh: var integer; t: ptr real;
     ldt: var integer; nv: var integer; wv: ptr real;
     ldwv: var integer; work: ptr real; lwork: var integer): cint {.importc: "slaqr3_".}
  
  proc slaqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr real;
     ldh: var integer; wr: ptr real; wi: ptr real; iloz: var integer;
     ihiz: var integer; z: ptr real; ldz: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "slaqr4_".}
  
  proc slaqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;
     n: var integer; ktop: var integer; kbot: var integer;
     nshfts: var integer; sr: ptr real; si: ptr real; h: ptr real;
     ldh: var integer; iloz: var integer; ihiz: var integer;
     z: ptr real; ldz: var integer; v: ptr real; ldv: var integer;
     u: ptr real; ldu: var integer; nv: var integer; wv: ptr real;
     ldwv: var integer; nh: var integer; wh: ptr real;
     ldwh: var integer): cint {.importc: "slaqr5_".}
  
  proc slaqsb*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;
     equed: var cstring): cint {.importc: "slaqsb_".}
  
  proc slaqsp*(uplo: var cstring; n: var integer; ap: ptr real; s: ptr real;
     scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "slaqsp_".}
  
  proc slaqsy*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     s: ptr real; scond: ptr real; amax: ptr real; equed: var cstring): cint {.importc: "slaqsy_".}
  
  proc slaqtr*(ltran: ptr logical; lreal: ptr logical; n: var integer;
     t: ptr real; ldt: var integer; b: ptr real; w: ptr real;
     scale: ptr real; x: ptr real; work: ptr real; info: var integer): cint {.importc: "slaqtr_".}
  
  proc slar1v*(n: var integer; b1: var integer; bn: var integer;
     lambdas: ptr real; d: ptr real; l: ptr real; ld: ptr real;
     lld: ptr real; pivmin: ptr real; gaptol: ptr real;
     z: ptr real; wantnc: ptr logical; negcnt: var integer;
     ztz: ptr real; mingma: ptr real; r: var integer;
     isuppz: var integer; nrminv: ptr real; resid: ptr real;
     rqcorr: ptr real; work: ptr real): cint {.importc: "slar1v_".}
  
  proc slar2v*(n: var integer; x: ptr real; y: ptr real; z: ptr real;
     incx: var integer; c: ptr real; s: ptr real; incc: var integer): cint {.importc: "slar2v_".}
  
  proc slarf*(side: var cstring; m: var integer; n: var integer; v: ptr real;
    incv: var integer; tau: ptr real; c: ptr real;
    ldc: var integer; work: ptr real): cint {.importc: "slarf_".}
  
  proc slarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer; v: ptr real;
     ldv: var integer; t: ptr real; ldt: var integer; c: ptr real;
     ldc: var integer; work: ptr real; ldwork: var integer): cint {.importc: "slarfb_".}
  
  proc slarfg*(n: var integer; alpha: ptr real; x: ptr real; incx: var integer;
     tau: ptr real): cint {.importc: "slarfg_".}
  
  proc slarfp*(n: var integer; alpha: ptr real; x: ptr real; incx: var integer;
     tau: ptr real): cint {.importc: "slarfp_".}
  
  proc slarft*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr real; ldv: var integer; tau: ptr real;
     t: ptr real; ldt: var integer): cint {.importc: "slarft_".}
  
  proc slarfx*(side: var cstring; m: var integer; n: var integer; v: ptr real;
     tau: ptr real; c: ptr real; ldc: var integer; work: ptr real): cint {.importc: "slarfx_".}
  
  proc slargv*(n: var integer; x: ptr real; incx: var integer; y: ptr real;
     incy: var integer; c: ptr real; incc: var integer): cint {.importc: "slargv_".}
  
  proc slarnv*(idist: var integer; iseed: var integer; n: var integer;
     x: ptr real): cint {.importc: "slarnv_".}
  
  proc slarra*(n: var integer; d: ptr real; e: ptr real; e2: ptr real;
     spltol: ptr real; tnrm: ptr real; nsplit: var integer;
     isplit: var integer; info: var integer): cint {.importc: "slarra_".}
  
  proc slarrb*(n: var integer; d: ptr real; lld: ptr real;
     ifirst: var integer; ilast: var integer; rtol1: ptr real;
     rtol2: ptr real; offset: var integer; w: ptr real;
     wgap: ptr real; werr: ptr real; work: ptr real;
     iwork: var integer; pivmin: ptr real; spdiam: ptr real;
     twist: var integer; info: var integer): cint {.importc: "slarrb_".}
  
  proc slarrc*(jobt: var cstring; n: var integer; vl: ptr real; vu: ptr real;
     d: ptr real; e: ptr real; pivmin: ptr real;
     eigcnt: var integer; lcnt: var integer; rcnt: var integer;
     info: var integer): cint {.importc: "slarrc_".}
  
  proc slarrd*(range: var cstring; order: var cstring; n: var integer; vl: ptr real;
     vu: ptr real; il: var integer; iu: var integer; gers: ptr real;
     reltol: ptr real; d: ptr real; e: ptr real; e2: ptr real;
     pivmin: ptr real; nsplit: var integer; isplit: var integer;
     m: var integer; w: ptr real; werr: ptr real; wl: ptr real;
     wu: ptr real; iblock: var integer; indexw: var integer;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slarrd_".}
  
  proc slarre*(range: var cstring; n: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; d: ptr real; e: ptr real;
     e2: ptr real; rtol1: ptr real; rtol2: ptr real;
     spltol: ptr real; nsplit: var integer; isplit: var integer;
     m: var integer; w: ptr real; werr: ptr real; wgap: ptr real;
     iblock: var integer; indexw: var integer; gers: ptr real;
     pivmin: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "slarre_".}
  
  proc slarrf*(n: var integer; d: ptr real; l: ptr real; ld: ptr real;
     clstrt: var integer; clend: var integer; w: ptr real;
     wgap: ptr real; werr: ptr real; spdiam: ptr real;
     clgapl: ptr real; clgapr: ptr real; pivmin: ptr real;
     sigma: ptr real; dplus: ptr real; lplus: ptr real;
     work: ptr real; info: var integer): cint {.importc: "slarrf_".}
  
  proc slarrj*(n: var integer; d: ptr real; e2: ptr real;
     ifirst: var integer; ilast: var integer; rtol: ptr real;
     offset: var integer; w: ptr real; werr: ptr real;
     work: ptr real; iwork: var integer; pivmin: ptr real;
     spdiam: ptr real; info: var integer): cint {.importc: "slarrj_".}
  
  proc slarrk*(n: var integer; iw: var integer; gl: ptr real; gu: ptr real;
     d: ptr real; e2: ptr real; pivmin: ptr real; reltol: ptr real;
     w: ptr real; werr: ptr real; info: var integer): cint {.importc: "slarrk_".}
  
  proc slarrr*(n: var integer; d: ptr real; e: ptr real; info: var integer): cint {.importc: "slarrr_".}
  
  proc slarrv*(n: var integer; vl: ptr real; vu: ptr real; d: ptr real;
     l: ptr real; pivmin: ptr real; isplit: var integer;
     m: var integer; dol: var integer; dou: var integer;
     minrgp: ptr real; rtol1: ptr real; rtol2: ptr real; w: ptr real;
     werr: ptr real; wgap: ptr real; iblock: var integer;
     indexw: var integer; gers: ptr real; z: ptr real;
     ldz: var integer; isuppz: var integer; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "slarrv_".}
  
  proc slarscl2*(m: var integer; n: var integer; d: ptr real; x: ptr real;
       ldx: var integer): cint {.importc: "slarscl2_".}
  
  proc slartg*(f: ptr real; g: ptr real; cs: ptr real; sn: ptr real;
     r: ptr real): cint {.importc: "slartg_".}
  
  proc slartv*(n: var integer; x: ptr real; incx: var integer; y: ptr real;
     incy: var integer; c: ptr real; s: ptr real; incc: var integer): cint {.importc: "slartv_".}
  
  proc slaruv*(iseed: var integer; n: var integer; x: ptr real): cint {.importc: "slaruv_".}
  
  proc slarz*(side: var cstring; m: var integer; n: var integer; l: var integer;
    v: ptr real; incv: var integer; tau: ptr real; c: ptr real;
    ldc: var integer; work: ptr real): cint {.importc: "slarz_".}
  
  proc slarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer; l: var integer;
     v: ptr real; ldv: var integer; t: ptr real; ldt: var integer;
     c: ptr real; ldc: var integer; work: ptr real;
     ldwork: var integer): cint {.importc: "slarzb_".}
  
  proc slarzt*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr real; ldv: var integer; tau: ptr real;
     t: ptr real; ldt: var integer): cint {.importc: "slarzt_".}
  
  proc slas2*(f: ptr real; g: ptr real; h: ptr real; ssmin: ptr real;
    ssmax: ptr real): cint {.importc: "slas2_".}
  
  proc slascl*(mtype: var cstring; kl: var integer; ku: var integer;
     cfrom: ptr real; cto: ptr real; m: var integer; n: var integer;
     a: ptr real; lda: var integer; info: var integer): cint {.importc: "slascl_".}
  
  proc slascl2*(m: var integer; n: var integer; d: ptr real; x: ptr real;
      ldx: var integer): cint {.importc: "slascl2_".}
  
  proc slasd0*(n: var integer; sqre: var integer; d: ptr real; e: ptr real;
     u: ptr real; ldu: var integer; vt: ptr real; ldvt: var integer;
     smlsiz: var integer; iwork: var integer; work: ptr real;
     info: var integer): cint {.importc: "slasd0_".}
  
  proc slasd1*(nl: var integer; nr: var integer; sqre: var integer;
     d: ptr real; alpha: ptr real; beta: ptr real; u: ptr real;
     ldu: var integer; vt: ptr real; ldvt: var integer;
     idxq: var integer; iwork: var integer; work: ptr real;
     info: var integer): cint {.importc: "slasd1_".}
  
  proc slasd2*(nl: var integer; nr: var integer; sqre: var integer;
     k: var integer; d: ptr real; z: ptr real; alpha: ptr real;
     beta: ptr real; u: ptr real; ldu: var integer; vt: ptr real;
     ldvt: var integer; dsigma: ptr real; u2: ptr real;
     ldu2: var integer; vt2: ptr real; ldvt2: var integer;
     idxp: var integer; idx: var integer; idxc: var integer;
     idxq: var integer; coltyp: var integer; info: var integer): cint {.importc: "slasd2_".}
  
  proc slasd3*(nl: var integer; nr: var integer; sqre: var integer;
     k: var integer; d: ptr real; q: ptr real; ldq: var integer;
     dsigma: ptr real; u: ptr real; ldu: var integer; u2: ptr real;
     ldu2: var integer; vt: ptr real; ldvt: var integer;
     vt2: ptr real; ldvt2: var integer; idxc: var integer;
     ctot: var integer; z: ptr real; info: var integer): cint {.importc: "slasd3_".}
  
  proc slasd4*(n: var integer; i: var integer; d: ptr real; z: ptr real;
     delta: ptr real; rho: ptr real; sigma: ptr real; work: ptr real;
     info: var integer): cint {.importc: "slasd4_".}
  
  proc slasd5*(i: var integer; d: ptr real; z: ptr real; delta: ptr real;
     rho: ptr real; dsigma: ptr real; work: ptr real): cint {.importc: "slasd5_".}
  
  proc slasd6*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; d: ptr real; vf: ptr real; vl: ptr real;
     alpha: ptr real; beta: ptr real; idxq: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     ldgcol: var integer; givnum: ptr real; ldgnum: var integer;
     poles: ptr real; difl: ptr real; difr: ptr real; z: ptr real;
     k: var integer; c: ptr real; s: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "slasd6_".}
  
  proc slasd7*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; k: var integer; d: ptr real; z: ptr real;
     zw: ptr real; vf: ptr real; vfw: ptr real; vl: ptr real;
     vlw: ptr real; alpha: ptr real; beta: ptr real;
     dsigma: ptr real; idx: var integer; idxp: var integer;
     idxq: var integer; perm: var integer; givptr: var integer;
     givcol: var integer; ldgcol: var integer; givnum: ptr real;
     ldgnum: var integer; c: ptr real; s: ptr real;
     info: var integer): cint {.importc: "slasd7_".}
  
  proc slasd8*(icompq: var integer; k: var integer; d: ptr real;
     z: ptr real; vf: ptr real; vl: ptr real; difl: ptr real;
     difr: ptr real; lddifr: var integer; dsigma: ptr real;
     work: ptr real; info: var integer): cint {.importc: "slasd8_".}
  
  proc slasda*(icompq: var integer; smlsiz: var integer; n: var integer;
     sqre: var integer; d: ptr real; e: ptr real; u: ptr real;
     ldu: var integer; vt: ptr real; k: var integer; difl: ptr real;
     difr: ptr real; z: ptr real; poles: ptr real;
     givptr: var integer; givcol: var integer; ldgcol: var integer;
     perm: var integer; givnum: ptr real; c: ptr real; s: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "slasda_".}
  
  proc slasdq*(uplo: var cstring; sqre: var integer; n: var integer;
     ncvt: var integer; nru: var integer; ncc: var integer;
     d: ptr real; e: ptr real; vt: ptr real; ldvt: var integer;
     u: ptr real; ldu: var integer; c: ptr real; ldc: var integer;
     work: ptr real; info: var integer): cint {.importc: "slasdq_".}
  
  proc slasdt*(n: var integer; lvl: var integer; nd: var integer;
     inode: var integer; ndiml: var integer; ndimr: var integer;
     msub: var integer): cint {.importc: "slasdt_".}
  
  proc slaset*(uplo: var cstring; m: var integer; n: var integer; alpha: ptr real;
     beta: ptr real; a: ptr real; lda: var integer): cint {.importc: "slaset_".}
  
  proc slasq1*(n: var integer; d: ptr real; e: ptr real; work: ptr real;
     info: var integer): cint {.importc: "slasq1_".}
  
  proc slasq2*(n: var integer; z: ptr real; info: var integer): cint {.importc: "slasq2_".}
  
  proc slasq3*(i0: var integer; n0: var integer; z: ptr real;
     pp: var integer; dmin: ptr real; sigma: ptr real;
     desig: ptr real; qmax: ptr real; nfail: var integer;
     iter: var integer; ndiv: var integer; ieee: ptr logical;
     ttype: var integer; dmin1: ptr real; dmin2: ptr real;
     dn: ptr real; dn1: ptr real; dn2: ptr real; g: ptr real;
     tau: ptr real): cint {.importc: "slasq3_".}
  
  proc slasq4*(i0: var integer; n0: var integer; z: ptr real;
     pp: var integer; n0in: var integer; dmin: ptr real;
     dmin1: ptr real; dmin2: ptr real; dn: ptr real; dn1: ptr real;
     dn2: ptr real; tau: ptr real; ttype: var integer; g: ptr real): cint {.importc: "slasq4_".}
  
  proc slasq5*(i0: var integer; n0: var integer; z: ptr real;
     pp: var integer; tau: ptr real; dmin: ptr real;
     dmin1: ptr real; dmin2: ptr real; dn: ptr real; dnm1: ptr real;
     dnm2: ptr real; ieee: ptr logical): cint {.importc: "slasq5_".}
  
  proc slasq6*(i0: var integer; n0: var integer; z: ptr real;
     pp: var integer; dmin: ptr real; dmin1: ptr real;
     dmin2: ptr real; dn: ptr real; dnm1: ptr real; dnm2: ptr real): cint {.importc: "slasq6_".}
  
  proc slasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;
    n: var integer; c: ptr real; s: ptr real; a: ptr real;
    lda: var integer): cint {.importc: "slasr_".}
  
  proc slasrt*(id: var cstring; n: var integer; d: ptr real; info: var integer): cint {.importc: "slasrt_".}
  
  proc slassq*(n: var integer; x: ptr real; incx: var integer; scale: ptr real;
     sumsq: ptr real): cint {.importc: "slassq_".}
  
  proc slasv2*(f: ptr real; g: ptr real; h: ptr real; ssmin: ptr real;
     ssmax: ptr real; snr: ptr real; csr: ptr real; snl: ptr real;
     csl: ptr real): cint {.importc: "slasv2_".}
  
  proc slaswp*(n: var integer; a: ptr real; lda: var integer; k1: var integer;
     k2: var integer; ipiv: var cint; incx: var integer): cint {.importc: "slaswp_".}
  
  proc slasy2*(ltranl: ptr logical; ltranr: ptr logical; isgn: var integer;
     n1: var integer; n2: var integer; tl: ptr real;
     ldtl: var integer; tr: ptr real; ldtr: var integer; b: ptr real;
     ldb: var integer; scale: ptr real; x: ptr real;
     ldx: var integer; xnorm: ptr real; info: var integer): cint {.importc: "slasy2_".}
  
  proc slasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;
     a: ptr real; lda: var integer; ipiv: var cint; w: ptr real;
     ldw: var integer; info: var integer): cint {.importc: "slasyf_".}
  
  proc slatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; x: ptr real; scale: ptr real;
     cnorm: ptr real; info: var integer): cint {.importc: "slatbs_".}
  
  proc slatdf*(ijob: var integer; n: var integer; z: ptr real;
     ldz: var integer; rhs: ptr real; rdsum: ptr real;
     rdscal: ptr real; ipiv: var cint; jpiv: var cint): cint {.importc: "slatdf_".}
  
  proc slatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; ap: ptr real; x: ptr real; scale: ptr real;
     cnorm: ptr real; info: var integer): cint {.importc: "slatps_".}
  
  proc slatrd*(uplo: var cstring; n: var integer; nb: var integer; a: ptr real;
     lda: var integer; e: ptr real; tau: ptr real; w: ptr real;
     ldw: var integer): cint {.importc: "slatrd_".}
  
  proc slatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; a: ptr real; lda: var integer; x: ptr real;
     scale: ptr real; cnorm: ptr real; info: var integer): cint {.importc: "slatrs_".}
  
  proc slatrz*(m: var integer; n: var integer; l: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real): cint {.importc: "slatrz_".}
  
  proc slatzm*(side: var cstring; m: var integer; n: var integer; v: ptr real;
     incv: var integer; tau: ptr real; c1: ptr real; c2: ptr real;
     ldc: var integer; work: ptr real): cint {.importc: "slatzm_".}
  
  proc slauu2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     info: var integer): cint {.importc: "slauu2_".}
  
  proc slauum*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     info: var integer): cint {.importc: "slauum_".}
  
  proc sopgtr*(uplo: var cstring; n: var integer; ap: ptr real; tau: ptr real;
     q: ptr real; ldq: var integer; work: ptr real; info: var integer): cint {.importc: "sopgtr_".}
  
  proc sopmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; ap: ptr real; tau: ptr real; c: ptr real;
     ldc: var integer; work: ptr real; info: var integer): cint {.importc: "sopmtr_".}
  
  proc sorg2l*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sorg2l_".}
  
  proc sorg2r*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sorg2r_".}
  
  proc sorgbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;
     a: ptr real; lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sorgbr_".}
  
  proc sorghr*(n: var integer; ilo: var integer; ihi: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sorghr_".}
  
  proc sorgl2*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sorgl2_".}
  
  proc sorglq*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sorglq_".}
  
  proc sorgql*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sorgql_".}
  
  proc sorgqr*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sorgqr_".}
  
  proc sorgr2*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sorgr2_".}
  
  proc sorgrq*(m: var integer; n: var integer; k: var integer; a: ptr real;
     lda: var integer; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sorgrq_".}
  
  proc sorgtr*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sorgtr_".}
  
  proc sorm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sorm2l_".}
  
  proc sorm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sorm2r_".}
  
  proc sormbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;
     n: var integer; k: var integer; a: ptr real; lda: var integer;
     tau: ptr real; c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormbr_".}
  
  proc sormhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr real;
     lda: var integer; tau: ptr real; c: ptr real;
     ldc: var integer; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "sormhr_".}
  
  proc sorml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sorml2_".}
  
  proc sormlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormlq_".}
  
  proc sormql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormql_".}
  
  proc sormqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormqr_".}
  
  proc sormr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sormr2_".}
  
  proc sormr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr real; lda: var integer;
     tau: ptr real; c: ptr real; ldc: var integer; work: ptr real;
     info: var integer): cint {.importc: "sormr3_".}
  
  proc sormrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormrq_".}
  
  proc sormrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr real; lda: var integer;
     tau: ptr real; c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormrz_".}
  
  proc sormtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; a: ptr real; lda: var integer; tau: ptr real;
     c: ptr real; ldc: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "sormtr_".}
  
  proc spbcon*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; anorm: ptr real; rcond: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "spbcon_".}
  
  proc spbequ*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; s: ptr real; scond: ptr real; amax: ptr real;
     info: var integer): cint {.importc: "spbequ_".}
  
  proc spbrfs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr real; ldab: var integer;
     afb: ptr real; ldafb: var integer; b: ptr real;
     ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "spbrfs_".}
  
  proc spbstf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; info: var integer): cint {.importc: "spbstf_".}
  
  proc spbsv*(uplo: var cstring; n: var integer; kd: var integer;
    nrhs: var integer; ab: ptr real; ldab: var integer; b: ptr real;
    ldb: var integer; info: var integer): cint {.importc: "spbsv_".}
  
  proc spbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr real; ldab: var integer;
     afb: ptr real; ldafb: var integer; equed: var cstring; s: ptr real;
     b: ptr real; ldb: var integer; x: ptr real; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "spbsvx_".}
  
  proc spbtf2*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; info: var integer): cint {.importc: "spbtf2_".}
  
  proc spbtrf*(uplo: var cstring; n: var integer; kd: var integer; ab: ptr real;
     ldab: var integer; info: var integer): cint {.importc: "spbtrf_".}
  
  proc spbtrs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr real; ldab: var integer; b: ptr real;
     ldb: var integer; info: var integer): cint {.importc: "spbtrs_".}
  
  proc spftrf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr real;
     info: var integer): cint {.importc: "spftrf_".}
  
  proc spftri*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr real;
     info: var integer): cint {.importc: "spftri_".}
  
  proc spftrs*(transr: var cstring; uplo: var cstring; n: var integer;
     nrhs: var integer; a: ptr real; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "spftrs_".}
  
  proc spocon*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     anorm: ptr real; rcond: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "spocon_".}
  
  proc spoequ*(n: var integer; a: ptr real; lda: var integer; s: ptr real;
     scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "spoequ_".}
  
  proc spoequb*(n: var integer; a: ptr real; lda: var integer; s: ptr real;
      scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "spoequb_".}
  
  proc sporfs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; af: ptr real; ldaf: var integer; b: ptr real;
     ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sporfs_".}
  
  proc sporfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
      ldaf: var integer; s: ptr real; b: ptr real; ldb: var integer;
      x: ptr real; ldx: var integer; rcond: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr real; iwork: var integer;
      info: var integer): cint {.importc: "sporfsx_".}
  
  proc sposv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;
    lda: var integer; b: ptr real; ldb: var integer;
    info: var integer): cint {.importc: "sposv_".}
  
  proc sposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr real; lda: var integer; af: ptr real; ldaf: var integer;
     equed: var cstring; s: ptr real; b: ptr real; ldb: var integer;
     x: ptr real; ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sposvx_".}
  
  proc sposvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
      ldaf: var integer; equed: var cstring; s: ptr real; b: ptr real;
      ldb: var integer; x: ptr real; ldx: var integer;
      rcond: ptr real; rpvgrw: ptr real; berr: ptr real;
      n_err_bnds: var integer; err_bnds_norm: ptr real;
      err_bnds_comp: ptr real; nparams: var integer;
      params: ptr real; work: ptr real; iwork: var integer;
      info: var integer): cint {.importc: "sposvxx_".}
  
  proc spotf2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     info: var integer): cint {.importc: "spotf2_".}
  
  proc spotrf*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     info: var integer): cint {.importc: "spotrf_".}
  
  proc spotri*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     info: var integer): cint {.importc: "spotri_".}
  
  proc spotrs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "spotrs_".}
  
  proc sppcon*(uplo: var cstring; n: var integer; ap: ptr real; anorm: ptr real;
     rcond: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sppcon_".}
  
  proc sppequ*(uplo: var cstring; n: var integer; ap: ptr real; s: ptr real;
     scond: ptr real; amax: ptr real; info: var integer): cint {.importc: "sppequ_".}
  
  proc spprfs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;
     afp: ptr real; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "spprfs_".}
  
  proc sppsv*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;
    b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sppsv_".}
  
  proc sppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr real; afp: ptr real; equed: var cstring; s: ptr real;
     b: ptr real; ldb: var integer; x: ptr real; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sppsvx_".}
  
  proc spptrf*(uplo: var cstring; n: var integer; ap: ptr real; info: var integer): cint {.importc: "spptrf_".}
  
  proc spptri*(uplo: var cstring; n: var integer; ap: ptr real; info: var integer): cint {.importc: "spptri_".}
  
  proc spptrs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;
     b: ptr real; ldb: var integer; info: var integer): cint {.importc: "spptrs_".}
  
  proc spstf2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     piv: var integer; rank: var integer; tol: ptr real;
     work: ptr real; info: var integer): cint {.importc: "spstf2_".}
  
  proc spstrf*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     piv: var integer; rank: var integer; tol: ptr real;
     work: ptr real; info: var integer): cint {.importc: "spstrf_".}
  
  proc sptcon*(n: var integer; d: ptr real; e: ptr real; anorm: ptr real;
     rcond: ptr real; work: ptr real; info: var integer): cint {.importc: "sptcon_".}
  
  proc spteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     info: var integer): cint {.importc: "spteqr_".}
  
  proc sptrfs*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;
     df: ptr real; ef: ptr real; b: ptr real; ldb: var integer;
     x: ptr real; ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; info: var integer): cint {.importc: "sptrfs_".}
  
  proc sptsv*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;
    b: ptr real; ldb: var integer; info: var integer): cint {.importc: "sptsv_".}
  
  proc sptsvx*(fact: var cstring; n: var integer; nrhs: var integer; d: ptr real;
     e: ptr real; df: ptr real; ef: ptr real; b: ptr real;
     ldb: var integer; x: ptr real; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;
     info: var integer): cint {.importc: "sptsvx_".}
  
  proc spttrf*(n: var integer; d: ptr real; e: ptr real; info: var integer): cint {.importc: "spttrf_".}
  
  proc spttrs*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;
     b: ptr real; ldb: var integer; info: var integer): cint {.importc: "spttrs_".}
  
  proc sptts2*(n: var integer; nrhs: var integer; d: ptr real; e: ptr real;
     b: ptr real; ldb: var integer): cint {.importc: "sptts2_".}
  
  proc srscl*(n: var integer; sa: ptr real; sx: ptr real; incx: var integer): cint {.importc: "srscl_".}
  
  proc ssbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
    ab: ptr real; ldab: var integer; w: ptr real; z: ptr real;
    ldz: var integer; work: ptr real; info: var integer): cint {.importc: "ssbev_".}
  
  proc ssbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr real; ldab: var integer; w: ptr real; z: ptr real;
     ldz: var integer; work: ptr real; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "ssbevd_".}
  
  proc ssbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     kd: var integer; ab: ptr real; ldab: var integer; q: ptr real;
     ldq: var integer; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "ssbevx_".}
  
  proc ssbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr real; ldab: var integer; bb: ptr real;
     ldbb: var integer; x: ptr real; ldx: var integer;
     work: ptr real; info: var integer): cint {.importc: "ssbgst_".}
  
  proc ssbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
    kb: var integer; ab: ptr real; ldab: var integer; bb: ptr real;
    ldbb: var integer; w: ptr real; z: ptr real; ldz: var integer;
    work: ptr real; info: var integer): cint {.importc: "ssbgv_".}
  
  proc ssbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr real; ldab: var integer; bb: ptr real;
     ldbb: var integer; w: ptr real; z: ptr real; ldz: var integer;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "ssbgvd_".}
  
  proc ssbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ka: var integer; kb: var integer; ab: ptr real;
     ldab: var integer; bb: ptr real; ldbb: var integer; q: ptr real;
     ldq: var integer; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "ssbgvx_".}
  
  proc ssbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr real; ldab: var integer; d: ptr real; e: ptr real;
     q: ptr real; ldq: var integer; work: ptr real; info: var integer): cint {.importc: "ssbtrd_".}
  
  proc ssfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;
    k: var integer; alpha: ptr real; a: ptr real; lda: var integer;
    beta: ptr real; c: ptr real): cint {.importc: "ssfrk_".}
  
  proc sspcon*(uplo: var cstring; n: var integer; ap: ptr real; ipiv: var cint;
     anorm: ptr real; rcond: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sspcon_".}
  
  proc sspev*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr real;
    w: ptr real; z: ptr real; ldz: var integer; work: ptr real;
    info: var integer): cint {.importc: "sspev_".}
  
  proc sspevd*(jobz: var cstring; uplo: var cstring; n: var integer; ap: ptr real;
     w: ptr real; z: ptr real; ldz: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "sspevd_".}
  
  proc sspevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ap: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "sspevx_".}
  
  proc sspgst*(itype: var integer; uplo: var cstring; n: var integer; ap: ptr real;
     bp: ptr real; info: var integer): cint {.importc: "sspgst_".}
  
  proc sspgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    ap: ptr real; bp: ptr real; w: ptr real; z: ptr real;
    ldz: var integer; work: ptr real; info: var integer): cint {.importc: "sspgv_".}
  
  proc sspgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; ap: ptr real; bp: ptr real; w: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "sspgvd_".}
  
  proc sspgvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; ap: ptr real; bp: ptr real;
     vl: ptr real; vu: ptr real; il: var integer; iu: var integer;
     abstol: ptr real; m: var integer; w: ptr real; z: ptr real;
     ldz: var integer; work: ptr real; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "sspgvx_".}
  
  proc ssprfs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;
     afp: ptr real; ipiv: var cint; b: ptr real; ldb: var integer;
     x: ptr real; ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "ssprfs_".}
  
  proc sspsv*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;
    ipiv: var cint; b: ptr real; ldb: var integer;
    info: var integer): cint {.importc: "sspsv_".}
  
  proc sspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr real; afp: ptr real; ipiv: var cint; b: ptr real;
     ldb: var integer; x: ptr real; ldx: var integer;
     rcond: ptr real; ferr: ptr real; berr: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "sspsvx_".}
  
  proc ssptrd*(uplo: var cstring; n: var integer; ap: ptr real; d: ptr real;
     e: ptr real; tau: ptr real; info: var integer): cint {.importc: "ssptrd_".}
  
  proc ssptrf*(uplo: var cstring; n: var integer; ap: ptr real; ipiv: var cint;
     info: var integer): cint {.importc: "ssptrf_".}
  
  proc ssptri*(uplo: var cstring; n: var integer; ap: ptr real; ipiv: var cint;
     work: ptr real; info: var integer): cint {.importc: "ssptri_".}
  
  proc ssptrs*(uplo: var cstring; n: var integer; nrhs: var integer; ap: ptr real;
     ipiv: var cint; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "ssptrs_".}
  
  proc sstebz*(range: var cstring; order: var cstring; n: var integer; vl: ptr real;
     vu: ptr real; il: var integer; iu: var integer;
     abstol: ptr real; d: ptr real; e: ptr real; m: var integer;
     nsplit: var integer; w: ptr real; iblock: var integer;
     isplit: var integer; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "sstebz_".}
  
  proc sstedc*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "sstedc_".}
  
  proc sstegr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;
     e: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr real; ldz: var integer; isuppz: var integer;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "sstegr_".}
  
  proc sstein*(n: var integer; d: ptr real; e: ptr real; m: var integer;
     w: ptr real; iblock: var integer; isplit: var integer;
     z: ptr real; ldz: var integer; work: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "sstein_".}
  
  proc sstemr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;
     e: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; m: var integer; w: ptr real; z: ptr real;
     ldz: var integer; nzc: var integer; isuppz: var integer;
     tryrac: ptr logical; work: ptr real; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "sstemr_".}
  
  proc ssteqr*(compz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     info: var integer): cint {.importc: "ssteqr_".}
  
  proc ssterf*(n: var integer; d: ptr real; e: ptr real; info: var integer): cint {.importc: "ssterf_".}
  
  proc sstev*(jobz: var cstring; n: var integer; d: ptr real; e: ptr real;
    z: ptr real; ldz: var integer; work: ptr real;
    info: var integer): cint {.importc: "sstev_".}
  
  proc sstevd*(jobz: var cstring; n: var integer; d: ptr real; e: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "sstevd_".}
  
  proc sstevr*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;
     e: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr real; ldz: var integer; isuppz: var integer;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "sstevr_".}
  
  proc sstevx*(jobz: var cstring; range: var cstring; n: var integer; d: ptr real;
     e: ptr real; vl: ptr real; vu: ptr real; il: var integer;
     iu: var integer; abstol: ptr real; m: var integer; w: ptr real;
     z: ptr real; ldz: var integer; work: ptr real;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "sstevx_".}
  
  proc ssycon*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; anorm: ptr real; rcond: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "ssycon_".}
  
  proc ssyequb*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
      s: ptr real; scond: ptr real; amax: ptr real; work: ptr real;
      info: var integer): cint {.importc: "ssyequb_".}
  
  proc ssyev*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr real;
    lda: var integer; w: ptr real; work: ptr real;
    lwork: var integer; info: var integer): cint {.importc: "ssyev_".}
  
  proc ssyevd*(jobz: var cstring; uplo: var cstring; n: var integer; a: ptr real;
     lda: var integer; w: ptr real; work: ptr real;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "ssyevd_".}
  
  proc ssyevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr real; lda: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr real; ldz: var integer;
     isuppz: var integer; work: ptr real; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "ssyevr_".}
  
  proc ssyevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr real; lda: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr real; ldz: var integer;
     work: ptr real; lwork: var integer; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "ssyevx_".}
  
  proc ssygs2*(itype: var integer; uplo: var cstring; n: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "ssygs2_".}
  
  proc ssygst*(itype: var integer; uplo: var cstring; n: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "ssygst_".}
  
  proc ssygv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
    w: ptr real; work: ptr real; lwork: var integer;
    info: var integer): cint {.importc: "ssygv_".}
  
  proc ssygvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; w: ptr real; work: ptr real;
     lwork: var integer; iwork: var integer; liwork: var integer;
     info: var integer): cint {.importc: "ssygvd_".}
  
  proc ssygvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     b: ptr real; ldb: var integer; vl: ptr real; vu: ptr real;
     il: var integer; iu: var integer; abstol: ptr real;
     m: var integer; w: ptr real; z: ptr real; ldz: var integer;
     work: ptr real; lwork: var integer; iwork: var integer;
     ifail: var integer; info: var integer): cint {.importc: "ssygvx_".}
  
  proc ssyrfs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; af: ptr real; ldaf: var integer;
     ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "ssyrfs_".}
  
  proc ssyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
      ldaf: var integer; ipiv: var cint; s: ptr real; b: ptr real;
      ldb: var integer; x: ptr real; ldx: var integer;
      rcond: ptr real; berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr real;
      iwork: var integer; info: var integer): cint {.importc: "ssyrfsx_".}
  
  proc ssysv*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;
    lda: var integer; ipiv: var cint; b: ptr real;
    ldb: var integer; work: ptr real; lwork: var integer;
    info: var integer): cint {.importc: "ssysv_".}
  
  proc ssysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr real; lda: var integer; af: ptr real; ldaf: var integer;
     ipiv: var cint; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; rcond: ptr real; ferr: ptr real;
     berr: ptr real; work: ptr real; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "ssysvx_".}
  
  proc ssysvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr real; lda: var integer; af: ptr real;
      ldaf: var integer; ipiv: var cint; equed: var cstring;
      s: ptr real; b: ptr real; ldb: var integer; x: ptr real;
      ldx: var integer; rcond: ptr real; rpvgrw: ptr real;
      berr: ptr real; n_err_bnds: var integer;
      err_bnds_norm: ptr real; err_bnds_comp: ptr real;
      nparams: var integer; params: ptr real; work: ptr real;
      iwork: var integer; info: var integer): cint {.importc: "ssysvxx_".}
  
  proc ssytd2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     d: ptr real; e: ptr real; tau: ptr real; info: var integer): cint {.importc: "ssytd2_".}
  
  proc ssytf2*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "ssytf2_".}
  
  proc ssytrd*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     d: ptr real; e: ptr real; tau: ptr real; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "ssytrd_".}
  
  proc ssytrf*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "ssytrf_".}
  
  proc ssytri*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     ipiv: var cint; work: ptr real; info: var integer): cint {.importc: "ssytri_".}
  
  proc ssytrs*(uplo: var cstring; n: var integer; nrhs: var integer; a: ptr real;
     lda: var integer; ipiv: var cint; b: ptr real;
     ldb: var integer; info: var integer): cint {.importc: "ssytrs_".}
  
  proc stbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     kd: var integer; ab: ptr real; ldab: var integer;
     rcond: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "stbcon_".}
  
  proc stbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr real;
     ldab: var integer; b: ptr real; ldb: var integer; x: ptr real;
     ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "stbrfs_".}
  
  proc stbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr real;
     ldab: var integer; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "stbtrs_".}
  
  proc stfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;
    diag: var cstring; m: var integer; n: var integer; alpha: ptr real;
    a: ptr real; b: ptr real; ldb: var integer): cint {.importc: "stfsm_".}
  
  proc stftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr real; info: var integer): cint {.importc: "stftri_".}
  
  proc stfttp*(transr: var cstring; uplo: var cstring; n: var integer; arf: ptr real;
     ap: ptr real; info: var integer): cint {.importc: "stfttp_".}
  
  proc stfttr*(transr: var cstring; uplo: var cstring; n: var integer; arf: ptr real;
     a: ptr real; lda: var integer; info: var integer): cint {.importc: "stfttr_".}
  
  proc stgevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; s: ptr real; lds: var integer; p: ptr real;
     ldp: var integer; vl: ptr real; ldvl: var integer; vr: ptr real;
     ldvr: var integer; mm: var integer; m: var integer;
     work: ptr real; info: var integer): cint {.importc: "stgevc_".}
  
  proc stgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
     q: ptr real; ldq: var integer; z: ptr real; ldz: var integer;
     j1: var integer; n1: var integer; n2: var integer;
     work: ptr real; lwork: var integer; info: var integer): cint {.importc: "stgex2_".}
  
  proc stgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
     q: ptr real; ldq: var integer; z: ptr real; ldz: var integer;
     ifst: var integer; ilst: var integer; work: ptr real;
     lwork: var integer; info: var integer): cint {.importc: "stgexc_".}
  
  proc stgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;
     select: ptr logical; n: var integer; a: ptr real;
     lda: var integer; b: ptr real; ldb: var integer;
     alphar: ptr real; alphai: ptr real; beta: ptr real; q: ptr real;
     ldq: var integer; z: ptr real; ldz: var integer;
     m: var integer; pl: ptr real; pr: ptr real; dif: ptr real;
     work: ptr real; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "stgsen_".}
  
  proc stgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; k: var integer; l: var integer;
     a: ptr real; lda: var integer; b: ptr real; ldb: var integer;
     tola: ptr real; tolb: ptr real; alpha: ptr real; beta: ptr real;
     u: ptr real; ldu: var integer; v: ptr real; ldv: var integer;
     q: ptr real; ldq: var integer; work: ptr real;
     ncycle: var integer; info: var integer): cint {.importc: "stgsja_".}
  
  proc stgsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; vl: ptr real; ldvl: var integer; vr: ptr real;
     ldvr: var integer; s: ptr real; dif: ptr real; mm: var integer;
     m: var integer; work: ptr real; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "stgsna_".}
  
  proc stgsy2*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; c: ptr real; ldc: var integer;
     d: ptr real; ldd: var integer; e: ptr real; lde: var integer;
     f: ptr real; ldf: var integer; scale: ptr real; rdsum: ptr real;
     rdscal: ptr real; iwork: var integer; pq: var integer;
     info: var integer): cint {.importc: "stgsy2_".}
  
  proc stgsyl*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; c: ptr real; ldc: var integer;
     d: ptr real; ldd: var integer; e: ptr real; lde: var integer;
     f: ptr real; ldf: var integer; scale: ptr real; dif: ptr real;
     work: ptr real; lwork: var integer; iwork: var integer;
     info: var integer): cint {.importc: "stgsyl_".}
  
  proc stpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr real; rcond: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "stpcon_".}
  
  proc stprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr real; b: ptr real; ldb: var integer;
     x: ptr real; ldx: var integer; ferr: ptr real; berr: ptr real;
     work: ptr real; iwork: var integer; info: var integer): cint {.importc: "stprfs_".}
  
  proc stptri*(uplo: var cstring; diag: var cstring; n: var integer; ap: ptr real;
     info: var integer): cint {.importc: "stptri_".}
  
  proc stptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr real; b: ptr real; ldb: var integer;
     info: var integer): cint {.importc: "stptrs_".}
  
  proc stpttf*(transr: var cstring; uplo: var cstring; n: var integer; ap: ptr real;
     arf: ptr real; info: var integer): cint {.importc: "stpttf_".}
  
  proc stpttr*(uplo: var cstring; n: var integer; ap: ptr real; a: ptr real;
     lda: var integer; info: var integer): cint {.importc: "stpttr_".}
  
  proc strcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr real; lda: var integer; rcond: ptr real; work: ptr real;
     iwork: var integer; info: var integer): cint {.importc: "strcon_".}
  
  proc strevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr real; ldt: var integer; vl: ptr real;
     ldvl: var integer; vr: ptr real; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr real;
     info: var integer): cint {.importc: "strevc_".}
  
  proc strexc*(compq: var cstring; n: var integer; t: ptr real; ldt: var integer;
     q: ptr real; ldq: var integer; ifst: var integer;
     ilst: var integer; work: ptr real; info: var integer): cint {.importc: "strexc_".}
  
  proc strrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; x: ptr real; ldx: var integer; ferr: ptr real;
     berr: ptr real; work: ptr real; iwork: var integer;
     info: var integer): cint {.importc: "strrfs_".}
  
  proc strsen*(job: var cstring; compq: var cstring; select: ptr logical;
     n: var integer; t: ptr real; ldt: var integer; q: ptr real;
     ldq: var integer; wr: ptr real; wi: ptr real; m: var integer;
     s: ptr real; sep: ptr real; work: ptr real; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "strsen_".}
  
  proc strsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr real; ldt: var integer; vl: ptr real;
     ldvl: var integer; vr: ptr real; ldvr: var integer; s: ptr real;
     sep: ptr real; mm: var integer; m: var integer; work: ptr real;
     ldwork: var integer; iwork: var integer; info: var integer): cint {.importc: "strsna_".}
  
  proc strsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;
     m: var integer; n: var integer; a: ptr real; lda: var integer;
     b: ptr real; ldb: var integer; c: ptr real; ldc: var integer;
     scale: ptr real; info: var integer): cint {.importc: "strsyl_".}
  
  proc strti2*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr real;
     lda: var integer; info: var integer): cint {.importc: "strti2_".}
  
  proc strtri*(uplo: var cstring; diag: var cstring; n: var integer; a: ptr real;
     lda: var integer; info: var integer): cint {.importc: "strtri_".}
  
  proc strtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr real; lda: var integer; b: ptr real;
     ldb: var integer; info: var integer): cint {.importc: "strtrs_".}
  
  proc strttf*(transr: var cstring; uplo: var cstring; n: var integer; a: ptr real;
     lda: var integer; arf: ptr real; info: var integer): cint {.importc: "strttf_".}
  
  proc strttp*(uplo: var cstring; n: var integer; a: ptr real; lda: var integer;
     ap: ptr real; info: var integer): cint {.importc: "strttp_".}
  
  proc stzrqf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; info: var integer): cint {.importc: "stzrqf_".}
  
  proc stzrzf*(m: var integer; n: var integer; a: ptr real; lda: var integer;
     tau: ptr real; work: ptr real; lwork: var integer;
     info: var integer): cint {.importc: "stzrzf_".}
  
  #___________________________________________________________________________
  #
  # Complex, double precision
  #___________________________________________________________________________
  
  proc zbdsqr*(uplo: var cstring; n: var integer; ncvt: var integer;
     nru: var integer; ncc: var integer; d: ptr doublereal;
     e: ptr doublereal; vt: ptr doublecomplex; ldvt: var integer;
     u: ptr doublecomplex; ldu: var integer; c: ptr doublecomplex;
     ldc: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zbdsqr_".}
  
  proc zcgesv*(n: var integer; nrhs: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     work: ptr doublecomplex; swork: ptr complex;
     rwork: ptr doublereal; iter: var integer; info: var integer): cint {.importc: "zcgesv_".}
  
  proc zcposv*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     work: ptr doublecomplex; swork: ptr complex;
     rwork: ptr doublereal; iter: var integer; info: var integer): cint {.importc: "zcposv_".}
  
  proc zdrscl*(n: var integer; sa: ptr doublereal; sx: ptr doublecomplex;
     incx: var integer): cint {.importc: "zdrscl_".}
  
  proc zgbbrd*(vect: var cstring; m: var integer; n: var integer; ncc: var integer;
     kl: var integer; ku: var integer; ab: ptr doublecomplex;
     ldab: var integer; d: ptr doublereal; e: ptr doublereal;
     q: ptr doublecomplex; ldq: var integer; pt: ptr doublecomplex;
     ldpt: var integer; c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgbbrd_".}
  
  proc zgbcon*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr doublecomplex; ldab: var integer; ipiv: var cint;
     anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgbcon_".}
  
  proc zgbequ*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublecomplex; ldab: var integer;
     r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; info: var integer): cint {.importc: "zgbequ_".}
  
  proc zgbequb*(m: var integer; n: var integer; kl: var integer;
      ku: var integer; ab: ptr doublecomplex; ldab: var integer;
      r: ptr doublereal; c: ptr doublereal;
      rowcnd: ptr doublereal; colcnd: ptr doublereal;
      amax: ptr doublereal; info: var integer): cint {.importc: "zgbequb_".}
  
  proc zgbrfs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr doublecomplex;
     ldab: var integer; afb: ptr doublecomplex; ldafb: var integer;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgbrfs_".}
  
  proc zgbrfsx*(trans: var cstring; equed: var cstring; n: var integer;
      kl: var integer; ku: var integer; nrhs: var integer;
      ab: ptr doublecomplex; ldab: var integer;
      afb: ptr doublecomplex; ldafb: var integer; ipiv: var cint;
      r: ptr doublereal; c: ptr doublereal; b: ptr doublecomplex;
      ldb: var integer; x: ptr doublecomplex; ldx: var integer;
      rcond: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zgbrfsx_".}
  
  proc zgbsv*(n: var integer; kl: var integer; ku: var integer;
    nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;
    ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
    info: var integer): cint {.importc: "zgbsv_".}
  
  proc zgbsvx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr doublecomplex;
     ldab: var integer; afb: ptr doublecomplex; ldafb: var integer;
     ipiv: var cint; equed: var cstring; r: ptr doublereal;
     c: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgbsvx_".}
  
  proc zgbsvxx*(fact: var cstring; trans: var cstring; n: var integer; kl: var integer;
      ku: var integer; nrhs: var integer; ab: ptr doublecomplex;
      ldab: var integer; afb: ptr doublecomplex; ldafb: var integer;
      ipiv: var cint; equed: var cstring; r: ptr doublereal;
      c: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
      x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
      rpvgrw: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zgbsvxx_".}
  
  proc zgbtf2*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublecomplex; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "zgbtf2_".}
  
  proc zgbtrf*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublecomplex; ldab: var integer;
     ipiv: var cint; info: var integer): cint {.importc: "zgbtrf_".}
  
  proc zgbtrs*(trans: var cstring; n: var integer; kl: var integer;
     ku: var integer; nrhs: var integer; ab: ptr doublecomplex;
     ldab: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zgbtrs_".}
  
  proc zgebak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; scale: ptr doublereal; m: var integer;
     v: ptr doublecomplex; ldv: var integer; info: var integer): cint {.importc: "zgebak_".}
  
  proc zgebal*(job: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ilo: var integer; ihi: var integer;
     scale: ptr doublereal; info: var integer): cint {.importc: "zgebal_".}
  
  proc zgebd2*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tauq: ptr doublecomplex; taup: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgebd2_".}
  
  proc zgebrd*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tauq: ptr doublecomplex; taup: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgebrd_".}
  
  proc zgecon*(norm: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgecon_".}
  
  proc zgeequ*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; info: var integer): cint {.importc: "zgeequ_".}
  
  proc zgeequb*(m: var integer; n: var integer; a: ptr doublecomplex;
      lda: var integer; r: ptr doublereal; c: ptr doublereal;
      rowcnd: ptr doublereal; colcnd: ptr doublereal;
      amax: ptr doublereal; info: var integer): cint {.importc: "zgeequb_".}
  
  proc zgees*(jobvs: var cstring; sort: var cstring; select: L_fp; n: var integer;
    a: ptr doublecomplex; lda: var integer; sdim: var integer;
    w: ptr doublecomplex; vs: ptr doublecomplex; ldvs: var integer;
    work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; bwork: ptr logical; info: var integer): cint {.importc: "zgees_".}
  
  proc zgeesx*(jobvs: var cstring; sort: var cstring; select: L_fp; sense: var cstring;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     sdim: var integer; w: ptr doublecomplex; vs: ptr doublecomplex;
     ldvs: var integer; rconde: ptr doublereal;
     rcondv: ptr doublereal; work: ptr doublecomplex;
     lwork: var integer; rwork: ptr doublereal; bwork: ptr logical;
     info: var integer): cint {.importc: "zgeesx_".}
  
  proc zgeev*(jobvl: var cstring; jobvr: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; w: ptr doublecomplex;
    vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;
    ldvr: var integer; work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; info: var integer): cint {.importc: "zgeev_".}
  
  proc zgeevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     w: ptr doublecomplex; vl: ptr doublecomplex; ldvl: var integer;
     vr: ptr doublecomplex; ldvr: var integer; ilo: var integer;
     ihi: var integer; scale: ptr doublereal; abnrm: ptr doublereal;
     rconde: ptr doublereal; rcondv: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgeevx_".}
  
  proc zgegs*(jobvsl: var cstring; jobvsr: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer; alpha: ptr doublecomplex;
    beta: ptr doublecomplex; vsl: ptr doublecomplex;
    ldvsl: var integer; vsr: ptr doublecomplex; ldvsr: var integer;
    work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; info: var integer): cint {.importc: "zgegs_".}
  
  proc zgegv*(jobvl: var cstring; jobvr: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer; alpha: ptr doublecomplex;
    beta: ptr doublecomplex; vl: ptr doublecomplex;
    ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;
    work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; info: var integer): cint {.importc: "zgegv_".}
  
  proc zgehd2*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgehd2_".}
  
  proc zgehrd*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgehrd_".}
  
  proc zgelq2*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgelq2_".}
  
  proc zgelqf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgelqf_".}
  
  proc zgels*(trans: var cstring; m: var integer; n: var integer;
    nrhs: var integer; a: ptr doublecomplex; lda: var integer;
    b: ptr doublecomplex; ldb: var integer; work: ptr doublecomplex;
    lwork: var integer; info: var integer): cint {.importc: "zgels_".}
  
  proc zgelsd*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;
     rank: var integer; work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zgelsd_".}
  
  proc zgelss*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; s: ptr doublereal; rcond: ptr doublereal;
     rank: var integer; work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgelss_".}
  
  proc zgelsx*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; jpvt: var integer; rcond: ptr doublereal;
     rank: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgelsx_".}
  
  proc zgelsy*(m: var integer; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; jpvt: var integer; rcond: ptr doublereal;
     rank: var integer; work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgelsy_".}
  
  proc zgeql2*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgeql2_".}
  
  proc zgeqlf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgeqlf_".}
  
  proc zgeqp3*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; jpvt: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgeqp3_".}
  
  proc zgeqpf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; jpvt: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgeqpf_".}
  
  proc zgeqr2*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgeqr2_".}
  
  proc zgeqrf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgeqrf_".}
  
  proc zgerfs*(trans: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgerfs_".}
  
  proc zgerfsx*(trans: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
      r: ptr doublereal; c: ptr doublereal; b: ptr doublecomplex;
      ldb: var integer; x: ptr doublecomplex; ldx: var integer;
      rcond: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zgerfsx_".}
  
  proc zgerq2*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgerq2_".}
  
  proc zgerqf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgerqf_".}
  
  proc zgesc2*(n: var integer; a: ptr doublecomplex; lda: var integer;
     rhs: ptr doublecomplex; ipiv: var cint; jpiv: var cint;
     scale: ptr doublereal): cint {.importc: "zgesc2_".}
  
  proc zgesdd*(jobz: var cstring; m: var integer; n: var integer;
     a: ptr doublecomplex; lda: var integer; s: ptr doublereal;
     u: ptr doublecomplex; ldu: var integer; vt: ptr doublecomplex;
     ldvt: var integer; work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zgesdd_".}
  
  proc zgesv*(n: var integer; nrhs: var integer; a: ptr doublecomplex;
    lda: var integer; ipiv: var cint; b: ptr doublecomplex;
    ldb: var integer; info: var integer): cint {.importc: "zgesv_".}
  
  proc zgesvd*(jobu: var cstring; jobvt: var cstring; m: var integer; n: var integer;
     a: ptr doublecomplex; lda: var integer; s: ptr doublereal;
     u: ptr doublecomplex; ldu: var integer; vt: ptr doublecomplex;
     ldvt: var integer; work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgesvd_".}
  
  proc zgesvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublecomplex; lda: var integer;
     af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
     equed: var cstring; r: ptr doublereal; c: ptr doublereal;
     b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
     ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zgesvx_".}
  
  proc zgesvxx*(fact: var cstring; trans: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
      equed: var cstring; r: ptr doublereal; c: ptr doublereal;
      b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
      ldx: var integer; rcond: ptr doublereal;
      rpvgrw: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zgesvxx_".}
  
  proc zgetc2*(n: var integer; a: ptr doublecomplex; lda: var integer;
     ipiv: var cint; jpiv: var cint; info: var integer): cint {.importc: "zgetc2_".}
  
  proc zgetf2*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zgetf2_".}
  
  proc zgetrf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zgetrf_".}
  
  proc zgetri*(n: var integer; a: ptr doublecomplex; lda: var integer;
     ipiv: var cint; work: ptr doublecomplex; lwork: var integer;
     info: var integer): cint {.importc: "zgetri_".}
  
  proc zgetrs*(trans: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; ipiv: var cint;
     b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zgetrs_".}
  
  proc zggbak*(job: var cstring; side: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; lscale: ptr doublereal;
     rscale: ptr doublereal; m: var integer; v: ptr doublecomplex;
     ldv: var integer; info: var integer): cint {.importc: "zggbak_".}
  
  proc zggbal*(job: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     ilo: var integer; ihi: var integer; lscale: ptr doublereal;
     rscale: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "zggbal_".}
  
  proc zgges*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
    n: var integer; a: ptr doublecomplex; lda: var integer;
    b: ptr doublecomplex; ldb: var integer; sdim: var integer;
    alpha: ptr doublecomplex; beta: ptr doublecomplex;
    vsl: ptr doublecomplex; ldvsl: var integer;
    vsr: ptr doublecomplex; ldvsr: var integer;
    work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; bwork: ptr logical; info: var integer): cint {.importc: "zgges_".}
  
  proc zggesx*(jobvsl: var cstring; jobvsr: var cstring; sort: var cstring; selctg: L_fp;
     sense: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     sdim: var integer; alpha: ptr doublecomplex;
     beta: ptr doublecomplex; vsl: ptr doublecomplex;
     ldvsl: var integer; vsr: ptr doublecomplex; ldvsr: var integer;
     rconde: ptr doublereal; rcondv: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; iwork: var integer; liwork: var integer;
     bwork: ptr logical; info: var integer): cint {.importc: "zggesx_".}
  
  proc zggev*(jobvl: var cstring; jobvr: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer; alpha: ptr doublecomplex;
    beta: ptr doublecomplex; vl: ptr doublecomplex;
    ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;
    work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; info: var integer): cint {.importc: "zggev_".}
  
  proc zggevx*(balanc: var cstring; jobvl: var cstring; jobvr: var cstring; sense: var cstring;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer;
     alpha: ptr doublecomplex; beta: ptr doublecomplex;
     vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;
     ldvr: var integer; ilo: var integer; ihi: var integer;
     lscale: ptr doublereal; rscale: ptr doublereal;
     abnrm: ptr doublereal; bbnrm: ptr doublereal;
     rconde: ptr doublereal; rcondv: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; iwork: var integer; bwork: ptr logical;
     info: var integer): cint {.importc: "zggevx_".}
  
  proc zggglm*(n: var integer; m: var integer; p: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; d: ptr doublecomplex; x: ptr doublecomplex;
     y: ptr doublecomplex; work: ptr doublecomplex;
     lwork: var integer; info: var integer): cint {.importc: "zggglm_".}
  
  proc zgghrd*(compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     q: ptr doublecomplex; ldq: var integer; z: ptr doublecomplex;
     ldz: var integer; info: var integer): cint {.importc: "zgghrd_".}
  
  proc zgglse*(m: var integer; n: var integer; p: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; c: ptr doublecomplex;
     d: ptr doublecomplex; x: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zgglse_".}
  
  proc zggqrf*(n: var integer; m: var integer; p: var integer;
     a: ptr doublecomplex; lda: var integer; taua: ptr doublecomplex;
     b: ptr doublecomplex; ldb: var integer; taub: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zggqrf_".}
  
  proc zggrqf*(m: var integer; p: var integer; n: var integer;
     a: ptr doublecomplex; lda: var integer; taua: ptr doublecomplex;
     b: ptr doublecomplex; ldb: var integer; taub: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zggrqf_".}
  
  proc zggsvd*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     n: var integer; p: var integer; k: var integer; l: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; alpha: ptr doublereal; beta: ptr doublereal;
     u: ptr doublecomplex; ldu: var integer; v: ptr doublecomplex;
     ldv: var integer; q: ptr doublecomplex; ldq: var integer;
     work: ptr doublecomplex; rwork: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "zggsvd_".}
  
  proc zggsvp*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     tola: ptr doublereal; tolb: ptr doublereal; k: var integer;
     l: var integer; u: ptr doublecomplex; ldu: var integer;
     v: ptr doublecomplex; ldv: var integer; q: ptr doublecomplex;
     ldq: var integer; iwork: var integer; rwork: ptr doublereal;
     tau: ptr doublecomplex; work: ptr doublecomplex;
     info: var integer): cint {.importc: "zggsvp_".}
  
  proc zgtcon*(norm: var cstring; n: var integer; dl: ptr doublecomplex;
     d: ptr doublecomplex; du: ptr doublecomplex;
     du2: ptr doublecomplex; ipiv: var cint;
     anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zgtcon_".}
  
  proc zgtrfs*(trans: var cstring; n: var integer; nrhs: var integer;
     dl: ptr doublecomplex; d: ptr doublecomplex;
     du: ptr doublecomplex; dlf: ptr doublecomplex;
     df: ptr doublecomplex; duf: ptr doublecomplex;
     du2: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgtrfs_".}
  
  proc zgtsv*(n: var integer; nrhs: var integer; dl: ptr doublecomplex;
    d: ptr doublecomplex; du: ptr doublecomplex;
    b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zgtsv_".}
  
  proc zgtsvx*(fact: var cstring; trans: var cstring; n: var integer;
     nrhs: var integer; dl: ptr doublecomplex;
     d: ptr doublecomplex; du: ptr doublecomplex;
     dlf: ptr doublecomplex; df: ptr doublecomplex;
     duf: ptr doublecomplex; du2: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zgtsvx_".}
  
  proc zgttrf*(n: var integer; dl: ptr doublecomplex; d: ptr doublecomplex;
     du: ptr doublecomplex; du2: ptr doublecomplex;
     ipiv: var cint; info: var integer): cint {.importc: "zgttrf_".}
  
  proc zgttrs*(trans: var cstring; n: var integer; nrhs: var integer;
     dl: ptr doublecomplex; d: ptr doublecomplex;
     du: ptr doublecomplex; du2: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     info: var integer): cint {.importc: "zgttrs_".}
  
  proc zgtts2*(itrans: var integer; n: var integer; nrhs: var integer;
     dl: ptr doublecomplex; d: ptr doublecomplex;
     du: ptr doublecomplex; du2: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer): cint {.importc: "zgtts2_".}
  
  proc zhbev*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
    ab: ptr doublecomplex; ldab: var integer; w: ptr doublereal;
    z: ptr doublecomplex; ldz: var integer;
    work: ptr doublecomplex; rwork: ptr doublereal; info: var integer): cint {.importc: "zhbev_".}
  
  proc zhbevd*(jobz: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zhbevd_".}
  
  proc zhbevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     kd: var integer; ab: ptr doublecomplex; ldab: var integer;
     q: ptr doublecomplex; ldq: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; rwork: ptr doublereal;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "zhbevx_".}
  
  proc zhbgst*(vect: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr doublecomplex; ldab: var integer;
     bb: ptr doublecomplex; ldbb: var integer; x: ptr doublecomplex;
     ldx: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zhbgst_".}
  
  proc zhbgv*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
    kb: var integer; ab: ptr doublecomplex; ldab: var integer;
    bb: ptr doublecomplex; ldbb: var integer; w: ptr doublereal;
    z: ptr doublecomplex; ldz: var integer;
    work: ptr doublecomplex; rwork: ptr doublereal; info: var integer): cint {.importc: "zhbgv_".}
  
  proc zhbgvd*(jobz: var cstring; uplo: var cstring; n: var integer; ka: var integer;
     kb: var integer; ab: ptr doublecomplex; ldab: var integer;
     bb: ptr doublecomplex; ldbb: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zhbgvd_".}
  
  proc zhbgvx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ka: var integer; kb: var integer; ab: ptr doublecomplex;
     ldab: var integer; bb: ptr doublecomplex; ldbb: var integer;
     q: ptr doublecomplex; ldq: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; rwork: ptr doublereal;
     iwork: var integer; ifail: var integer; info: var integer): cint {.importc: "zhbgvx_".}
  
  proc zhbtrd*(vect: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; d: ptr doublereal;
     e: ptr doublereal; q: ptr doublecomplex; ldq: var integer;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zhbtrd_".}
  
  proc zhecon*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; anorm: ptr doublereal;
     rcond: ptr doublereal; work: ptr doublecomplex;
     info: var integer): cint {.importc: "zhecon_".}
  
  proc zheequb*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
      lda: var integer; s: ptr doublereal; scond: ptr doublereal;
      amax: ptr doublereal; work: ptr doublecomplex;
      info: var integer): cint {.importc: "zheequb_".}
  
  proc zheev*(jobz: var cstring; uplo: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; w: ptr doublereal;
    work: ptr doublecomplex; lwork: var integer;
    rwork: ptr doublereal; info: var integer): cint {.importc: "zheev_".}
  
  proc zheevd*(jobz: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; w: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zheevd_".}
  
  proc zheevr*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer; isuppz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zheevr_".}
  
  proc zheevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "zheevx_".}
  
  proc zhegs2*(itype: var integer; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zhegs2_".}
  
  proc zhegst*(itype: var integer; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zhegst_".}
  
  proc zhegv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer; w: ptr doublereal; work: ptr doublecomplex;
    lwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zhegv_".}
  
  proc zhegvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer; w: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zhegvd_".}
  
  proc zhegvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     vl: ptr doublereal; vu: ptr doublereal; il: var integer;
     iu: var integer; abstol: ptr doublereal; m: var integer;
     w: ptr doublereal; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "zhegvx_".}
  
  proc zherfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zherfs_".}
  
  proc zherfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
      s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
      x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zherfsx_".}
  
  proc zhesv*(uplo: var cstring; n: var integer; nrhs: var integer;
    a: ptr doublecomplex; lda: var integer; ipiv: var cint;
    b: ptr doublecomplex; ldb: var integer; work: ptr doublecomplex;
    lwork: var integer; info: var integer): cint {.importc: "zhesv_".}
  
  proc zhesvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     lwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zhesvx_".}
  
  proc zhesvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
      equed: var cstring; s: ptr doublereal; b: ptr doublecomplex;
      ldb: var integer; x: ptr doublecomplex; ldx: var integer;
      rcond: ptr doublereal; rpvgrw: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zhesvxx_".}
  
  proc zhetd2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tau: ptr doublecomplex; info: var integer): cint {.importc: "zhetd2_".}
  
  proc zhetf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zhetf2_".}
  
  proc zhetrd*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; d: ptr doublereal; e: ptr doublereal;
     tau: ptr doublecomplex; work: ptr doublecomplex;
     lwork: var integer; info: var integer): cint {.importc: "zhetrd_".}
  
  proc zhetrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; work: ptr doublecomplex;
     lwork: var integer; info: var integer): cint {.importc: "zhetrf_".}
  
  proc zhetri*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; work: ptr doublecomplex;
     info: var integer): cint {.importc: "zhetri_".}
  
  proc zhetrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; ipiv: var cint;
     b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zhetrs_".}
  
  proc zhfrk*(transr: var cstring; uplo: var cstring; trans: var cstring; n: var integer;
    k: var integer; alpha: ptr doublereal; a: ptr doublecomplex;
    lda: var integer; beta: ptr doublereal; c: ptr doublecomplex): cint {.importc: "zhfrk_".}
  
  proc zhgeqz*(job: var cstring; compq: var cstring; compz: var cstring; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublecomplex;
     ldh: var integer; t: ptr doublecomplex; ldt: var integer;
     alpha: ptr doublecomplex; beta: ptr doublecomplex;
     q: ptr doublecomplex; ldq: var integer; z: ptr doublecomplex;
     ldz: var integer; work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zhgeqz_".}
  
  proc zhpcon*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zhpcon_".}
  
  proc zhpev*(jobz: var cstring; uplo: var cstring; n: var integer;
    ap: ptr doublecomplex; w: ptr doublereal; z: ptr doublecomplex;
    ldz: var integer; work: ptr doublecomplex; rwork: ptr doublereal;
    info: var integer): cint {.importc: "zhpev_".}
  
  proc zhpevd*(jobz: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublecomplex; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zhpevd_".}
  
  proc zhpevx*(jobz: var cstring; range: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublecomplex; vl: ptr doublereal; vu: ptr doublereal;
     il: var integer; iu: var integer; abstol: ptr doublereal;
     m: var integer; w: ptr doublereal; z: ptr doublecomplex;
     ldz: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "zhpevx_".}
  
  proc zhpgst*(itype: var integer; uplo: var cstring; n: var integer;
     ap: ptr doublecomplex; bp: ptr doublecomplex; info: var integer): cint {.importc: "zhpgst_".}
  
  proc zhpgv*(itype: var integer; jobz: var cstring; uplo: var cstring; n: var integer;
    ap: ptr doublecomplex; bp: ptr doublecomplex; w: ptr doublereal;
    z: ptr doublecomplex; ldz: var integer;
    work: ptr doublecomplex; rwork: ptr doublereal; info: var integer): cint {.importc: "zhpgv_".}
  
  proc zhpgvd*(itype: var integer; jobz: var cstring; uplo: var cstring;
     n: var integer; ap: ptr doublecomplex; bp: ptr doublecomplex;
     w: ptr doublereal; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zhpgvd_".}
  
  proc zhpgvx*(itype: var integer; jobz: var cstring; range: var cstring;
     uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     bp: ptr doublecomplex; vl: ptr doublereal; vu: ptr doublereal;
     il: var integer; iu: var integer; abstol: ptr doublereal;
     m: var integer; w: ptr doublereal; z: ptr doublecomplex;
     ldz: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "zhpgvx_".}
  
  proc zhprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; afp: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zhprfs_".}
  
  proc zhpsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;
    ldb: var integer; info: var integer): cint {.importc: "zhpsv_".}
  
  proc zhpsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; afp: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zhpsvx_".}
  
  proc zhptrd*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     d: ptr doublereal; e: ptr doublereal; tau: ptr doublecomplex;
     info: var integer): cint {.importc: "zhptrd_".}
  
  proc zhptrf*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     ipiv: var cint; info: var integer): cint {.importc: "zhptrf_".}
  
  proc zhptri*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     ipiv: var cint; work: ptr doublecomplex; info: var integer): cint {.importc: "zhptri_".}
  
  proc zhptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zhptrs_".}
  
  proc zhsein*(side: var cstring; eigsrc: var cstring; initv: var cstring;
     select: ptr logical; n: var integer; h: ptr doublecomplex;
     ldh: var integer; w: ptr doublecomplex; vl: ptr doublecomplex;
     ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; ifaill: var integer; ifailr: var integer;
     info: var integer): cint {.importc: "zhsein_".}
  
  proc zhseqr*(job: var cstring; compz: var cstring; n: var integer; ilo: var integer;
     ihi: var integer; h: ptr doublecomplex; ldh: var integer;
     w: ptr doublecomplex; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zhseqr_".}
  
  proc zla_gbamv*(trans: var integer; m: var integer; n: var integer;
         kl: var integer; ku: var integer; alpha: ptr doublereal;
         ab: ptr doublecomplex; ldab: var integer;
         x: ptr doublecomplex; incx: var integer;
         beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_gbamv__".}
  proc zla_gbrcond_c*(trans: var cstring; n: var integer; kl: var integer;
             ku: var integer; ab: ptr doublecomplex;
             ldab: var integer; afb: ptr doublecomplex;
             ldafb: var integer; ipiv: var cint;
             c: ptr doublereal; capply: ptr logical;
             info: var integer; work: ptr doublecomplex;
             rwork: ptr doublereal; trans_len: ftnlen): doublereal {.importc: "zla_gbrcond_c__".}
  proc zla_gbrcond_x*(trans: var cstring; n: var integer; kl: var integer;
             ku: var integer; ab: ptr doublecomplex;
             ldab: var integer; afb: ptr doublecomplex;
             ldafb: var integer; ipiv: var cint;
             x: ptr doublecomplex; info: var integer;
             work: ptr doublecomplex; rwork: ptr doublereal;
             trans_len: ftnlen): doublereal {.importc: "zla_gbrcond_x__".}
  
  proc zla_gbrfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    kl: var integer; ku: var integer;
    
    nrhs: var integer; ab: ptr doublecomplex;
    
    ldab: var integer; afb: ptr doublecomplex;
    
    ldafb: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr doublereal;
    
    b: ptr doublecomplex; ldb: var integer;
    
    y: ptr doublecomplex; ldy: var integer;
    
    berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublecomplex;
    
    ayb: ptr doublereal; dy: ptr doublecomplex;
    
    y_tail: ptr doublecomplex;
    
    rcond: ptr doublereal; ithresh: var integer;
    
    rthresh: ptr doublereal; dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer): cint {.importc: "zla_gbrfsx_extended__".}
  proc zla_gbrpvgrw*(n: var integer; kl: var integer; ku: var integer;
            ncols: var integer; ab: ptr doublecomplex;
            ldab: var integer; afb: ptr doublecomplex;
            ldafb: var integer): doublereal {.importc: "zla_gbrpvgrw__".}
  
  proc zla_geamv*(trans: var integer; m: var integer; n: var integer;
         alpha: ptr doublereal; a: ptr doublecomplex;
         lda: var integer; x: ptr doublecomplex; incx: var integer;
         beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_geamv__".}
  proc zla_gercond_c*(trans: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; ipiv: var cint;
             c: ptr doublereal; capply: ptr logical;
             info: var integer; work: ptr doublecomplex;
             rwork: ptr doublereal; trans_len: ftnlen): doublereal {.importc: "zla_gercond_c__".}
  proc zla_gercond_x*(trans: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; ipiv: var cint;
             x: ptr doublecomplex; info: var integer;
             work: ptr doublecomplex; rwork: ptr doublereal;
             trans_len: ftnlen): doublereal {.importc: "zla_gercond_x__".}
  
  proc zla_gerfsx_extended*(prec_type: var integer;
    
    trans_type: var integer; n: var integer;
    
    nrhs: var integer; a: ptr doublecomplex;
    
    lda: var integer; af: ptr doublecomplex;
    
    ldaf: var integer; ipiv: var cint;
    
    colequ: ptr logical; c: ptr doublereal;
    
    b: ptr doublecomplex; ldb: var integer;
    
    y: ptr doublecomplex; ldy: var integer;
    
    berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublecomplex;
    
    ayb: ptr doublereal; dy: ptr doublecomplex;
    
    y_tail: ptr doublecomplex;
    
    rcond: ptr doublereal; ithresh: var integer;
    
    rthresh: ptr doublereal; dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer): cint {.importc: "zla_gerfsx_extended__".}
  
  proc zla_heamv*(uplo: var integer; n: var integer; alpha: ptr doublereal;
         a: ptr doublecomplex; lda: var integer;
         x: ptr doublecomplex; incx: var integer;
         beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_heamv__".}
  proc zla_hercond_c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; ipiv: var cint;
             c: ptr doublereal; capply: ptr logical;
             info: var integer; work: ptr doublecomplex;
             rwork: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_hercond_c__".}
  proc zla_hercond_x*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; ipiv: var cint;
             x: ptr doublecomplex; info: var integer;
             work: ptr doublecomplex; rwork: ptr doublereal;
             uplo_len: ftnlen): doublereal {.importc: "zla_hercond_x__".}
  
  proc zla_herfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer;
    
    a: ptr doublecomplex; lda: var integer;
    
    af: ptr doublecomplex; ldaf: var integer;
    
    ipiv: var cint; colequ: ptr logical;
    
    c: ptr doublereal; b: ptr doublecomplex;
    
    ldb: var integer; y: ptr doublecomplex;
    
    ldy: var integer; berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublecomplex;
    
    ayb: ptr doublereal; dy: ptr doublecomplex;
    
    y_tail: ptr doublecomplex;
    
    rcond: ptr doublereal; ithresh: var integer;
    
    rthresh: ptr doublereal; dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer;
    
    uplo_len: ftnlen): cint {.importc: "zla_herfsx_extended__".}
  proc zla_herpvgrw*(uplo: var cstring; n: var integer; info: var integer;
            a: ptr doublecomplex; lda: var integer;
            af: ptr doublecomplex; ldaf: var integer;
            ipiv: var cint; work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_herpvgrw__".}
  
  proc zla_lin_berr*(n: var integer; nz: var integer; nrhs: var integer;
            res: ptr doublecomplex; ayb: ptr doublereal;
            berr: ptr doublereal): cint {.importc: "zla_lin_berr__".}
  proc zla_porcond_c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; c: ptr doublereal;
             capply: ptr logical; info: var integer;
             work: ptr doublecomplex; rwork: ptr doublereal;
             uplo_len: ftnlen): doublereal {.importc: "zla_porcond_c__".}
  proc zla_porcond_x*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; x: ptr doublecomplex;
             info: var integer; work: ptr doublecomplex;
             rwork: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_porcond_x__".}
  
  proc zla_porfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer;
    
    a: ptr doublecomplex; lda: var integer;
    
    af: ptr doublecomplex; ldaf: var integer;
    
    colequ: ptr logical; c: ptr doublereal;
    
    b: ptr doublecomplex; ldb: var integer;
    
    y: ptr doublecomplex; ldy: var integer;
    
    berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublecomplex;
    
    ayb: ptr doublereal; dy: ptr doublecomplex;
    
    y_tail: ptr doublecomplex;
    
    rcond: ptr doublereal; ithresh: var integer;
    
    rthresh: ptr doublereal; dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer;
    
    uplo_len: ftnlen): cint {.importc: "zla_porfsx_extended__".}
  proc zla_porpvgrw*(uplo: var cstring; ncols: var integer; a: ptr doublecomplex;
            lda: var integer; af: ptr doublecomplex;
            ldaf: var integer; work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_porpvgrw__".}
  proc zla_rpvgrw*(n: var integer; ncols: var integer; a: ptr doublecomplex;
          lda: var integer; af: ptr doublecomplex; ldaf: var integer): doublereal {.importc: "zla_rpvgrw__".}
  
  proc zla_syamv*(uplo: var integer; n: var integer; alpha: ptr doublereal;
         a: ptr doublecomplex; lda: var integer;
         x: ptr doublecomplex; incx: var integer;
         beta: ptr doublereal; y: ptr doublereal; incy: var integer): cint {.importc: "zla_syamv__".}
  proc zla_syrcond_c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; ipiv: var cint;
             c: ptr doublereal; capply: ptr logical;
             info: var integer; work: ptr doublecomplex;
             rwork: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_syrcond_c__".}
  proc zla_syrcond_x*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
             lda: var integer; af: ptr doublecomplex;
             ldaf: var integer; ipiv: var cint;
             x: ptr doublecomplex; info: var integer;
             work: ptr doublecomplex; rwork: ptr doublereal;
             uplo_len: ftnlen): doublereal {.importc: "zla_syrcond_x__".}
  
  proc zla_syrfsx_extended*(prec_type: var integer; uplo: var cstring;
    
    n: var integer; nrhs: var integer;
    
    a: ptr doublecomplex; lda: var integer;
    
    af: ptr doublecomplex; ldaf: var integer;
    
    ipiv: var cint; colequ: ptr logical;
    
    c: ptr doublereal; b: ptr doublecomplex;
    
    ldb: var integer; y: ptr doublecomplex;
    
    ldy: var integer; berr_out: ptr doublereal;
    
    n_norms: var integer; errs_n: ptr doublereal;
    
    errs_c: ptr doublereal; res: ptr doublecomplex;
    
    ayb: ptr doublereal; dy: ptr doublecomplex;
    
    y_tail: ptr doublecomplex;
    
    rcond: ptr doublereal; ithresh: var integer;
    
    rthresh: ptr doublereal; dz_ub: ptr doublereal;
    
    ignore_cwise: ptr logical; info: var integer;
    
    uplo_len: ftnlen): cint {.importc: "zla_syrfsx_extended__".}
  proc zla_syrpvgrw*(uplo: var cstring; n: var integer; info: var integer;
            a: ptr doublecomplex; lda: var integer;
            af: ptr doublecomplex; ldaf: var integer;
            ipiv: var cint; work: ptr doublereal; uplo_len: ftnlen): doublereal {.importc: "zla_syrpvgrw__".}
  
  proc zla_wwaddw*(n: var integer; x: ptr doublecomplex; y: ptr doublecomplex;
          w: ptr doublecomplex): cint {.importc: "zla_wwaddw__".}
  
  proc zlabrd*(m: var integer; n: var integer; nb: var integer;
     a: ptr doublecomplex; lda: var integer; d: ptr doublereal;
     e: ptr doublereal; tauq: ptr doublecomplex;
     taup: ptr doublecomplex; x: ptr doublecomplex; ldx: var integer;
     y: ptr doublecomplex; ldy: var integer): cint {.importc: "zlabrd_".}
  
  proc zlacgv*(n: var integer; x: ptr doublecomplex; incx: var integer): cint {.importc: "zlacgv_".}
  
  proc zlacn2*(n: var integer; v: ptr doublecomplex; x: ptr doublecomplex;
     est: ptr doublereal; kase: var integer; isave: var integer): cint {.importc: "zlacn2_".}
  
  proc zlacon*(n: var integer; v: ptr doublecomplex; x: ptr doublecomplex;
     est: ptr doublereal; kase: var integer): cint {.importc: "zlacon_".}
  
  proc zlacp2*(uplo: var cstring; m: var integer; n: var integer;
     a: ptr doublereal; lda: var integer; b: ptr doublecomplex;
     ldb: var integer): cint {.importc: "zlacp2_".}
  
  proc zlacpy*(uplo: var cstring; m: var integer; n: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer): cint {.importc: "zlacpy_".}
  
  proc zlacrm*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublereal; ldb: var integer;
     c: ptr doublecomplex; ldc: var integer; rwork: ptr doublereal): cint {.importc: "zlacrm_".}
  
  proc zlacrt*(n: var integer; cx: ptr doublecomplex; incx: var integer;
     cy: ptr doublecomplex; incy: var integer;
     c: ptr doublecomplex; s: ptr doublecomplex): cint {.importc: "zlacrt_".}
  # Double Complex 
  proc zladiv*(ret_val: ptr doublecomplex; x: ptr doublecomplex;
     y: ptr doublecomplex): VOID {.importc: "zladiv_".}
  
  proc zlaed0*(qsiz: var integer; n: var integer; d: ptr doublereal;
     e: ptr doublereal; q: ptr doublecomplex; ldq: var integer;
     qstore: ptr doublecomplex; ldqs: var integer;
     rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zlaed0_".}
  
  proc zlaed7*(n: var integer; cutpnt: var integer; qsiz: var integer;
     tlvls: var integer; curlvl: var integer; curpbm: var integer;
     d: ptr doublereal; q: ptr doublecomplex; ldq: var integer;
     rho: ptr doublereal; indxq: var integer; qstore: ptr doublereal;
     qptr: var integer; prmptr: var integer; perm: var integer;
     givptr: var integer; givcol: var integer;
     givnum: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zlaed7_".}
  
  proc zlaed8*(k: var integer; n: var integer; qsiz: var integer;
     q: ptr doublecomplex; ldq: var integer; d: ptr doublereal;
     rho: ptr doublereal; cutpnt: var integer; z: ptr doublereal;
     dlamda: ptr doublereal; q2: ptr doublecomplex;
     ldq2: var integer; w: ptr doublereal; indxp: var integer;
     indx: var integer; indxq: var integer; perm: var integer;
     givptr: var integer; givcol: var integer;
     givnum: ptr doublereal; info: var integer): cint {.importc: "zlaed8_".}
  
  proc zlaein*(rightv: ptr logical; noinit: ptr logical; n: var integer;
     h: ptr doublecomplex; ldh: var integer; w: ptr doublecomplex;
     v: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;
     rwork: ptr doublereal; eps3: ptr doublereal;
     smlnum: ptr doublereal; info: var integer): cint {.importc: "zlaein_".}
  
  proc zlaesy*(a: ptr doublecomplex; b: ptr doublecomplex;
     c: ptr doublecomplex; rt1: ptr doublecomplex;
     rt2: ptr doublecomplex; evscal: ptr doublecomplex;
     cs1: ptr doublecomplex; sn1: ptr doublecomplex): cint {.importc: "zlaesy_".}
  
  proc zlaev2*(a: ptr doublecomplex; b: ptr doublecomplex;
     c: ptr doublecomplex; rt1: ptr doublereal;
     rt2: ptr doublereal; cs1: ptr doublereal; sn1: ptr doublecomplex): cint {.importc: "zlaev2_".}
  
  proc zlag2c*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; sa: ptr complex; ldsa: var integer;
     info: var integer): cint {.importc: "zlag2c_".}
  
  proc zlags2*(upper: ptr logical; a1: ptr doublereal; a2: ptr doublecomplex;
     a3: ptr doublereal; b1: ptr doublereal; b2: ptr doublecomplex;
     b3: ptr doublereal; csu: ptr doublereal; snu: ptr doublecomplex;
     csv: ptr doublereal; snv: ptr doublecomplex;
     csq: ptr doublereal; snq: ptr doublecomplex): cint {.importc: "zlags2_".}
  
  proc zlagtm*(trans: var cstring; n: var integer; nrhs: var integer;
     alpha: ptr doublereal; dl: ptr doublecomplex;
     d: ptr doublecomplex; du: ptr doublecomplex;
     x: ptr doublecomplex; ldx: var integer; beta: ptr doublereal;
     b: ptr doublecomplex; ldb: var integer): cint {.importc: "zlagtm_".}
  
  proc zlahef*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;
     a: ptr doublecomplex; lda: var integer; ipiv: var cint;
     w: ptr doublecomplex; ldw: var integer; info: var integer): cint {.importc: "zlahef_".}
  
  proc zlahqr*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublecomplex;
     ldh: var integer; w: ptr doublecomplex; iloz: var integer;
     ihiz: var integer; z: ptr doublecomplex; ldz: var integer;
     info: var integer): cint {.importc: "zlahqr_".}
  
  proc zlahr2*(n: var integer; k: var integer; nb: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     t: ptr doublecomplex; ldt: var integer; y: ptr doublecomplex;
     ldy: var integer): cint {.importc: "zlahr2_".}
  
  proc zlahrd*(n: var integer; k: var integer; nb: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     t: ptr doublecomplex; ldt: var integer; y: ptr doublecomplex;
     ldy: var integer): cint {.importc: "zlahrd_".}
  
  proc zlaic1*(job: var integer; j: var integer; x: ptr doublecomplex;
     sest: ptr doublereal; w: ptr doublecomplex;
     gamma: ptr doublecomplex; sestpr: ptr doublereal;
     s: ptr doublecomplex; c: ptr doublecomplex): cint {.importc: "zlaic1_".}
  
  proc zlals0*(icompq: var integer; nl: var integer; nr: var integer;
     sqre: var integer; nrhs: var integer; b: ptr doublecomplex;
     ldb: var integer; bx: ptr doublecomplex; ldbx: var integer;
     perm: var integer; givptr: var integer; givcol: var integer;
     ldgcol: var integer; givnum: ptr doublereal;
     ldgnum: var integer; poles: ptr doublereal;
     difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;
     k: var integer; c: ptr doublereal; s: ptr doublereal;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zlals0_".}
  
  proc zlalsa*(icompq: var integer; smlsiz: var integer; n: var integer;
     nrhs: var integer; b: ptr doublecomplex; ldb: var integer;
     bx: ptr doublecomplex; ldbx: var integer; u: ptr doublereal;
     ldu: var integer; vt: ptr doublereal; k: var integer;
     difl: ptr doublereal; difr: ptr doublereal; z: ptr doublereal;
     poles: ptr doublereal; givptr: var integer; givcol: var integer;
     ldgcol: var integer; perm: var integer; givnum: ptr doublereal;
     c: ptr doublereal; s: ptr doublereal; rwork: ptr doublereal;
     iwork: var integer; info: var integer): cint {.importc: "zlalsa_".}
  
  proc zlalsd*(uplo: var cstring; smlsiz: var integer; n: var integer;
     nrhs: var integer; d: ptr doublereal; e: ptr doublereal;
     b: ptr doublecomplex; ldb: var integer; rcond: ptr doublereal;
     rank: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; iwork: var integer; info: var integer): cint {.importc: "zlalsd_".}
  proc zlangb*(norm: var cstring; n: var integer; kl: var integer; ku: var integer;
     ab: ptr doublecomplex; ldab: var integer; work: ptr doublereal): doublereal {.importc: "zlangb_".}
  proc zlange*(norm: var cstring; m: var integer; n: var integer;
     a: ptr doublecomplex; lda: var integer; work: ptr doublereal): doublereal {.importc: "zlange_".}
  proc zlangt*(norm: var cstring; n: var integer; dl: ptr doublecomplex;
     d: ptr doublecomplex; du: ptr doublecomplex): doublereal {.importc: "zlangt_".}
  proc zlanhb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;
     ab: ptr doublecomplex; ldab: var integer; work: ptr doublereal): doublereal {.importc: "zlanhb_".}
  proc zlanhe*(norm: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; work: ptr doublereal): doublereal {.importc: "zlanhe_".}
  proc zlanhf*(norm: var cstring; transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlanhf_".}
  proc zlanhp*(norm: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlanhp_".}
  proc zlanhs*(norm: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; work: ptr doublereal): doublereal {.importc: "zlanhs_".}
  proc zlanht*(norm: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublecomplex): doublereal {.importc: "zlanht_".}
  proc zlansb*(norm: var cstring; uplo: var cstring; n: var integer; k: var integer;
     ab: ptr doublecomplex; ldab: var integer; work: ptr doublereal): doublereal {.importc: "zlansb_".}
  proc zlansp*(norm: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlansp_".}
  proc zlansy*(norm: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; work: ptr doublereal): doublereal {.importc: "zlansy_".}
  proc zlantb*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     k: var integer; ab: ptr doublecomplex; ldab: var integer;
     work: ptr doublereal): doublereal {.importc: "zlantb_".}
  proc zlantp*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr doublecomplex; work: ptr doublereal): doublereal {.importc: "zlantp_".}
  proc zlantr*(norm: var cstring; uplo: var cstring; diag: var cstring; m: var integer;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     work: ptr doublereal): doublereal {.importc: "zlantr_".}
  
  proc zlapll*(n: var integer; x: ptr doublecomplex; incx: var integer;
     y: ptr doublecomplex; incy: var integer; ssmin: ptr doublereal): cint {.importc: "zlapll_".}
  
  proc zlapmt*(forwrd: ptr logical; m: var integer; n: var integer;
     x: ptr doublecomplex; ldx: var integer; k: var integer): cint {.importc: "zlapmt_".}
  
  proc zlaqgb*(m: var integer; n: var integer; kl: var integer;
     ku: var integer; ab: ptr doublecomplex; ldab: var integer;
     r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqgb_".}
  
  proc zlaqge*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; r: ptr doublereal; c: ptr doublereal;
     rowcnd: ptr doublereal; colcnd: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqge_".}
  
  proc zlaqhb*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; s: ptr doublereal;
     scond: ptr doublereal; amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqhb_".}
  
  proc zlaqhe*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; s: ptr doublereal; scond: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqhe_".}
  
  proc zlaqhp*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     equed: var cstring): cint {.importc: "zlaqhp_".}
  
  proc zlaqp2*(m: var integer; n: var integer; offset: var integer;
     a: ptr doublecomplex; lda: var integer; jpvt: var integer;
     tau: ptr doublecomplex; vn1: ptr doublereal;
     vn2: ptr doublereal; work: ptr doublecomplex): cint {.importc: "zlaqp2_".}
  
  proc zlaqps*(m: var integer; n: var integer; offset: var integer;
     nb: var integer; kb: var integer; a: ptr doublecomplex;
     lda: var integer; jpvt: var integer; tau: ptr doublecomplex;
     vn1: ptr doublereal; vn2: ptr doublereal;
     auxv: ptr doublecomplex; f: ptr doublecomplex; ldf: var integer): cint {.importc: "zlaqps_".}
  
  proc zlaqr0*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublecomplex;
     ldh: var integer; w: ptr doublecomplex; iloz: var integer;
     ihiz: var integer; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zlaqr0_".}
  
  proc zlaqr1*(n: var integer; h: ptr doublecomplex; ldh: var integer;
     s1: ptr doublecomplex; s2: ptr doublecomplex;
     v: ptr doublecomplex): cint {.importc: "zlaqr1_".}
  
  proc zlaqr2*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr doublecomplex; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr doublecomplex; ldz: var integer;
     ns: var integer; nd: var integer; sh: ptr doublecomplex;
     v: ptr doublecomplex; ldv: var integer; nh: var integer;
     t: ptr doublecomplex; ldt: var integer; nv: var integer;
     wv: ptr doublecomplex; ldwv: var integer;
     work: ptr doublecomplex; lwork: var integer): cint {.importc: "zlaqr2_".}
  
  proc zlaqr3*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ktop: var integer; kbot: var integer; nw: var integer;
     h: ptr doublecomplex; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr doublecomplex; ldz: var integer;
     ns: var integer; nd: var integer; sh: ptr doublecomplex;
     v: ptr doublecomplex; ldv: var integer; nh: var integer;
     t: ptr doublecomplex; ldt: var integer; nv: var integer;
     wv: ptr doublecomplex; ldwv: var integer;
     work: ptr doublecomplex; lwork: var integer): cint {.importc: "zlaqr3_".}
  
  proc zlaqr4*(wantt: ptr logical; wantz: ptr logical; n: var integer;
     ilo: var integer; ihi: var integer; h: ptr doublecomplex;
     ldh: var integer; w: ptr doublecomplex; iloz: var integer;
     ihiz: var integer; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zlaqr4_".}
  
  proc zlaqr5*(wantt: ptr logical; wantz: ptr logical; kacc22: var integer;
     n: var integer; ktop: var integer; kbot: var integer;
     nshfts: var integer; s: ptr doublecomplex;
     h: ptr doublecomplex; ldh: var integer; iloz: var integer;
     ihiz: var integer; z: ptr doublecomplex; ldz: var integer;
     v: ptr doublecomplex; ldv: var integer; u: ptr doublecomplex;
     ldu: var integer; nv: var integer; wv: ptr doublecomplex;
     ldwv: var integer; nh: var integer; wh: ptr doublecomplex;
     ldwh: var integer): cint {.importc: "zlaqr5_".}
  
  proc zlaqsb*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; s: ptr doublereal;
     scond: ptr doublereal; amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqsb_".}
  
  proc zlaqsp*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     equed: var cstring): cint {.importc: "zlaqsp_".}
  
  proc zlaqsy*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; s: ptr doublereal; scond: ptr doublereal;
     amax: ptr doublereal; equed: var cstring): cint {.importc: "zlaqsy_".}
  
  proc zlar1v*(n: var integer; b1: var integer; bn: var integer;
     lambdas: ptr doublereal; d: ptr doublereal; l: ptr doublereal;
     ld: ptr doublereal; lld: ptr doublereal; pivmin: ptr doublereal;
     gaptol: ptr doublereal; z: ptr doublecomplex;
     wantnc: ptr logical; negcnt: var integer; ztz: ptr doublereal;
     mingma: ptr doublereal; r: var integer; isuppz: var integer;
     nrminv: ptr doublereal; resid: ptr doublereal;
     rqcorr: ptr doublereal; work: ptr doublereal): cint {.importc: "zlar1v_".}
  
  proc zlar2v*(n: var integer; x: ptr doublecomplex; y: ptr doublecomplex;
     z: ptr doublecomplex; incx: var integer; c: ptr doublereal;
     s: ptr doublecomplex; incc: var integer): cint {.importc: "zlar2v_".}
  
  proc zlarcm*(m: var integer; n: var integer; a: ptr doublereal;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     c: ptr doublecomplex; ldc: var integer; rwork: ptr doublereal): cint {.importc: "zlarcm_".}
  
  proc zlarf*(side: var cstring; m: var integer; n: var integer;
    v: ptr doublecomplex; incv: var integer; tau: ptr doublecomplex;
    c: ptr doublecomplex; ldc: var integer; work: ptr doublecomplex): cint {.importc: "zlarf_".}
  
  proc zlarfb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer;
     v: ptr doublecomplex; ldv: var integer; t: ptr doublecomplex;
     ldt: var integer; c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; ldwork: var integer): cint {.importc: "zlarfb_".}
  
  proc zlarfg*(n: var integer; alpha: ptr doublecomplex; x: ptr doublecomplex;
     incx: var integer; tau: ptr doublecomplex): cint {.importc: "zlarfg_".}
  
  proc zlarfp*(n: var integer; alpha: ptr doublecomplex; x: ptr doublecomplex;
     incx: var integer; tau: ptr doublecomplex): cint {.importc: "zlarfp_".}
  
  proc zlarft*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr doublecomplex; ldv: var integer;
     tau: ptr doublecomplex; t: ptr doublecomplex; ldt: var integer): cint {.importc: "zlarft_".}
  
  proc zlarfx*(side: var cstring; m: var integer; n: var integer;
     v: ptr doublecomplex; tau: ptr doublecomplex;
     c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex): cint {.importc: "zlarfx_".}
  
  proc zlargv*(n: var integer; x: ptr doublecomplex; incx: var integer;
     y: ptr doublecomplex; incy: var integer; c: ptr doublereal;
     incc: var integer): cint {.importc: "zlargv_".}
  
  proc zlarnv*(idist: var integer; iseed: var integer; n: var integer;
     x: ptr doublecomplex): cint {.importc: "zlarnv_".}
  
  proc zlarrv*(n: var integer; vl: ptr doublereal; vu: ptr doublereal;
     d: ptr doublereal; l: ptr doublereal; pivmin: ptr doublereal;
     isplit: var integer; m: var integer; dol: var integer;
     dou: var integer; minrgp: ptr doublereal; rtol1: ptr doublereal;
     rtol2: ptr doublereal; w: ptr doublereal; werr: ptr doublereal;
     wgap: ptr doublereal; iblock: var integer; indexw: var integer;
     gers: ptr doublereal; z: ptr doublecomplex; ldz: var integer;
     isuppz: var integer; work: ptr doublereal; iwork: var integer;
     info: var integer): cint {.importc: "zlarrv_".}
  
  proc zlarscl2*(m: var integer; n: var integer; d: ptr doublereal;
       x: ptr doublecomplex; ldx: var integer): cint {.importc: "zlarscl2_".}
  
  proc zlartg*(f: ptr doublecomplex; g: ptr doublecomplex; cs: ptr doublereal;
     sn: ptr doublecomplex; r: ptr doublecomplex): cint {.importc: "zlartg_".}
  
  proc zlartv*(n: var integer; x: ptr doublecomplex; incx: var integer;
     y: ptr doublecomplex; incy: var integer; c: ptr doublereal;
     s: ptr doublecomplex; incc: var integer): cint {.importc: "zlartv_".}
  
  proc zlarz*(side: var cstring; m: var integer; n: var integer; l: var integer;
    v: ptr doublecomplex; incv: var integer; tau: ptr doublecomplex;
    c: ptr doublecomplex; ldc: var integer; work: ptr doublecomplex): cint {.importc: "zlarz_".}
  
  proc zlarzb*(side: var cstring; trans: var cstring; direct: var cstring; storev: var cstring;
     m: var integer; n: var integer; k: var integer; l: var integer;
     v: ptr doublecomplex; ldv: var integer; t: ptr doublecomplex;
     ldt: var integer; c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; ldwork: var integer): cint {.importc: "zlarzb_".}
  
  proc zlarzt*(direct: var cstring; storev: var cstring; n: var integer;
     k: var integer; v: ptr doublecomplex; ldv: var integer;
     tau: ptr doublecomplex; t: ptr doublecomplex; ldt: var integer): cint {.importc: "zlarzt_".}
  
  proc zlascl*(mtype: var cstring; kl: var integer; ku: var integer;
     cfrom: ptr doublereal; cto: ptr doublereal; m: var integer;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     info: var integer): cint {.importc: "zlascl_".}
  
  proc zlascl2*(m: var integer; n: var integer; d: ptr doublereal;
      x: ptr doublecomplex; ldx: var integer): cint {.importc: "zlascl2_".}
  
  proc zlaset*(uplo: var cstring; m: var integer; n: var integer;
     alpha: ptr doublecomplex; beta: ptr doublecomplex;
     a: ptr doublecomplex; lda: var integer): cint {.importc: "zlaset_".}
  
  proc zlasr*(side: var cstring; pivot: var cstring; direct: var cstring; m: var integer;
    n: var integer; c: ptr doublereal; s: ptr doublereal;
    a: ptr doublecomplex; lda: var integer): cint {.importc: "zlasr_".}
  
  proc zlassq*(n: var integer; x: ptr doublecomplex; incx: var integer;
     scale: ptr doublereal; sumsq: ptr doublereal): cint {.importc: "zlassq_".}
  
  proc zlaswp*(n: var integer; a: ptr doublecomplex; lda: var integer;
     k1: var integer; k2: var integer; ipiv: var cint;
     incx: var integer): cint {.importc: "zlaswp_".}
  
  proc zlasyf*(uplo: var cstring; n: var integer; nb: var integer; kb: var integer;
     a: ptr doublecomplex; lda: var integer; ipiv: var cint;
     w: ptr doublecomplex; ldw: var integer; info: var integer): cint {.importc: "zlasyf_".}
  
  proc zlat2c*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; sa: ptr complex; ldsa: var integer;
     info: var integer): cint {.importc: "zlat2c_".}
  
  proc zlatbs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; kd: var integer; ab: ptr doublecomplex;
     ldab: var integer; x: ptr doublecomplex; scale: ptr doublereal;
     cnorm: ptr doublereal; info: var integer): cint {.importc: "zlatbs_".}
  
  proc zlatdf*(ijob: var integer; n: var integer; z: ptr doublecomplex;
     ldz: var integer; rhs: ptr doublecomplex; rdsum: ptr doublereal;
     rdscal: ptr doublereal; ipiv: var cint; jpiv: var cint): cint {.importc: "zlatdf_".}
  
  proc zlatps*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; ap: ptr doublecomplex; x: ptr doublecomplex;
     scale: ptr doublereal; cnorm: ptr doublereal; info: var integer): cint {.importc: "zlatps_".}
  
  proc zlatrd*(uplo: var cstring; n: var integer; nb: var integer;
     a: ptr doublecomplex; lda: var integer; e: ptr doublereal;
     tau: ptr doublecomplex; w: ptr doublecomplex; ldw: var integer): cint {.importc: "zlatrd_".}
  
  proc zlatrs*(uplo: var cstring; trans: var cstring; diag: var cstring; normin: var cstring;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     x: ptr doublecomplex; scale: ptr doublereal;
     cnorm: ptr doublereal; info: var integer): cint {.importc: "zlatrs_".}
  
  proc zlatrz*(m: var integer; n: var integer; l: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex): cint {.importc: "zlatrz_".}
  
  proc zlatzm*(side: var cstring; m: var integer; n: var integer;
     v: ptr doublecomplex; incv: var integer; tau: ptr doublecomplex;
     c1: ptr doublecomplex; c2: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex): cint {.importc: "zlatzm_".}
  
  proc zlauu2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; info: var integer): cint {.importc: "zlauu2_".}
  
  proc zlauum*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; info: var integer): cint {.importc: "zlauum_".}
  
  proc zpbcon*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; anorm: ptr doublereal;
     rcond: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zpbcon_".}
  
  proc zpbequ*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; s: ptr doublereal;
     scond: ptr doublereal; amax: ptr doublereal; info: var integer): cint {.importc: "zpbequ_".}
  
  proc zpbrfs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;
     afb: ptr doublecomplex; ldafb: var integer;
     b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
     ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zpbrfs_".}
  
  proc zpbstf*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; info: var integer): cint {.importc: "zpbstf_".}
  
  proc zpbsv*(uplo: var cstring; n: var integer; kd: var integer;
    nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;
    b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zpbsv_".}
  
  proc zpbsvx*(fact: var cstring; uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;
     afb: ptr doublecomplex; ldafb: var integer; equed: var cstring;
     s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zpbsvx_".}
  
  proc zpbtf2*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; info: var integer): cint {.importc: "zpbtf2_".}
  
  proc zpbtrf*(uplo: var cstring; n: var integer; kd: var integer;
     ab: ptr doublecomplex; ldab: var integer; info: var integer): cint {.importc: "zpbtrf_".}
  
  proc zpbtrs*(uplo: var cstring; n: var integer; kd: var integer;
     nrhs: var integer; ab: ptr doublecomplex; ldab: var integer;
     b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zpbtrs_".}
  
  proc zpftrf*(transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; info: var integer): cint {.importc: "zpftrf_".}
  
  proc zpftri*(transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; info: var integer): cint {.importc: "zpftri_".}
  
  proc zpftrs*(transr: var cstring; uplo: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublecomplex; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zpftrs_".}
  
  proc zpocon*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zpocon_".}
  
  proc zpoequ*(n: var integer; a: ptr doublecomplex; lda: var integer;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     info: var integer): cint {.importc: "zpoequ_".}
  
  proc zpoequb*(n: var integer; a: ptr doublecomplex; lda: var integer;
      s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
      info: var integer): cint {.importc: "zpoequb_".}
  
  proc zporfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zporfs_".}
  
  proc zporfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; s: ptr doublereal;
      b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
      ldx: var integer; rcond: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zporfsx_".}
  
  proc zposv*(uplo: var cstring; n: var integer; nrhs: var integer;
    a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
    ldb: var integer; info: var integer): cint {.importc: "zposv_".}
  
  proc zposvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; equed: var cstring; s: ptr doublereal;
     b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
     ldx: var integer; rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zposvx_".}
  
  proc zposvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; equed: var cstring;
      s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
      x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
      rpvgrw: ptr doublereal; berr: ptr doublereal;
      n_err_bnds: var integer; err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zposvxx_".}
  
  proc zpotf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; info: var integer): cint {.importc: "zpotf2_".}
  
  proc zpotrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; info: var integer): cint {.importc: "zpotrf_".}
  
  proc zpotri*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; info: var integer): cint {.importc: "zpotri_".}
  
  proc zpotrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zpotrs_".}
  
  proc zppcon*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zppcon_".}
  
  proc zppequ*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     s: ptr doublereal; scond: ptr doublereal; amax: ptr doublereal;
     info: var integer): cint {.importc: "zppequ_".}
  
  proc zpprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; afp: ptr doublecomplex;
     b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
     ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zpprfs_".}
  
  proc zppsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;
    info: var integer): cint {.importc: "zppsv_".}
  
  proc zppsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; afp: ptr doublecomplex; equed: var cstring;
     s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zppsvx_".}
  
  proc zpptrf*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     info: var integer): cint {.importc: "zpptrf_".}
  
  proc zpptri*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     info: var integer): cint {.importc: "zpptri_".}
  
  proc zpptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;
     info: var integer): cint {.importc: "zpptrs_".}
  
  proc zpstf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; piv: var integer; rank: var integer;
     tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "zpstf2_".}
  
  proc zpstrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; piv: var integer; rank: var integer;
     tol: ptr doublereal; work: ptr doublereal; info: var integer): cint {.importc: "zpstrf_".}
  
  proc zptcon*(n: var integer; d: ptr doublereal; e: ptr doublecomplex;
     anorm: ptr doublereal; rcond: ptr doublereal;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zptcon_".}
  
  proc zpteqr*(compz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "zpteqr_".}
  
  proc zptrfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     d: ptr doublereal; e: ptr doublecomplex; df: ptr doublereal;
     ef: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zptrfs_".}
  
  proc zptsv*(n: var integer; nrhs: var integer; d: ptr doublereal;
    e: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;
    info: var integer): cint {.importc: "zptsv_".}
  
  proc zptsvx*(fact: var cstring; n: var integer; nrhs: var integer;
     d: ptr doublereal; e: ptr doublecomplex; df: ptr doublereal;
     ef: ptr doublecomplex; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zptsvx_".}
  
  proc zpttrf*(n: var integer; d: ptr doublereal; e: ptr doublecomplex;
     info: var integer): cint {.importc: "zpttrf_".}
  
  proc zpttrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     d: ptr doublereal; e: ptr doublecomplex; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zpttrs_".}
  
  proc zptts2*(iuplo: var integer; n: var integer; nrhs: var integer;
     d: ptr doublereal; e: ptr doublecomplex; b: ptr doublecomplex;
     ldb: var integer): cint {.importc: "zptts2_".}
  
  proc zrot*(n: var integer; cx: ptr doublecomplex; incx: var integer;              cy: ptr doublecomplex; incy: var integer; c: ptr doublereal;              s: ptr doublecomplex): cint {.importc: "zrot_".}
  
  proc zspcon*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     ipiv: var cint; anorm: ptr doublereal; rcond: ptr doublereal;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zspcon_".}
  
  proc zspmv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;
    ap: ptr doublecomplex; x: ptr doublecomplex; incx: var integer;
    beta: ptr doublecomplex; y: ptr doublecomplex; incy: var integer): cint {.importc: "zspmv_".}
  
  proc zspr*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;              x: ptr doublecomplex; incx: var integer; ap: ptr doublecomplex): cint {.importc: "zspr_".}
  
  proc zsprfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; afp: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "zsprfs_".}
  
  proc zspsv*(uplo: var cstring; n: var integer; nrhs: var integer;
    ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;
    ldb: var integer; info: var integer): cint {.importc: "zspsv_".}
  
  proc zspsvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; afp: ptr doublecomplex;
     ipiv: var cint; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zspsvx_".}
  
  proc zsptrf*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     ipiv: var cint; info: var integer): cint {.importc: "zsptrf_".}
  
  proc zsptri*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     ipiv: var cint; work: ptr doublecomplex; info: var integer): cint {.importc: "zsptri_".}
  
  proc zsptrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     ap: ptr doublecomplex; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "zsptrs_".}
  
  proc zstedc*(compz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublecomplex; lwork: var integer;
     rwork: ptr doublereal; lrwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zstedc_".}
  
  proc zstegr*(jobz: var cstring; range: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     abstol: ptr doublereal; m: var integer; w: ptr doublereal;
     z: ptr doublecomplex; ldz: var integer; isuppz: var integer;
     work: ptr doublereal; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "zstegr_".}
  
  proc zstein*(n: var integer; d: ptr doublereal; e: ptr doublereal;
     m: var integer; w: ptr doublereal; iblock: var integer;
     isplit: var integer; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublereal; iwork: var integer; ifail: var integer;
     info: var integer): cint {.importc: "zstein_".}
  
  proc zstemr*(jobz: var cstring; range: var cstring; n: var integer;
     d: ptr doublereal; e: ptr doublereal; vl: ptr doublereal;
     vu: ptr doublereal; il: var integer; iu: var integer;
     m: var integer; w: ptr doublereal; z: ptr doublecomplex;
     ldz: var integer; nzc: var integer; isuppz: var integer;
     tryrac: ptr logical; work: ptr doublereal; lwork: var integer;
     iwork: var integer; liwork: var integer; info: var integer): cint {.importc: "zstemr_".}
  
  proc zsteqr*(compz: var cstring; n: var integer; d: ptr doublereal;
     e: ptr doublereal; z: ptr doublecomplex; ldz: var integer;
     work: ptr doublereal; info: var integer): cint {.importc: "zsteqr_".}
  
  proc zsycon*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; anorm: ptr doublereal;
     rcond: ptr doublereal; work: ptr doublecomplex;
     info: var integer): cint {.importc: "zsycon_".}
  
  proc zsyequb*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
      lda: var integer; s: ptr doublereal; scond: ptr doublereal;
      amax: ptr doublereal; work: ptr doublecomplex;
      info: var integer): cint {.importc: "zsyequb_".}
  
  proc zsymv*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;
    a: ptr doublecomplex; lda: var integer; x: ptr doublecomplex;
    incx: var integer; beta: ptr doublecomplex; y: ptr doublecomplex;
    incy: var integer): cint {.importc: "zsymv_".}
  
  proc zsyr*(uplo: var cstring; n: var integer; alpha: ptr doublecomplex;              x: ptr doublecomplex; incx: var integer; a: ptr doublecomplex;              lda: var integer): cint {.importc: "zsyr_".}
  
  proc zsyrfs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "zsyrfs_".}
  
  proc zsyrfsx*(uplo: var cstring; equed: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
      s: ptr doublereal; b: ptr doublecomplex; ldb: var integer;
      x: ptr doublecomplex; ldx: var integer; rcond: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zsyrfsx_".}
  
  proc zsysv*(uplo: var cstring; n: var integer; nrhs: var integer;
    a: ptr doublecomplex; lda: var integer; ipiv: var cint;
    b: ptr doublecomplex; ldb: var integer; work: ptr doublecomplex;
    lwork: var integer; info: var integer): cint {.importc: "zsysv_".}
  
  proc zsysvx*(fact: var cstring; uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; af: ptr doublecomplex;
     ldaf: var integer; ipiv: var cint; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     rcond: ptr doublereal; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     lwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "zsysvx_".}
  
  proc zsysvxx*(fact: var cstring; uplo: var cstring; n: var integer;
      nrhs: var integer; a: ptr doublecomplex; lda: var integer;
      af: ptr doublecomplex; ldaf: var integer; ipiv: var cint;
      equed: var cstring; s: ptr doublereal; b: ptr doublecomplex;
      ldb: var integer; x: ptr doublecomplex; ldx: var integer;
      rcond: ptr doublereal; rpvgrw: ptr doublereal;
      berr: ptr doublereal; n_err_bnds: var integer;
      err_bnds_norm: ptr doublereal;
      err_bnds_comp: ptr doublereal; nparams: var integer;
      params: ptr doublereal; work: ptr doublecomplex;
      rwork: ptr doublereal; info: var integer): cint {.importc: "zsysvxx_".}
  
  proc zsytf2*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; info: var integer): cint {.importc: "zsytf2_".}
  
  proc zsytrf*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; work: ptr doublecomplex;
     lwork: var integer; info: var integer): cint {.importc: "zsytrf_".}
  
  proc zsytri*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ipiv: var cint; work: ptr doublecomplex;
     info: var integer): cint {.importc: "zsytri_".}
  
  proc zsytrs*(uplo: var cstring; n: var integer; nrhs: var integer;
     a: ptr doublecomplex; lda: var integer; ipiv: var cint;
     b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "zsytrs_".}
  
  proc ztbcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     kd: var integer; ab: ptr doublecomplex; ldab: var integer;
     rcond: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "ztbcon_".}
  
  proc ztbrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr doublecomplex;
     ldab: var integer; b: ptr doublecomplex; ldb: var integer;
     x: ptr doublecomplex; ldx: var integer; ferr: ptr doublereal;
     berr: ptr doublereal; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "ztbrfs_".}
  
  proc ztbtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     kd: var integer; nrhs: var integer; ab: ptr doublecomplex;
     ldab: var integer; b: ptr doublecomplex; ldb: var integer;
     info: var integer): cint {.importc: "ztbtrs_".}
  
  proc ztfsm*(transr: var cstring; side: var cstring; uplo: var cstring; trans: var cstring;
    diag: var cstring; m: var integer; n: var integer;
    alpha: ptr doublecomplex; a: ptr doublecomplex;
    b: ptr doublecomplex; ldb: var integer): cint {.importc: "ztfsm_".}
  
  proc ztftri*(transr: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr doublecomplex; info: var integer): cint {.importc: "ztftri_".}
  
  proc ztfttp*(transr: var cstring; uplo: var cstring; n: var integer;
     arf: ptr doublecomplex; ap: ptr doublecomplex; info: var integer): cint {.importc: "ztfttp_".}
  
  proc ztfttr*(transr: var cstring; uplo: var cstring; n: var integer;
     arf: ptr doublecomplex; a: ptr doublecomplex; lda: var integer;
     info: var integer): cint {.importc: "ztfttr_".}
  
  proc ztgevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; s: ptr doublecomplex; lds: var integer;
     p: ptr doublecomplex; ldp: var integer; vl: ptr doublecomplex;
     ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;
     mm: var integer; m: var integer; work: ptr doublecomplex;
     rwork: ptr doublereal; info: var integer): cint {.importc: "ztgevc_".}
  
  proc ztgex2*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; q: ptr doublecomplex; ldq: var integer;
     z: ptr doublecomplex; ldz: var integer; j1: var integer;
     info: var integer): cint {.importc: "ztgex2_".}
  
  proc ztgexc*(wantq: ptr logical; wantz: ptr logical; n: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; q: ptr doublecomplex; ldq: var integer;
     z: ptr doublecomplex; ldz: var integer; ifst: var integer;
     ilst: var integer; info: var integer): cint {.importc: "ztgexc_".}
  
  proc ztgsen*(ijob: var integer; wantq: ptr logical; wantz: ptr logical;
     select: ptr logical; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     alpha: ptr doublecomplex; beta: ptr doublecomplex;
     q: ptr doublecomplex; ldq: var integer; z: ptr doublecomplex;
     ldz: var integer; m: var integer; pl: ptr doublereal;
     pr: ptr doublereal; dif: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer; iwork: var integer;
     liwork: var integer; info: var integer): cint {.importc: "ztgsen_".}
  
  proc ztgsja*(jobu: var cstring; jobv: var cstring; jobq: var cstring; m: var integer;
     p: var integer; n: var integer; k: var integer; l: var integer;
     a: ptr doublecomplex; lda: var integer; b: ptr doublecomplex;
     ldb: var integer; tola: ptr doublereal; tolb: ptr doublereal;
     alpha: ptr doublereal; beta: ptr doublereal;
     u: ptr doublecomplex; ldu: var integer; v: ptr doublecomplex;
     ldv: var integer; q: ptr doublecomplex; ldq: var integer;
     work: ptr doublecomplex; ncycle: var integer; info: var integer): cint {.importc: "ztgsja_".}
  
  proc ztgsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer; vl: ptr doublecomplex;
     ldvl: var integer; vr: ptr doublecomplex; ldvr: var integer;
     s: ptr doublereal; dif: ptr doublereal; mm: var integer;
     m: var integer; work: ptr doublecomplex; lwork: var integer;
     iwork: var integer; info: var integer): cint {.importc: "ztgsna_".}
  
  proc ztgsy2*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer; c: ptr doublecomplex;
     ldc: var integer; d: ptr doublecomplex; ldd: var integer;
     e: ptr doublecomplex; lde: var integer; f: ptr doublecomplex;
     ldf: var integer; scale: ptr doublereal; rdsum: ptr doublereal;
     rdscal: ptr doublereal; info: var integer): cint {.importc: "ztgsy2_".}
  
  proc ztgsyl*(trans: var cstring; ijob: var integer; m: var integer;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer; c: ptr doublecomplex;
     ldc: var integer; d: ptr doublecomplex; ldd: var integer;
     e: ptr doublecomplex; lde: var integer; f: ptr doublecomplex;
     ldf: var integer; scale: ptr doublereal; dif: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer; iwork: var integer;
     info: var integer): cint {.importc: "ztgsyl_".}
  
  proc ztpcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr doublecomplex; rcond: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "ztpcon_".}
  
  proc ztprfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr doublecomplex; b: ptr doublecomplex;
     ldb: var integer; x: ptr doublecomplex; ldx: var integer;
     ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "ztprfs_".}
  
  proc ztptri*(uplo: var cstring; diag: var cstring; n: var integer;
     ap: ptr doublecomplex; info: var integer): cint {.importc: "ztptri_".}
  
  proc ztptrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; ap: ptr doublecomplex; b: ptr doublecomplex;
     ldb: var integer; info: var integer): cint {.importc: "ztptrs_".}
  
  proc ztpttf*(transr: var cstring; uplo: var cstring; n: var integer;
     ap: ptr doublecomplex; arf: ptr doublecomplex; info: var integer): cint {.importc: "ztpttf_".}
  
  proc ztpttr*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     a: ptr doublecomplex; lda: var integer; info: var integer): cint {.importc: "ztpttr_".}
  
  proc ztrcon*(norm: var cstring; uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; rcond: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "ztrcon_".}
  
  proc ztrevc*(side: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr doublecomplex; ldt: var integer;
     vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;
     ldvr: var integer; mm: var integer; m: var integer;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "ztrevc_".}
  
  proc ztrexc*(compq: var cstring; n: var integer; t: ptr doublecomplex;
     ldt: var integer; q: ptr doublecomplex; ldq: var integer;
     ifst: var integer; ilst: var integer; info: var integer): cint {.importc: "ztrexc_".}
  
  proc ztrrfs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer; x: ptr doublecomplex;
     ldx: var integer; ferr: ptr doublereal; berr: ptr doublereal;
     work: ptr doublecomplex; rwork: ptr doublereal;
     info: var integer): cint {.importc: "ztrrfs_".}
  
  proc ztrsen*(job: var cstring; compq: var cstring; select: ptr logical;
     n: var integer; t: ptr doublecomplex; ldt: var integer;
     q: ptr doublecomplex; ldq: var integer; w: ptr doublecomplex;
     m: var integer; s: ptr doublereal; sep: ptr doublereal;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "ztrsen_".}
  
  proc ztrsna*(job: var cstring; howmny: var cstring; select: ptr logical;
     n: var integer; t: ptr doublecomplex; ldt: var integer;
     vl: ptr doublecomplex; ldvl: var integer; vr: ptr doublecomplex;
     ldvr: var integer; s: ptr doublereal; sep: ptr doublereal;
     mm: var integer; m: var integer; work: ptr doublecomplex;
     ldwork: var integer; rwork: ptr doublereal; info: var integer): cint {.importc: "ztrsna_".}
  
  proc ztrsyl*(trana: var cstring; tranb: var cstring; isgn: var integer;
     m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; b: ptr doublecomplex; ldb: var integer;
     c: ptr doublecomplex; ldc: var integer; scale: ptr doublereal;
     info: var integer): cint {.importc: "ztrsyl_".}
  
  proc ztrti2*(uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; info: var integer): cint {.importc: "ztrti2_".}
  
  proc ztrtri*(uplo: var cstring; diag: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; info: var integer): cint {.importc: "ztrtri_".}
  
  proc ztrtrs*(uplo: var cstring; trans: var cstring; diag: var cstring; n: var integer;
     nrhs: var integer; a: ptr doublecomplex; lda: var integer;
     b: ptr doublecomplex; ldb: var integer; info: var integer): cint {.importc: "ztrtrs_".}
  
  proc ztrttf*(transr: var cstring; uplo: var cstring; n: var integer;
     a: ptr doublecomplex; lda: var integer; arf: ptr doublecomplex;
     info: var integer): cint {.importc: "ztrttf_".}
  
  proc ztrttp*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; ap: ptr doublecomplex; info: var integer): cint {.importc: "ztrttp_".}
  
  proc ztzrqf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex; info: var integer): cint {.importc: "ztzrqf_".}
  
  proc ztzrzf*(m: var integer; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "ztzrzf_".}
  
  proc zung2l*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zung2l_".}
  
  proc zung2r*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zung2r_".}
  
  proc zungbr*(vect: var cstring; m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungbr_".}
  
  proc zunghr*(n: var integer; ilo: var integer; ihi: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunghr_".}
  
  proc zungl2*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zungl2_".}
  
  proc zunglq*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunglq_".}
  
  proc zungql*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungql_".}
  
  proc zungqr*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungqr_".}
  
  proc zungr2*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zungr2_".}
  
  proc zungrq*(m: var integer; n: var integer; k: var integer;
     a: ptr doublecomplex; lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungrq_".}
  
  proc zungtr*(uplo: var cstring; n: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zungtr_".}
  
  proc zunm2l*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunm2l_".}
  
  proc zunm2r*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunm2r_".}
  
  proc zunmbr*(vect: var cstring; side: var cstring; trans: var cstring; m: var integer;
     n: var integer; k: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunmbr_".}
  
  proc zunmhr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     ilo: var integer; ihi: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunmhr_".}
  
  proc zunml2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunml2_".}
  
  proc zunmlq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; lwork: var integer;
     info: var integer): cint {.importc: "zunmlq_".}
  
  proc zunmql*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; lwork: var integer;
     info: var integer): cint {.importc: "zunmql_".}
  
  proc zunmqr*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; lwork: var integer;
     info: var integer): cint {.importc: "zunmqr_".}
  
  proc zunmr2*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; info: var integer): cint {.importc: "zunmr2_".}
  
  proc zunmr3*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zunmr3_".}
  
  proc zunmrq*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; lwork: var integer;
     info: var integer): cint {.importc: "zunmrq_".}
  
  proc zunmrz*(side: var cstring; trans: var cstring; m: var integer; n: var integer;
     k: var integer; l: var integer; a: ptr doublecomplex;
     lda: var integer; tau: ptr doublecomplex;
     c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; lwork: var integer; info: var integer): cint {.importc: "zunmrz_".}
  
  proc zunmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; a: ptr doublecomplex; lda: var integer;
     tau: ptr doublecomplex; c: ptr doublecomplex;
     ldc: var integer; work: ptr doublecomplex; lwork: var integer;
     info: var integer): cint {.importc: "zunmtr_".}
  
  proc zupgtr*(uplo: var cstring; n: var integer; ap: ptr doublecomplex;
     tau: ptr doublecomplex; q: ptr doublecomplex; ldq: var integer;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zupgtr_".}
  
  proc zupmtr*(side: var cstring; uplo: var cstring; trans: var cstring; m: var integer;
     n: var integer; ap: ptr doublecomplex; tau: ptr doublecomplex;
     c: ptr doublecomplex; ldc: var integer;
     work: ptr doublecomplex; info: var integer): cint {.importc: "zupmtr_".}
  
  #___________________________________________________________________________
  #
  # Real, double precision
  #___________________________________________________________________________

  proc dsecnd*(): doublereal {.importc: "dsecnd_".}
      
  proc second*(): doublereal {.importc: "second_".}

  proc slamch*(cmach: var cstring): doublereal {.importc: "slamch_".}
  
  proc slamc1*(beta: var integer; t: var integer; rnd: ptr logical;
     ieee1: ptr logical): cint {.importc: "slamc1_".}
  
  proc slamc2*(beta: var integer; t: var integer; rnd: ptr logical;
     eps: ptr real; emin: var integer; rmin: ptr real;
     emax: var integer; rmax: ptr real): cint {.importc: "slamc2_".}
  
  proc slamc3*(a: ptr real; b: ptr real): doublereal {.importc: "slamc3_".}
  
  proc slamc4*(emin: var integer; start: ptr real; base: var integer): cint {.importc: "slamc4_".}
  
  proc slamc5*(beta: var integer; p: var integer; emin: var integer;
     ieee: ptr logical; emax: var integer; rmax: ptr real): cint {.importc: "slamc5_".}

  proc dlamch*(cmach: var cstring): doublereal {.importc: "dlamch_".}
  
  proc dlamc1*(beta: var integer; t: var integer; rnd: ptr logical;
     ieee1: ptr logical): cint {.importc: "dlamc1_".}
  
  proc dlamc2*(beta: var integer; t: var integer; rnd: ptr logical;
     eps: ptr doublereal; emin: var integer; rmin: ptr doublereal;
     emax: var integer; rmax: ptr doublereal): cint {.importc: "dlamc2_".}

  proc dlamc3*(a: ptr doublereal; b: ptr doublereal): doublereal {.importc: "dlamc3_".}
  
  proc dlamc4*(emin: var integer; start: ptr doublereal; base: var integer): cint {.importc: "dlamc4_".}
  
  proc dlamc5*(beta: var integer; p: var integer; emin: var integer;
     ieee: ptr logical; emax: var integer; rmax: ptr doublereal): cint {.importc: "dlamc5_".}

  {.pop.}