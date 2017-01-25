diff --git a/third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc.tpl b/third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc.tpl
index d3bb93c..6e8d214 100755
--- a/third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc.tpl
+++ b/third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc.tpl
@@ -50,8 +50,9 @@ CPU_COMPILER = ('%{cpu_compiler}')
 GCC_HOST_COMPILER_PATH = ('%{gcc_host_compiler_path}')
 
 CURRENT_DIR = os.path.dirname(sys.argv[0])
-NVCC_PATH = CURRENT_DIR + '/../../../cuda/bin/nvcc'
-LLVM_HOST_COMPILER_PATH = ('/usr/bin/gcc')
+#NVCC_PATH = CURRENT_DIR + '/../../../cuda/bin/nvcc'
+NVCC_PATH = '/usr/apps.sp3/cuda/7.5/bin/nvcc'
+LLVM_HOST_COMPILER_PATH = ('/usr/apps.sp3/nosupport/gsic/gcc/4.9.3/bin/gcc')
 PREFIX_DIR = os.path.dirname(GCC_HOST_COMPILER_PATH)
 
 def Log(s):
@@ -219,7 +220,7 @@ def InvokeNvcc(argv, log=False):
 
   # TODO(zhengxq): for some reason, 'gcc' needs this help to find 'as'.
   # Need to investigate and fix.
-  cmd = 'PATH=' + PREFIX_DIR + ' ' + cmd
+  # cmd = 'PATH=' + PREFIX_DIR + ' ' + cmd
   if log: Log(cmd)
   return os.system(cmd)
 
