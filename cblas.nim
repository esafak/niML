#_____________________________________________________________________________
#
# Manually patched after conversion from cblas.h by c2nim 0.94
#
# Emre Safak (c) 2014
#
# To do: Check that all the arrays are indeed using the same range I.
# I think it is likely that they aren't, but this is just an initial commit.
#_____________________________________________________________________________
when not(defined(CBLAS_H)): 
  const 
    CBLAS_H* = true
  # Allow the use in C++ code.  
  #
  #  Enumerated and derived types
  # 
  type 
    CBLAS_INDEX* = csize # was size_t
  type 
    CBLAS_ORDER* = enum 
      CblasRowMajor = 101, CblasColMajor = 102
  type 
    CBLAS_TRANSPOSE* = enum 
      CblasNoTrans = 111, CblasTrans = 112, CblasConjTrans = 113
  type 
    CBLAS_UPLO* = enum 
      CblasUpper = 121, CblasLower = 122
  type 
    CBLAS_DIAG* = enum 
      CblasNonUnit = 131, CblasUnit = 132
  type 
    CBLAS_SIDE* = enum 
      CblasLeft = 141, CblasRight = 142
  #
  #  ===========================================================================
  #  Prototypes for level 1 BLAS functions (complex are recast as routines)
  #  ===========================================================================
  # 
  {.push header: "<cblas.h>", nodecl.}

  proc sdsdot*[I](N: cint; alpha: cfloat; X: array[I, cfloat]; incX: cint;
                     Y: array[I, cfloat]; incY: cint): cfloat {.importc: "cblas_sdsdot".}
  proc dsdot*[I](N: cint; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                    incY: cint): cdouble {.importc: "cblas_dsdot".}
  proc sdot*[I](N: cint; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                    incY: cint): cfloat {.importc: "cblas_sdot".}
  proc ddot*[I](N: cint; X: array[I, cdouble]; incX: cint; Y: array[I, cdouble];
                    incY: cint): cdouble {.importc: "cblas_ddot".}
  #
  #  Functions having prefixes Z and C only
  # 
  proc cdotu_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint;
                        dotu: pointer) {.importc: "cblas_cdotu_sub".}
  proc cdotc_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint;
                        dotc: pointer) {.importc: "cblas_cdotc_sub".}
  proc zdotu_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint;
                        dotu: pointer) {.importc: "cblas_zdotu_sub".}
  proc zdotc_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint;
                        dotc: pointer) {.importc: "cblas_zdotc_sub".}
  #
  #  Functions having prefixes S D SC DZ
  #  {.importc: "".}
  proc snrm2*[I](N: cint; X: array[I, cfloat]; incX: cint): cfloat {.importc: "cblas_snrm2".}
  proc sasum*[I](N: cint; X: array[I, cfloat]; incX: cint): cfloat {.importc: "cblas_sasum".}
  proc dnrm2*[I](N: cint; X: array[I, cdouble]; incX: cint): cdouble {.importc: "cblas_dnrm2".}
  proc dasum*[I](N: cint; X: array[I, cdouble]; incX: cint): cdouble {.importc: "cblas_dasum".}
  proc scnrm2*(N: cint; X: pointer; incX: cint): cfloat {.importc: "cblas_scnrm2".}
  proc scasum*(N: cint; X: pointer; incX: cint): cfloat {.importc: "cblas_scasum".}
  proc dznrm2*(N: cint; X: pointer; incX: cint): cdouble {.importc: "cblas_dznrm2".}
  proc dzasum*(N: cint; X: pointer; incX: cint): cdouble {.importc: "cblas_dzasum".}
  #
  #  Functions having standard 4 prefixes (S D C Z)
  # 
  proc isamax*[I](N: cint; X: array[I, cfloat]; incX: cint): CBLAS_INDEX {.importc: "cblas_isamax".}
  proc idamax*[I](N: cint; X: array[I, cdouble]; incX: cint): CBLAS_INDEX {.importc: "cblas_idamax".}
  proc icamax*(N: cint; X: pointer; incX: cint): CBLAS_INDEX {.importc: "cblas_icamax".}
  proc izamax*(N: cint; X: pointer; incX: cint): CBLAS_INDEX {.importc: "cblas_izamax".}
  #
  #  ===========================================================================
  #  Prototypes for level 1 BLAS routines
  #  ===========================================================================
  # 
  # 
  #  Routines with standard 4 prefixes (s, d, c, z)
  # 
  proc sswap*[I](N: cint; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                     incY: cint) {.importc: "cblas_sswap".}
  proc scopy*[I](N: cint; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                     incY: cint) {.importc: "cblas_scopy".}
  proc saxpy*[I](N: cint; alpha: cfloat; X: array[I, cfloat]; incX: cint;
                     Y: array[I, cfloat]; incY: cint) {.importc: "cblas_saxpy".}
  proc dswap*[I](N: cint; X: array[I, cdouble]; incX: cint; Y: array[I, cdouble];
                     incY: cint) {.importc: "cblas_dswap".}
  proc dcopy*[I](N: cint; X: array[I, cdouble]; incX: cint; Y: array[I, cdouble];
                     incY: cint) {.importc: "cblas_dcopy".}
  proc daxpy*[I](N: cint; alpha: cdouble; X: array[I, cdouble]; incX: cint;
                     Y: array[I, cdouble]; incY: cint) {.importc: "cblas_daxpy".}
  proc cswap*(N: cint; X: pointer; incX: cint; Y: pointer; 
                    incY: cint) {.importc: "cblas_cswap".}
  proc ccopy*(N: cint; X: pointer; incX: cint; Y: pointer; 
                    incY: cint) {.importc: "cblas_ccopy".}
  proc caxpy*(N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer;
                     incY: cint) {.importc: "cblas_caxpy".}
  proc zswap*(N: cint; X: pointer; incX: cint; Y: pointer; 
                    incY: cint) {.importc: "cblas_zswap".}
  proc zcopy*(N: cint; X: pointer; incX: cint; Y: pointer; 
                    incY: cint) {.importc: "cblas_zcopy".}
  proc zaxpy*(N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer;
                    incY: cint) {.importc: "cblas_zaxpy".}
  # 
  #  Routines with S and D prefix only
  # 
  proc srotg*[I](a: array[I, cfloat]; b: array[I, cfloat]; c: array[I, cfloat]; 
                      s: array[I, cfloat]) {.importc: "cblas_srotg".}
  proc srotmg*[I](d1: array[I, cfloat]; d2: array[I, cfloat]; b1: array[I, cfloat]; b2: cfloat;
                      P: array[I, cfloat]) {.importc: "cblas_srotmg".}
  proc srot*[I](N: cint; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                    incY: cint; c: cfloat; s: cfloat) {.importc: "cblas_srot".}
  proc srotm*[I](N: cint; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                    incY: cint; P: array[I, cfloat]) {.importc: "cblas_srotm".}
  proc drotg*[I](a: array[I, cdouble]; b: array[I, cdouble]; c: array[I, cdouble];
                     s: array[I, cdouble]) {.importc: "cblas_drotg".}
  proc drotmg*[I](d1: array[I, cdouble]; d2: array[I, cdouble]; b1: array[I, cdouble];
                      b2: cdouble; P: array[I, cdouble]) {.importc: "cblas_drotmg".}
  proc drot*[I](N: cint; X: array[I, cdouble]; incX: cint; Y: array[I, cdouble];
                    incY: cint; c: cdouble; s: cdouble) {.importc: "cblas_drot".}
  proc drotm*[I](N: cint; X: array[I, cdouble]; incX: cint; Y: array[I, cdouble];
                    incY: cint; P: array[I, cdouble]) {.importc: "cblas_drotm".}
  # 
  #  Routines with S D C Z CS and ZD prefixes
  # 
  proc sscal*[I](N: cint; alpha: cfloat; X: array[I, cfloat]; 
    incX: cint) {.importc: "cblas_sscal".}
  proc dscal*[I](N: cint; alpha: cdouble; X: array[I, cdouble]; 
    incX: cint) {.importc: "cblas_dscal".}
  proc cscal*(N: cint; alpha: pointer; X: pointer; 
    incX: cint) {.importc: "cblas_cscal".}
  proc zscal*(N: cint; alpha: pointer; X: pointer; 
    incX: cint) {.importc: "cblas_zscal".}
  proc csscal*(N: cint; alpha: cfloat; X: pointer; 
    incX: cint) {.importc: "cblas_csscal".}
  proc zdscal*(N: cint; alpha: cdouble; X: pointer; 
    incX: cint) {.importc: "cblas_zdscal".}
  #
  #  ===========================================================================
  #  Prototypes for level 2 BLAS
  #  ===========================================================================
  # 
  # 
  #  Routines with standard 4 prefixes (S, D, C, Z)
  # 
  proc sgemv*[I](order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                     N: cint; alpha: cfloat; A: array[I, cfloat]; lda: cint;
                     X: array[I, cfloat]; incX: cint; beta: cfloat; Y: array[I, cfloat];
                     incY: cint) {.importc: "cblas_sgemv".}
  proc sgbmv*[I](order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                     N: cint; KL: cint; KU: cint; alpha: cfloat; A: array[I, cfloat];
                    lda: cint; X: array[I, cfloat]; incX: cint; beta: cfloat;
                     Y: array[I, cfloat]; incY: cint) {.importc: "cblas_sgbmv".}
  proc strmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     A: array[I, cfloat]; lda: cint; X: array[I, cfloat]; 
                     incX: cint) {.importc: "cblas_strmv".}
  proc stbmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint;
                     A: array[I, cfloat]; lda: cint; X: array[I, cfloat]; 
                     incX: cint) {.importc: "cblas_stbmv".}
  proc stpmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     Ap: array[I, cfloat]; X: array[I, cfloat]; 
                     incX: cint) {.importc: "cblas_stpmv".}
  proc strsv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     A: array[I, cfloat]; lda: cint; X: array[I, cfloat]; 
                     incX: cint) {.importc: "cblas_strsv".}
  proc stbsv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint;
                     A: array[I, cfloat]; lda: cint; X: array[I, cfloat]; 
                     incX: cint) {.importc: "cblas_stbsv".}
  proc stpsv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     Ap: array[I, cfloat]; X: array[I, cfloat]; 
                     incX: cint) {.importc: "cblas_stpsv".}
  proc dgemv*[I](order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                     N: cint; alpha: cdouble; A: array[I, cdouble]; lda: cint;
                     X: array[I, cdouble]; incX: cint; beta: cdouble; 
                     Y: array[I, cdouble]; incY: cint) {.importc: "cblas_dgemv".}
  proc dgbmv*[I](order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                     N: cint; KL: cint; KU: cint; alpha: cdouble; A: array[I, cdouble];
                     lda: cint; X: array[I, cdouble]; incX: cint; beta: cdouble;
                     Y: array[I, cdouble]; incY: cint) {.importc: "cblas_dgbmv".}
  proc dtrmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     A: array[I, cdouble]; lda: cint; X: array[I, cdouble]; 
                     incX: cint) {.importc: "cblas_dtrmv".}
  proc dtbmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint;
                     A: array[I, cdouble]; lda: cint; X: array[I, cdouble]; 
                     incX: cint) {.importc: "cblas_dtbmv".}
  proc dtpmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     Ap: array[I, cdouble]; X: array[I, cdouble]; 
                     incX: cint) {.importc: "cblas_dtpmv".}
  proc dtrsv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                     TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                     A: array[I, cdouble]; lda: cint; X: array[I, cdouble]; 
                     incX: cint) {.importc: "cblas_dtrsv".}
  proc dtbsv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint;
                    A: array[I, cdouble]; lda: cint; X: array[I, cdouble]; 
                    incX: cint) {.importc: "cblas_dtbsv".}
  proc dtpsv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    Ap: array[I, cdouble]; X: array[I, cdouble]; 
                    incX: cint) {.importc: "cblas_dtpsv".}
  proc cgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                    N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer;
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_cgemv".}
  proc cgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                    N: cint; KL: cint; KU: cint; alpha: pointer; A: pointer;
                    lda: cint; X: pointer; incX: cint; beta: pointer;
                    Y: pointer; incY: cint) {.importc: "cblas_cgbmv".}
  proc ctrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ctrmv".}
  proc ctbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; 
                    N: cint; K: cint; A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ctbmv".}
  proc ctpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    Ap: pointer; X: pointer; 
                    incX: cint) {.importc: "cblas_ctpmv".}
  proc ctrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ctrsv".}
  proc ctbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; 
                    N: cint; K: cint; A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ctbsv".}
  proc ctpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; 
                    N: cint; Ap: pointer; X: pointer; 
                    incX: cint) {.importc: "cblas_ctpsv".}
  proc zgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                    N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer;
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_zgemv".}
  proc zgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint;
                    N: cint; KL: cint; KU: cint; alpha: pointer; A: pointer;
                    lda: cint; X: pointer; incX: cint; beta: pointer;
                    Y: pointer; incY: cint) {.importc: "cblas_zgbmv".}
  proc ztrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ztrmv".}
  proc ztbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint;
                    A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ztbmv".}
  proc ztpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    Ap: pointer; X: pointer; 
                    incX: cint) {.importc: "cblas_ztpmv".}
  proc ztrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ztrsv".}
  proc ztbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint;
                    A: pointer; lda: cint; X: pointer; 
                    incX: cint) {.importc: "cblas_ztbsv".}
  proc ztpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint;
                    Ap: pointer; X: pointer; 
                    incX: cint) {.importc: "cblas_ztpsv".}
  # 
  #  Routines with S and D prefixes only
  # 
  proc ssymv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cfloat; A: array[I, cfloat]; lda: cint; X: array[I, cfloat];
                    incX: cint; beta: cfloat; Y: array[I, cfloat]; 
                    incY: cint) {.importc: "cblas_ssymv".}
  proc ssbmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint;
                    alpha: cfloat; A: array[I, cfloat]; lda: cint; X: array[I, cfloat];
                    incX: cint; beta: cfloat; Y: array[I, cfloat]; 
                    incY: cint) {.importc: "cblas_ssbmv".}
  proc sspmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cfloat; Ap: array[I, cfloat]; X: array[I, cfloat]; incX: cint;
                    beta: cfloat; Y: array[I, cfloat]; 
                    incY: cint) {.importc: "cblas_sspmv".}
  proc sger*[I](order: CBLAS_ORDER; M: cint; N: cint; alpha: cfloat;
                    X: array[I, cfloat]; incX: cint; Y: array[I, cfloat]; incY: cint;
                    A: array[I, cfloat]; lda: cint) {.importc: "cblas_sger".}
  proc ssyr*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat;
                    X: array[I, cfloat]; incX: cint; A: array[I, cfloat]; 
                    lda: cint) {.importc: "cblas_ssyr".}
  proc sspr*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; 
                    alpha: cfloat; X: array[I, cfloat]; incX: cint; 
                    Ap: array[I, cfloat]) {.importc: "cblas_sspr".}
  proc ssyr2*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cfloat; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                    incY: cint; A: array[I, cfloat]; 
                    lda: cint) {.importc: "cblas_ssyr2".}
  proc sspr2*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cfloat; X: array[I, cfloat]; incX: cint; Y: array[I, cfloat];
                    incY: cint; A: array[I, cfloat]) {.importc: "cblas_sspr2".}
  proc dsymv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; A: array[I, cdouble]; lda: cint; X: array[I, cdouble];
                    incX: cint; beta: cdouble; Y: array[I, cdouble]; 
                    incY: cint) {.importc: "cblas_dsymv".}
  proc dsbmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint;
                    alpha: cdouble; A: array[I, cdouble]; lda: cint; X: array[I, cdouble];
                    incX: cint; beta: cdouble; Y: array[I, cdouble]; 
                    incY: cint) {.importc: "cblas_dsbmv".}
  proc dspmv*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; Ap: array[I, cdouble]; X: array[I, cdouble]; incX: cint;
                    beta: cdouble; Y: array[I, cdouble]; 
                    incY: cint) {.importc: "cblas_dspmv".}
  proc dger*[I](order: CBLAS_ORDER; M: cint; N: cint; alpha: cdouble;
                    X: array[I, cdouble]; incX: cint; Y: array[I, cdouble]; incY: cint;
                    A: array[I, cdouble]; lda: cint) {.importc: "cblas_dger".}
  proc dsyr*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; X: array[I, cdouble]; incX: cint; 
                    A: array[I, cdouble]; lda: cint) {.importc: "cblas_dsyr".}
  proc dspr*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; X: array[I, cdouble]; incX: cint; 
                    Ap: array[I, cdouble]) {.importc: "cblas_dspr".}
  proc dsyr2*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; X: array[I, cdouble]; incX: cint; 
                    Y: array[I, cdouble]; incY: cint; A: array[I, cdouble]; 
                    lda: cint) {.importc: "cblas_dsyr2".}
  proc dspr2*[I](order: CBLAS_ORDER; Uplo: CBLAS_UPLO; 
                    N: cint; alpha: cdouble; X: array[I, cdouble]; 
                    incX: cint; Y: array[I, cdouble]; incY: cint; 
                    A: array[I, cdouble]) {.importc: "cblas_dspr2".}
  # 
  #  Routines with C and Z prefixes only
  # 
  proc chemv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; A: pointer; lda: cint; X: pointer;
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_chemv".}
  proc chbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint;
                    alpha: pointer; A: pointer; lda: cint; X: pointer;
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_chbmv".}
  proc chpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; Ap: pointer; X: pointer; incX: cint;
                    beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_chpmv".}
  proc cgeru*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer;
                    X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer;
                    lda: cint) {.importc: "cblas_cgeru".}
  proc cgerc*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer;
                    X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer;
                    lda: cint) {.importc: "cblas_cgerc".}
  proc cher*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat;
                    X: pointer; incX: cint; A: pointer; 
                    lda: cint) {.importc: "cblas_cher".}
  proc chpr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat;
                    X: pointer; incX: cint; A: pointer) {.importc: "cblas_chpr".}
  proc cher2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; X: pointer; incX: cint; Y: pointer;
                    incY: cint; A: pointer; 
                    lda: cint) {.importc: "cblas_cher2".}
  proc chpr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; X: pointer; incX: cint; Y: pointer;
                    incY: cint; Ap: pointer) {.importc: "cblas_chpr2".}
  proc zhemv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; A: pointer; lda: cint; X: pointer;
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_zhemv".}
  proc zhbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint;
                    alpha: pointer; A: pointer; lda: cint; X: pointer;
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_zhbmv".}
  proc zhpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; Ap: pointer; X: pointer; 
                    incX: cint; beta: pointer; Y: pointer; 
                    incY: cint) {.importc: "cblas_zhpmv".}
  proc zgeru*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer;
                    X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer;
                    lda: cint) {.importc: "cblas_zgeru".}
  proc zgerc*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer;
                    X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer;
                    lda: cint) {.importc: "cblas_zgerc".}
  proc zher*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; X: pointer; incX: cint; 
                    A: pointer; lda: cint) {.importc: "cblas_zher".}
  proc zhpr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: cdouble; X: pointer; incX: cint; 
                    A: pointer) {.importc: "cblas_zhpr".}
  proc zher2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; X: pointer; incX: cint; Y: pointer;
                    incY: cint; A: pointer; lda: cint) {.importc: "cblas_zher2".}
  proc zhpr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint;
                    alpha: pointer; X: pointer; incX: cint; Y: pointer;
                    incY: cint; Ap: pointer) {.importc: "cblas_zhpr2".}
  #
  #  ===========================================================================
  #  Prototypes for level 3 BLAS
  #  ===========================================================================
  # 
  # 
  #  Routines with standard 4 prefixes (S, D, C, Z)
  # 
  proc sgemm*[I](Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE;
                    TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint;
                    alpha: cfloat; A: array[I, cfloat]; lda: cint; B: array[I, cfloat];
                    ldb: cint; beta: cfloat; C: array[I, cfloat]; 
                    ldc: cint) {.importc: "cblas_sgemm".}
  proc ssymm*[I](Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    M: cint; N: cint; alpha: cfloat; A: array[I, cfloat]; lda: cint;
                    B: array[I, cfloat]; ldb: cint; beta: cfloat; C: array[I, cfloat];
                    ldc: cint) {.importc: "cblas_ssymm".}
  proc ssyrk*[I](Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat;
                    A: array[I, cfloat]; lda: cint; beta: cfloat; C: array[I, cfloat];
                    ldc: cint) {.importc: "cblas_ssyrk".}
  proc ssyr2k*[I](Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat;
                    A: array[I, cfloat]; lda: cint; B: array[I, cfloat]; ldb: cint;
                    beta: cfloat; C: array[I, cfloat]; ldc: cint) {.importc: "cblas_ssyr2k".}
  proc strmm*[I](Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: cfloat; A: array[I, cfloat]; lda: cint; B: array[I, cfloat];
                    ldb: cint) {.importc: "cblas_strmm".}
  proc strsm*[I](Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: cfloat; A: array[I, cfloat]; lda: cint; B: array[I, cfloat];
                    ldb: cint) {.importc: "cblas_strsm".}
  proc dgemm*[I](Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE;
                    TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint;
                    alpha: cdouble; A: array[I, cdouble]; lda: cint; B: array[I, cdouble];
                    ldb: cint; beta: cdouble; C: array[I, cdouble]; 
                    ldc: cint) {.importc: "cblas_dgemm".}
  proc dsymm*[I](Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    M: cint; N: cint; alpha: cdouble; A: array[I, cdouble]; lda: cint;
                    B: array[I, cdouble]; ldb: cint; beta: cdouble; C: array[I, cdouble];
                    ldc: cint) {.importc: "cblas_dsymm".}
  proc dsyrk*[I](Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble;
                    A: array[I, cdouble]; lda: cint; beta: cdouble; C: array[I, cdouble];
                    ldc: cint) {.importc: "cblas_dsyrk".}
  proc dsyr2k*[I](Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble;
                    A: array[I, cdouble]; lda: cint; B: array[I, cdouble]; ldb: cint;
                    beta: cdouble; C: array[I, cdouble]; 
                    ldc: cint) {.importc: "cblas_dsyr2k".}
  proc dtrmm*[I](Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: cdouble; A: array[I, cdouble]; lda: cint; B: array[I, cdouble];
                    ldb: cint) {.importc: "cblas_dtrmm".}
  proc dtrsm*[I](Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: cdouble; A: array[I, cdouble]; lda: cint; B: array[I, cdouble];
                    ldb: cint) {.importc: "cblas_dtrsm".}
  proc cgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE;
                    TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint;
                    alpha: pointer; A: pointer; lda: cint; B: pointer;
                    ldb: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_cgemm".}
  proc csymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    M: cint; N: cint; alpha: pointer; A: pointer; lda: cint;
                    B: pointer; ldb: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_csymm".}
  proc csyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer;
                    A: pointer; lda: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_csyrk".}
  proc csyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer;
                    A: pointer; lda: cint; B: pointer; ldb: cint;
                    beta: pointer; C: pointer; ldc: cint) {.importc: "cblas_csyr2k".}
  proc ctrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: pointer; A: pointer; lda: cint; B: pointer; 
                    ldb: cint) {.importc: "cblas_ctrmm".}
  proc ctrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: pointer; A: pointer; lda: cint; B: pointer; 
                    ldb: cint) {.importc: "cblas_ctrsm".}
  proc zgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE;
                    TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint;
                    alpha: pointer; A: pointer; lda: cint; B: pointer;
                    ldb: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_zgemm".}
  proc zsymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    M: cint; N: cint; alpha: pointer; A: pointer; lda: cint;
                    B: pointer; ldb: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_zsymm".}
  proc zsyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer;
                    A: pointer; lda: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_zsyrk".}
  proc zsyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer;
                    A: pointer; lda: cint; B: pointer; ldb: cint;
                    beta: pointer; C: pointer; ldc: cint) {.importc: "cblas_zsyr2k".}
  proc ztrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: pointer; A: pointer; lda: cint; B: pointer; 
                    ldb: cint) {.importc: "cblas_ztrmm".}
  proc ztrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint;
                    alpha: pointer; A: pointer; lda: cint; B: pointer; 
                    ldb: cint) {.importc: "cblas_ztrsm".}
  # 
  #  Routines with prefixes C and Z only
  # 
  proc chemm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    M: cint; N: cint; alpha: pointer; A: pointer; lda: cint;
                    B: pointer; ldb: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_chemm".}
  proc cherk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat;
                    A: pointer; lda: cint; beta: cfloat; C: pointer; 
                    ldc: cint) {.importc: "cblas_cherk".}
  proc cher2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer;
                    A: pointer; lda: cint; B: pointer; ldb: cint; beta: cfloat;
                    C: pointer; ldc: cint) {.importc: "cblas_cher2k".}
  proc zhemm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO;
                    M: cint; N: cint; alpha: pointer; A: pointer; lda: cint;
                    B: pointer; ldb: cint; beta: pointer; C: pointer; 
                    ldc: cint) {.importc: "cblas_zhemm".}
  proc zherk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble;
                    A: pointer; lda: cint; beta: cdouble; C: pointer; 
                    ldc: cint) {.importc: "cblas_zherk".}
  proc zher2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO;
                    Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer;
                    A: pointer; lda: cint; B: pointer; ldb: cint;
                    beta: cdouble; C: pointer; ldc: cint) {.importc: "cblas_zher2k".}
  proc xerbla*(p: cint; rout: cstring; form: cstring) {.varargs, importc: "cblas_xerbla".}

  {.pop.}