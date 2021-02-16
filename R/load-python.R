# # Load the module and create dummy objects from it, all of which are NULL
# the_py_module <- reticulate::import_from_path(
#   "addPy",
#   system.file("python", package = packageName())
# )
# # test <<- the_py_module
# for (obj in names(the_py_module)) {
#   assign(obj, 1)
# }
# # Clean up
# rm(the_py_module)

# Now all those names are in the namespace, and ready to be replaced on load
# .onLoad <- function(libname, pkgname) {
#   the_py_module <- reticulate::import_from_path(
#     module = "addPy",
#     path = system.file("python", package = packageName()),
#     delay_load = TRUE
#   )
#   # assignInMyNamespace(...) is meant for namespace manipulation
#   for (obj in names(the_py_module)) {
#     assignInMyNamespace(obj, the_py_module[[obj]])
#   }
# }

# addPy <- NULL
#
# .onLoad <- function(libname, pkgname) {
#   # use superassignment to update global reference of function
#   addPy <<- reticulate::import_from_path(
#     module = "addPy",
#     path = system.file("python", package = packageName()),
#     delay_load = TRUE
#   )
# }


# .onLoad <- function(libname, pkgname) {
#   reticulate::source_python(
#     file = system.file("python", "addPy.py", package = packageName()),
#     envir = getNamespace(packageName())
#   )
# }


#' @title Enable Python Functions
#' @export
usePython <- function() {
    reticulate::source_python(
      file = system.file("python", "addPy.py", package = packageName()),
      envir = getNamespace(packageName())
    )
}


