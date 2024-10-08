project('leg2cheb', 'c', 'cython', 'cpp',
        version : '1.0',
        default_options : [
          'buildtype=release',
          'warning_level=1',
          'optimization=3'])

c = meson.get_compiler('c')
cy = meson.get_compiler('cython')
cpp = meson.get_compiler('cpp')

add_global_arguments(['-fomit-frame-pointer'], language : 'c')
add_global_link_arguments(['-lm'], language : 'c')
add_global_arguments('-std=c++14', language : 'cpp')
fftw = dependency('fftw3')

acc = '0'
if host_machine.system() == 'darwin' and host_machine.cpu_family() == 'aarch64'
  acc = run_command('sh', '-c', 'echo $USE_ACCELERATE', check : false).stdout().strip()
endif

if acc == '1'
  add_global_link_arguments(['-framework', 'Accelerate'], language : 'c')
  add_global_arguments(['-DUSE_ACCELERATE'], language : 'c')
  add_global_arguments(['-DUSE_ACCELERATE'], language : 'cpp') 
  deps = [fftw]
else
  omp = dependency('openmp', required : false)
  cblas = dependency('openblas')
  fftwt = c.find_library('fftw3_threads', dirs : get_option('libdir'))
  deps = [cblas, fftw, fftwt, omp]
  if omp.found()
    add_global_arguments(['-DOMP'], language : 'c')
  endif
endif

subdir('C')
subdir('cython')
subdir('bin')
subdir('python')
subdir('multiprec/python')
subdir('multiprec/C++')

pkg_mod = import('pkgconfig')
pkg_mod.generate(libraries : l2clib,
                 version : '1.0',
                 name : 'leg2cheb',
                 description : 'A Library to transform between Legendre and Chebyshev coefficients')
