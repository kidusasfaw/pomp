// -*- C++ -*-

#ifndef _POMP_DEFINES_H_
#define _POMP_DEFINES_H_

#include <R.h>
#include <Rmath.h>
#include <Rdefines.h>
#include <Rinternals.h>

#include "pomp.h"

# define MATCHROWNAMES(X,N,W) (matchnames(GET_ROWNAMES(GET_DIMNAMES(X)),(N),(W)))
# define MATCHCOLNAMES(X,N,W) (matchnames(GET_COLNAMES(GET_DIMNAMES(X)),(N),(W)))

typedef enum {undef=-1,Rfun=0,native=1,regNative=2} pompfunmode;

// lookup-table structure, as used internally
typedef struct lookup_table {
  int length, width;
  int index;
  double *x;
  double *y;
} lookup_table;

static R_INLINE SEXP makearray (int rank, int *dim) {
  int *dimp, k;
  double *xp;
  SEXP dimx, x;
  PROTECT(dimx = NEW_INTEGER(rank));
  dimp = INTEGER(dimx);
  for (k = 0; k < rank; k++) dimp[k] = dim[k];
  PROTECT(x = allocArray(REALSXP,dimx));
  xp = REAL(x);
  for (k = 0; k < length(x); k++) xp[k] = NA_REAL;
  UNPROTECT(2);
  return x;
}

static R_INLINE SEXP matchnames (SEXP x, SEXP names, const char *where) {
  int n = length(names);
  int *idx, k;
  SEXP index, nm;
  PROTECT(nm = AS_CHARACTER(names));
  PROTECT(index = match(x,nm,0));
  idx = INTEGER(index);
  for (k = 0; k < n; k++) {
    if (idx[k]==0)
      errorcall(R_NilValue,"variable '%s' not found among the %s",
		CHAR(STRING_ELT(nm,k)),
		where);
    idx[k] -= 1;
  }
  UNPROTECT(2);
  return index;
}

static R_INLINE SEXP name_index (SEXP names, SEXP object, const char *slot, const char *humanreadable) {
  SEXP slotnames, index;
  PROTECT(slotnames = GET_SLOT(object,install(slot)));
  if (LENGTH(slotnames) > 0) {
    PROTECT(index = matchnames(names,slotnames,humanreadable));
  } else {
    PROTECT(index = NEW_INTEGER(0));
  }
  UNPROTECT(2);
  return index;
}

static R_INLINE void setrownames (SEXP x, SEXP names, int n) {
  SEXP dimnms, nm;
  PROTECT(nm = AS_CHARACTER(names));
  PROTECT(dimnms = allocVector(VECSXP,n));
  SET_ELEMENT(dimnms,0,nm);	// set row names
  SET_DIMNAMES(x,dimnms);
  UNPROTECT(2);
}

static R_INLINE void fixdimnames (SEXP x, const char **names, int n) {
  int nprotect = 0;
  int i;
  SEXP dimnames, nm;
  PROTECT(dimnames = GET_DIMNAMES(x)); nprotect++;
  if (isNull(dimnames)) {
    PROTECT(dimnames = allocVector(VECSXP,n)); nprotect++;
  }
  PROTECT(nm = allocVector(VECSXP,n)); nprotect++;
  for (i = 0; i < n; i++)
    SET_ELEMENT(nm,i,mkChar(names[i]));
  SET_NAMES(dimnames,nm);
  SET_DIMNAMES(x,dimnames);
  UNPROTECT(nprotect);
}

static R_INLINE SEXP as_matrix (SEXP x) {
  int nprotect = 0;
  SEXP dim, names;
  int *xdim, nrow, ncol;
  PROTECT(dim = GET_DIM(x)); nprotect++;
  if (isNull(dim)) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_NAMES(x)); nprotect++;
    dim = NEW_INTEGER(2);
    xdim = INTEGER(dim);
    xdim[0] = LENGTH(x); xdim[1] = 1;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,2);
  } else if (LENGTH(dim) == 1) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_ROWNAMES(GET_DIMNAMES(x))); nprotect++;
    dim = NEW_INTEGER(2);
    xdim = INTEGER(dim);
    xdim[0] = LENGTH(x); xdim[1] = 1;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,2);
  } else if (LENGTH(dim) > 2) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_ROWNAMES(GET_DIMNAMES(x))); nprotect++;
    nrow = INTEGER(dim)[0];
    ncol = LENGTH(x)/nrow;
    dim = NEW_INTEGER(2);
    xdim = INTEGER(dim);
    xdim[0] = nrow; xdim[1] = ncol;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,2);
  }
  UNPROTECT(nprotect);
  return x;
}

static R_INLINE SEXP as_state_array (SEXP x) {
  int nprotect = 0;
  SEXP dim, names;
  int *xdim, nrow, ncol;
  PROTECT(dim = GET_DIM(x)); nprotect++;
  if (isNull(dim)) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_NAMES(x)); nprotect++;
    dim = NEW_INTEGER(3);
    xdim = INTEGER(dim);
    xdim[0] = LENGTH(x); xdim[1] = 1; xdim[2] = 1;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,3);
  } else if (LENGTH(dim) == 1) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_ROWNAMES(GET_DIMNAMES(x))); nprotect++;
    dim = NEW_INTEGER(3);
    xdim = INTEGER(dim);
    xdim[0] = LENGTH(x); xdim[1] = 1; xdim[2] = 1;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,3);
  } else if (LENGTH(dim) == 2) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_ROWNAMES(GET_DIMNAMES(x))); nprotect++;
    xdim = INTEGER(dim);
    nrow = xdim[0]; ncol = xdim[1];
    dim = NEW_INTEGER(3);
    xdim = INTEGER(dim);
    xdim[0] = nrow; xdim[1] = 1; xdim[2] = ncol;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,3);
  } else if (LENGTH(dim) > 3) {
    PROTECT(x = duplicate(x)); nprotect++;
    PROTECT(names = GET_ROWNAMES(GET_DIMNAMES(x))); nprotect++;
    xdim = INTEGER(dim);
    nrow = xdim[0]; ncol = xdim[1];
    dim = NEW_INTEGER(3);
    xdim = INTEGER(dim);
    xdim[0] = nrow; xdim[1] = ncol; xdim[2] = LENGTH(x)/nrow/ncol;
    SET_DIM(x,dim);
    SET_NAMES(x,R_NilValue);
    setrownames(x,names,3);
  }
  UNPROTECT(nprotect);
  return x;
}

static R_INLINE SEXP getListElement (SEXP list, const char *str)
{
  SEXP elmt = R_NilValue;
  SEXP names = getAttrib(list,R_NamesSymbol);
  for (R_len_t i = 0; i < length(list); i++)
    if(strcmp(CHAR(STRING_ELT(names,i)),str) == 0) {
      elmt = VECTOR_ELT(list,i);
      break;
    }
  return elmt;
}

static R_INLINE SEXP getPairListElement (SEXP list, const char *name)
{
  const char *tag;
  while (list != R_NilValue) {
    tag = CHAR(PRINTNAME(TAG(list)));
    if (strcmp(tag,name)==0) break;
    list = CDR(list);
  }
  return CAR(list);
}

#ifdef __cplusplus

template <class Scalar>
class view {
private:
  Scalar *data;
  int dim[2];
public:
  view (Scalar *x) {
    data = x;
    dim[0] = 0;
    dim[1] = 0;
  };
  view (Scalar *x, int d1) {
    data = x;
    dim[0] = d1;
    dim[1] = 0;
  };
  view (Scalar *x, int d1, int d2) {
    data = x;
    dim[0] = d1;
    dim[1] = d2;
  };
  ~view (void) {};
  inline Scalar& operator () (int d1) {
    return(data[d1]);
  };
  inline Scalar& operator () (int d1, int d2) {
    return(data[d1 + dim[0] * d2]);
  };
  inline Scalar& operator () (int d1, int d2, int d3) {
    return(data[d1 + dim[0] * (d2 + dim[1] * d3)]);
  };
};

#endif

#endif
