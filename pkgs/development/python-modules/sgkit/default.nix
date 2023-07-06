{ lib
, buildPythonPackage
, fetchPypi
, setuptools-scm
, pythonOlder
, numpy
, xarray
, dask
, distributed
, dask-ml
, scipy
, typing-extensions
, numba
, zarr
, fsspec
, scikit-learn
, pandas
}:

buildPythonPackage rec {
  pname = "sgkit";
  version = "0.7.0";
  format = "pyproject";
  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uOSC+bTHVwMq9meoebvb6ja0bhRys9K75MXmF/Hr4x8=";
  };

  nativeBuildInputs = [
    setuptools-scm
  ];

  propagatedBuildInputs = [
    numpy
    xarray
    dask
    distributed
    dask-ml
    scipy
    typing-extensions
    numba
    zarr
    fsspec
    scikit-learn
    pandas
  ];

  # No tests provided
  doCheck = false;

  pythonImportsCheck = [
    "sgkit"
  ];

  meta = with lib; {
    description = "A library for analyzing and manipulating genetic variation data";
    homepage = "https://github.com/pystatgen/sgkit";
    license = licenses.asl20;
    maintainers = with maintainers; [ alxsimon ];
  };
}
