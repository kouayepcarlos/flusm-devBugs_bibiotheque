# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

test/CMakeFiles/syscall_format.dir/syscall_format.c.o: ../test/syscall_format.c \
  /usr/include/x86_64-linux-gnu/asm/prctl.h \
  /usr/include/assert.h \
  /usr/include/features.h \
  /usr/include/features-time64.h \
  /usr/include/x86_64-linux-gnu/bits/wordsize.h \
  /usr/include/x86_64-linux-gnu/bits/timesize.h \
  /usr/include/stdc-predef.h \
  /usr/include/x86_64-linux-gnu/sys/cdefs.h \
  /usr/include/x86_64-linux-gnu/bits/long-double.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
  /usr/include/errno.h \
  /usr/include/x86_64-linux-gnu/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/x86_64-linux-gnu/asm/errno.h \
  /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h \
  /usr/include/x86_64-linux-gnu/bits/types/error_t.h \
  /usr/include/fcntl.h \
  /usr/include/x86_64-linux-gnu/bits/types.h \
  /usr/include/x86_64-linux-gnu/bits/typesizes.h \
  /usr/include/x86_64-linux-gnu/bits/time64.h \
  /usr/include/x86_64-linux-gnu/bits/fcntl.h \
  /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h \
  /usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h \
  /usr/include/linux/falloc.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h \
  /usr/include/x86_64-linux-gnu/bits/endian.h \
  /usr/include/x86_64-linux-gnu/bits/endianness.h \
  /usr/include/x86_64-linux-gnu/bits/types/time_t.h \
  /usr/include/x86_64-linux-gnu/bits/stat.h \
  /usr/include/x86_64-linux-gnu/bits/struct_stat.h \
  /usr/include/grp.h \
  /usr/include/x86_64-linux-gnu/bits/types/FILE.h \
  /usr/include/linux/futex.h \
  /usr/include/linux/types.h \
  /usr/include/x86_64-linux-gnu/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /usr/include/x86_64-linux-gnu/asm/bitsperlong.h \
  /usr/include/asm-generic/bitsperlong.h \
  /usr/include/linux/posix_types.h \
  /usr/include/linux/stddef.h \
  /usr/include/x86_64-linux-gnu/asm/posix_types.h \
  /usr/include/x86_64-linux-gnu/asm/posix_types_64.h \
  /usr/include/asm-generic/posix_types.h \
  /usr/include/linux/kexec.h \
  /usr/include/linux/mempolicy.h \
  /usr/include/mqueue.h \
  /usr/include/x86_64-linux-gnu/sys/types.h \
  /usr/include/x86_64-linux-gnu/bits/types/clock_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/clockid_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/timer_t.h \
  /usr/include/x86_64-linux-gnu/bits/stdint-intn.h \
  /usr/include/endian.h \
  /usr/include/x86_64-linux-gnu/bits/byteswap.h \
  /usr/include/x86_64-linux-gnu/bits/uintn-identity.h \
  /usr/include/x86_64-linux-gnu/sys/select.h \
  /usr/include/x86_64-linux-gnu/bits/select.h \
  /usr/include/x86_64-linux-gnu/bits/types/sigset_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h \
  /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h \
  /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h \
  /usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h \
  /usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h \
  /usr/include/x86_64-linux-gnu/bits/struct_mutex.h \
  /usr/include/x86_64-linux-gnu/bits/struct_rwlock.h \
  /usr/include/x86_64-linux-gnu/bits/types/sigevent_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h \
  /usr/include/x86_64-linux-gnu/bits/mqueue.h \
  /usr/include/poll.h \
  /usr/include/x86_64-linux-gnu/sys/poll.h \
  /usr/include/x86_64-linux-gnu/bits/poll.h \
  /usr/include/sched.h \
  /usr/include/x86_64-linux-gnu/bits/sched.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_sched_param.h \
  /usr/include/x86_64-linux-gnu/bits/cpu-set.h \
  /usr/include/signal.h \
  /usr/include/x86_64-linux-gnu/bits/signum-generic.h \
  /usr/include/x86_64-linux-gnu/bits/signum-arch.h \
  /usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h \
  /usr/include/x86_64-linux-gnu/bits/siginfo-arch.h \
  /usr/include/x86_64-linux-gnu/bits/siginfo-consts.h \
  /usr/include/x86_64-linux-gnu/bits/siginfo-consts-arch.h \
  /usr/include/x86_64-linux-gnu/bits/types/sigval_t.h \
  /usr/include/x86_64-linux-gnu/bits/sigevent-consts.h \
  /usr/include/x86_64-linux-gnu/bits/sigaction.h \
  /usr/include/x86_64-linux-gnu/bits/sigcontext.h \
  /usr/include/x86_64-linux-gnu/bits/types/stack_t.h \
  /usr/include/x86_64-linux-gnu/sys/ucontext.h \
  /usr/include/x86_64-linux-gnu/bits/sigstack.h \
  /usr/include/x86_64-linux-gnu/bits/sigstksz.h \
  /usr/include/unistd.h \
  /usr/include/x86_64-linux-gnu/bits/posix_opt.h \
  /usr/include/x86_64-linux-gnu/bits/environments.h \
  /usr/include/x86_64-linux-gnu/bits/confname.h \
  /usr/include/x86_64-linux-gnu/bits/getopt_posix.h \
  /usr/include/x86_64-linux-gnu/bits/getopt_core.h \
  /usr/include/x86_64-linux-gnu/bits/unistd_ext.h \
  /usr/include/linux/close_range.h \
  /usr/include/x86_64-linux-gnu/bits/ss_flags.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_sigstack.h \
  /usr/include/x86_64-linux-gnu/bits/sigthread.h \
  /usr/include/x86_64-linux-gnu/bits/signal_ext.h \
  /usr/lib/llvm-14/lib/clang/14.0.0/include/stdbool.h \
  /usr/lib/llvm-14/lib/clang/14.0.0/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/x86_64-linux-gnu/bits/libc-header-start.h \
  /usr/include/x86_64-linux-gnu/bits/wchar.h \
  /usr/include/x86_64-linux-gnu/bits/stdint-uintn.h \
  /usr/include/stdio.h \
  /usr/lib/llvm-14/lib/clang/14.0.0/include/stdarg.h \
  /usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/__FILE.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h \
  /usr/include/x86_64-linux-gnu/bits/types/cookie_io_functions_t.h \
  /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
  /usr/include/x86_64-linux-gnu/bits/floatn.h \
  /usr/include/x86_64-linux-gnu/bits/floatn-common.h \
  /usr/include/x86_64-linux-gnu/bits/stdio.h \
  /usr/include/stdlib.h \
  /usr/include/x86_64-linux-gnu/bits/waitflags.h \
  /usr/include/x86_64-linux-gnu/bits/waitstatus.h \
  /usr/include/x86_64-linux-gnu/bits/types/locale_t.h \
  /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h \
  /usr/include/alloca.h \
  /usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h \
  /usr/include/x86_64-linux-gnu/bits/stdlib-float.h \
  /usr/include/string.h \
  /usr/include/strings.h \
  /usr/include/syslog.h \
  /usr/include/x86_64-linux-gnu/sys/syslog.h \
  /usr/include/x86_64-linux-gnu/bits/syslog-path.h \
  /usr/include/x86_64-linux-gnu/sys/epoll.h \
  /usr/include/x86_64-linux-gnu/bits/epoll.h \
  /usr/include/x86_64-linux-gnu/sys/eventfd.h \
  /usr/include/x86_64-linux-gnu/bits/eventfd.h \
  /usr/include/x86_64-linux-gnu/sys/fanotify.h \
  /usr/include/linux/fanotify.h \
  /usr/include/x86_64-linux-gnu/sys/file.h \
  /usr/include/x86_64-linux-gnu/sys/fsuid.h \
  /usr/include/x86_64-linux-gnu/sys/inotify.h \
  /usr/include/x86_64-linux-gnu/bits/inotify.h \
  /usr/include/x86_64-linux-gnu/sys/io.h \
  /usr/include/x86_64-linux-gnu/sys/ioctl.h \
  /usr/include/x86_64-linux-gnu/bits/ioctls.h \
  /usr/include/x86_64-linux-gnu/asm/ioctls.h \
  /usr/include/asm-generic/ioctls.h \
  /usr/include/linux/ioctl.h \
  /usr/include/x86_64-linux-gnu/asm/ioctl.h \
  /usr/include/asm-generic/ioctl.h \
  /usr/include/x86_64-linux-gnu/bits/ioctl-types.h \
  /usr/include/x86_64-linux-gnu/sys/ttydefaults.h \
  /usr/include/x86_64-linux-gnu/sys/ipc.h \
  /usr/include/x86_64-linux-gnu/bits/ipctypes.h \
  /usr/include/x86_64-linux-gnu/bits/ipc.h \
  /usr/include/x86_64-linux-gnu/bits/ipc-perm.h \
  /usr/include/x86_64-linux-gnu/sys/mman.h \
  /usr/include/x86_64-linux-gnu/bits/mman.h \
  /usr/include/x86_64-linux-gnu/bits/mman-map-flags-generic.h \
  /usr/include/x86_64-linux-gnu/bits/mman-linux.h \
  /usr/include/x86_64-linux-gnu/bits/mman-shared.h \
  /usr/include/x86_64-linux-gnu/sys/mount.h \
  /usr/include/x86_64-linux-gnu/sys/msg.h \
  /usr/include/x86_64-linux-gnu/bits/msq.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_msqid_ds.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_msqid64_ds.h \
  /usr/include/x86_64-linux-gnu/sys/prctl.h \
  /usr/include/linux/prctl.h \
  /usr/include/x86_64-linux-gnu/sys/resource.h \
  /usr/include/x86_64-linux-gnu/bits/resource.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_rusage.h \
  /usr/include/x86_64-linux-gnu/sys/sem.h \
  /usr/include/x86_64-linux-gnu/bits/sem.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_semid_ds.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_semid64_ds.h \
  /usr/include/x86_64-linux-gnu/sys/sendfile.h \
  /usr/include/x86_64-linux-gnu/sys/shm.h \
  /usr/include/x86_64-linux-gnu/bits/shm.h \
  /usr/include/x86_64-linux-gnu/bits/shmlba.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_shmid_ds.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_shmid64_ds.h \
  /usr/include/x86_64-linux-gnu/sys/signalfd.h \
  /usr/include/x86_64-linux-gnu/bits/signalfd.h \
  /usr/include/x86_64-linux-gnu/sys/socket.h \
  /usr/include/x86_64-linux-gnu/bits/socket.h \
  /usr/include/x86_64-linux-gnu/bits/socket_type.h \
  /usr/include/x86_64-linux-gnu/bits/sockaddr.h \
  /usr/include/x86_64-linux-gnu/asm/socket.h \
  /usr/include/asm-generic/socket.h \
  /usr/include/x86_64-linux-gnu/asm/sockios.h \
  /usr/include/asm-generic/sockios.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_osockaddr.h \
  /usr/include/x86_64-linux-gnu/sys/stat.h \
  /usr/include/x86_64-linux-gnu/bits/statx.h \
  /usr/include/linux/stat.h \
  /usr/include/x86_64-linux-gnu/bits/statx-generic.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_statx_timestamp.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_statx.h \
  /usr/include/x86_64-linux-gnu/sys/swap.h \
  /usr/include/x86_64-linux-gnu/sys/syscall.h \
  /usr/include/x86_64-linux-gnu/asm/unistd.h \
  /usr/include/x86_64-linux-gnu/asm/unistd_64.h \
  /usr/include/x86_64-linux-gnu/bits/syscall.h \
  /usr/include/x86_64-linux-gnu/sys/sysinfo.h \
  /usr/include/linux/kernel.h \
  /usr/include/linux/sysinfo.h \
  /usr/include/linux/const.h \
  /usr/include/x86_64-linux-gnu/sys/time.h \
  /usr/include/x86_64-linux-gnu/sys/times.h \
  /usr/include/x86_64-linux-gnu/sys/timerfd.h \
  /usr/include/time.h \
  /usr/include/x86_64-linux-gnu/bits/time.h \
  /usr/include/x86_64-linux-gnu/bits/timex.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_tm.h \
  /usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h \
  /usr/include/x86_64-linux-gnu/bits/timerfd.h \
  /usr/include/x86_64-linux-gnu/sys/timex.h \
  /usr/include/x86_64-linux-gnu/sys/uio.h \
  /usr/include/x86_64-linux-gnu/bits/uio_lim.h \
  /usr/include/x86_64-linux-gnu/bits/uio-ext.h \
  /usr/include/x86_64-linux-gnu/sys/utsname.h \
  /usr/include/x86_64-linux-gnu/bits/utsname.h \
  /usr/include/x86_64-linux-gnu/sys/vfs.h \
  /usr/include/x86_64-linux-gnu/sys/statfs.h \
  /usr/include/x86_64-linux-gnu/bits/statfs.h \
  /usr/include/x86_64-linux-gnu/sys/wait.h \
  /usr/include/x86_64-linux-gnu/sys/quota.h \
  /usr/include/linux/quota.h \
  /usr/include/x86_64-linux-gnu/sys/xattr.h \
  /usr/include/utime.h \
  ../include/libsyscall_intercept_hook_point.h \
  ../src/magic_syscalls.h \
  /usr/include/syscall.h


/usr/include/utime.h:

/usr/include/x86_64-linux-gnu/sys/quota.h:

/usr/include/x86_64-linux-gnu/bits/statfs.h:

/usr/include/x86_64-linux-gnu/sys/vfs.h:

/usr/include/x86_64-linux-gnu/bits/uio-ext.h:

/usr/include/x86_64-linux-gnu/bits/uio_lim.h:

/usr/include/x86_64-linux-gnu/sys/timex.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h:

/usr/include/x86_64-linux-gnu/bits/time.h:

/usr/include/time.h:

/usr/include/x86_64-linux-gnu/sys/time.h:

/usr/include/linux/const.h:

/usr/include/x86_64-linux-gnu/sys/sysinfo.h:

/usr/include/x86_64-linux-gnu/bits/syscall.h:

/usr/include/x86_64-linux-gnu/bits/statx-generic.h:

/usr/include/x86_64-linux-gnu/bits/utsname.h:

/usr/include/linux/stat.h:

/usr/include/x86_64-linux-gnu/sys/timerfd.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_osockaddr.h:

/usr/include/asm-generic/sockios.h:

/usr/include/x86_64-linux-gnu/asm/sockios.h:

/usr/include/x86_64-linux-gnu/bits/sockaddr.h:

/usr/include/x86_64-linux-gnu/sys/socket.h:

/usr/include/linux/sysinfo.h:

/usr/include/x86_64-linux-gnu/bits/statx.h:

/usr/include/x86_64-linux-gnu/bits/signalfd.h:

/usr/include/x86_64-linux-gnu/sys/signalfd.h:

../include/libsyscall_intercept_hook_point.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_shmid_ds.h:

/usr/include/x86_64-linux-gnu/asm/unistd.h:

/usr/include/x86_64-linux-gnu/bits/shm.h:

/usr/include/x86_64-linux-gnu/sys/sendfile.h:

/usr/include/linux/quota.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_semid64_ds.h:

/usr/include/x86_64-linux-gnu/sys/sem.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_rusage.h:

/usr/include/x86_64-linux-gnu/sys/resource.h:

/usr/include/linux/prctl.h:

/usr/include/x86_64-linux-gnu/sys/statfs.h:

/usr/include/x86_64-linux-gnu/sys/prctl.h:

/usr/include/x86_64-linux-gnu/sys/mman.h:

/usr/include/x86_64-linux-gnu/bits/ipc-perm.h:

/usr/include/x86_64-linux-gnu/bits/ipc.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_msqid_ds.h:

/usr/include/x86_64-linux-gnu/sys/ipc.h:

/usr/include/x86_64-linux-gnu/sys/ttydefaults.h:

/usr/include/x86_64-linux-gnu/bits/ioctl-types.h:

/usr/include/asm-generic/ioctl.h:

/usr/include/x86_64-linux-gnu/asm/ioctl.h:

/usr/include/x86_64-linux-gnu/bits/socket_type.h:

/usr/include/asm-generic/ioctls.h:

/usr/include/x86_64-linux-gnu/bits/ioctls.h:

/usr/include/x86_64-linux-gnu/sys/ioctl.h:

/usr/include/x86_64-linux-gnu/sys/io.h:

/usr/include/x86_64-linux-gnu/bits/inotify.h:

/usr/include/x86_64-linux-gnu/sys/file.h:

/usr/include/linux/fanotify.h:

/usr/include/x86_64-linux-gnu/sys/fanotify.h:

/usr/include/x86_64-linux-gnu/sys/eventfd.h:

/usr/include/x86_64-linux-gnu/bits/syslog-path.h:

/usr/include/x86_64-linux-gnu/sys/syslog.h:

/usr/include/x86_64-linux-gnu/sys/times.h:

/usr/include/alloca.h:

/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:

/usr/include/x86_64-linux-gnu/bits/types/locale_t.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_statx.h:

/usr/include/x86_64-linux-gnu/bits/waitstatus.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_shmid64_ds.h:

/usr/include/x86_64-linux-gnu/bits/waitflags.h:

/usr/include/x86_64-linux-gnu/bits/long-double.h:

/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h:

/usr/include/endian.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_msqid64_ds.h:

/usr/include/x86_64-linux-gnu/bits/getopt_posix.h:

/usr/include/stdio.h:

/usr/include/x86_64-linux-gnu/sys/uio.h:

/usr/include/linux/mempolicy.h:

/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h:

/usr/include/x86_64-linux-gnu/bits/cpu-set.h:

/usr/include/x86_64-linux-gnu/asm/posix_types.h:

/usr/include/linux/stddef.h:

/usr/include/linux/falloc.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_statx_timestamp.h:

/usr/include/linux/posix_types.h:

/usr/include/asm-generic/bitsperlong.h:

/usr/include/linux/kexec.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_semid_ds.h:

/usr/include/asm-generic/int-ll64.h:

/usr/include/x86_64-linux-gnu/sys/stat.h:

/usr/include/x86_64-linux-gnu/gnu/stubs-64.h:

/usr/include/linux/ioctl.h:

/usr/include/linux/types.h:

/usr/include/x86_64-linux-gnu/sys/utsname.h:

/usr/include/x86_64-linux-gnu/bits/resource.h:

/usr/include/x86_64-linux-gnu/bits/msq.h:

/usr/include/string.h:

/usr/include/x86_64-linux-gnu/bits/stdio.h:

/usr/include/stdint.h:

/usr/include/linux/futex.h:

/usr/include/x86_64-linux-gnu/asm/unistd_64.h:

/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h:

/usr/include/x86_64-linux-gnu/sys/types.h:

/usr/include/x86_64-linux-gnu/asm/prctl.h:

/usr/include/x86_64-linux-gnu/bits/types/time_t.h:

/usr/include/x86_64-linux-gnu/bits/mman.h:

../test/syscall_format.c:

/usr/include/x86_64-linux-gnu/asm/bitsperlong.h:

/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h:

/usr/include/x86_64-linux-gnu/bits/typesizes.h:

/usr/include/x86_64-linux-gnu/asm/ioctls.h:

/usr/include/x86_64-linux-gnu/sys/epoll.h:

/usr/include/features.h:

/usr/include/x86_64-linux-gnu/bits/timex.h:

/usr/include/x86_64-linux-gnu/bits/fcntl-linux.h:

/usr/include/x86_64-linux-gnu/bits/timesize.h:

/usr/include/syslog.h:

/usr/include/x86_64-linux-gnu/bits/getopt_core.h:

/usr/include/x86_64-linux-gnu/bits/wordsize.h:

/usr/include/x86_64-linux-gnu/bits/byteswap.h:

/usr/include/x86_64-linux-gnu/bits/siginfo-consts-arch.h:

/usr/include/assert.h:

/usr/include/x86_64-linux-gnu/bits/endianness.h:

/usr/lib/llvm-14/lib/clang/14.0.0/include/stddef.h:

/usr/include/x86_64-linux-gnu/sys/fsuid.h:

/usr/include/x86_64-linux-gnu/bits/types/sig_atomic_t.h:

/usr/include/x86_64-linux-gnu/asm/posix_types_64.h:

/usr/include/asm-generic/errno-base.h:

/usr/include/asm-generic/types.h:

/usr/include/x86_64-linux-gnu/sys/shm.h:

/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h:

/usr/include/x86_64-linux-gnu/asm/types.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_iovec.h:

/usr/include/x86_64-linux-gnu/bits/types/sigval_t.h:

/usr/include/x86_64-linux-gnu/bits/time64.h:

/usr/include/x86_64-linux-gnu/bits/mman-map-flags-generic.h:

/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h:

/usr/include/linux/kernel.h:

/usr/include/x86_64-linux-gnu/sys/swap.h:

/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h:

/usr/include/asm-generic/posix_types.h:

/usr/include/stdc-predef.h:

/usr/include/x86_64-linux-gnu/gnu/stubs.h:

/usr/include/x86_64-linux-gnu/bits/endian.h:

/usr/include/x86_64-linux-gnu/bits/stdlib-float.h:

/usr/lib/llvm-14/lib/clang/14.0.0/include/stdint.h:

/usr/include/x86_64-linux-gnu/bits/uintn-identity.h:

/usr/include/x86_64-linux-gnu/bits/ss_flags.h:

/usr/include/syscall.h:

/usr/include/asm-generic/errno.h:

/usr/include/fcntl.h:

/usr/include/x86_64-linux-gnu/bits/types/clock_t.h:

../src/magic_syscalls.h:

/usr/include/x86_64-linux-gnu/bits/types/__FILE.h:

/usr/include/x86_64-linux-gnu/sys/cdefs.h:

/usr/include/x86_64-linux-gnu/asm/errno.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h:

/usr/include/x86_64-linux-gnu/sys/mount.h:

/usr/include/x86_64-linux-gnu/bits/errno.h:

/usr/include/x86_64-linux-gnu/bits/mman-linux.h:

/usr/include/x86_64-linux-gnu/bits/types.h:

/usr/include/x86_64-linux-gnu/bits/stdint-intn.h:

/usr/include/linux/errno.h:

/usr/include/x86_64-linux-gnu/bits/fcntl.h:

/usr/include/x86_64-linux-gnu/bits/types/sigevent_t.h:

/usr/include/x86_64-linux-gnu/bits/types/error_t.h:

/usr/include/x86_64-linux-gnu/sys/xattr.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h:

/usr/include/x86_64-linux-gnu/sys/wait.h:

/usr/include/asm-generic/socket.h:

/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h:

/usr/include/x86_64-linux-gnu/bits/types/FILE.h:

/usr/include/x86_64-linux-gnu/bits/stdio_lim.h:

/usr/include/signal.h:

/usr/include/x86_64-linux-gnu/bits/environments.h:

/usr/include/x86_64-linux-gnu/sys/syscall.h:

/usr/include/x86_64-linux-gnu/bits/shmlba.h:

/usr/include/x86_64-linux-gnu/bits/struct_stat.h:

/usr/include/x86_64-linux-gnu/bits/select.h:

/usr/include/x86_64-linux-gnu/sys/inotify.h:

/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h:

/usr/lib/llvm-14/lib/clang/14.0.0/include/stdbool.h:

/usr/include/x86_64-linux-gnu/bits/struct_mutex.h:

/usr/include/strings.h:

/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h:

/usr/include/errno.h:

/usr/include/x86_64-linux-gnu/bits/types/__sigval_t.h:

/usr/include/x86_64-linux-gnu/bits/mqueue.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_sigstack.h:

/usr/include/features-time64.h:

/usr/include/poll.h:

/usr/include/x86_64-linux-gnu/bits/sigthread.h:

/usr/include/sched.h:

/usr/include/x86_64-linux-gnu/bits/sched.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_sched_param.h:

/usr/include/x86_64-linux-gnu/bits/ipctypes.h:

/usr/include/x86_64-linux-gnu/bits/types/timer_t.h:

/usr/include/x86_64-linux-gnu/bits/signum-generic.h:

/usr/include/x86_64-linux-gnu/bits/mman-shared.h:

/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:

/usr/include/x86_64-linux-gnu/sys/poll.h:

/usr/include/x86_64-linux-gnu/bits/sigcontext.h:

/usr/include/x86_64-linux-gnu/bits/signum-arch.h:

/usr/include/x86_64-linux-gnu/bits/types/siginfo_t.h:

/usr/include/x86_64-linux-gnu/bits/confname.h:

/usr/include/x86_64-linux-gnu/bits/siginfo-arch.h:

/usr/include/grp.h:

/usr/include/x86_64-linux-gnu/bits/stat.h:

/usr/include/x86_64-linux-gnu/bits/siginfo-consts.h:

/usr/include/x86_64-linux-gnu/bits/sigaction.h:

/usr/include/x86_64-linux-gnu/bits/types/stack_t.h:

/usr/include/x86_64-linux-gnu/bits/sigevent-consts.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:

/usr/include/mqueue.h:

/usr/include/x86_64-linux-gnu/sys/ucontext.h:

/usr/include/x86_64-linux-gnu/bits/socket.h:

/usr/include/x86_64-linux-gnu/bits/sigstack.h:

/usr/include/x86_64-linux-gnu/bits/sigstksz.h:

/usr/include/x86_64-linux-gnu/bits/posix_opt.h:

/usr/include/x86_64-linux-gnu/bits/unistd_ext.h:

/usr/include/linux/close_range.h:

/usr/include/x86_64-linux-gnu/bits/signal_ext.h:

/usr/include/x86_64-linux-gnu/bits/libc-header-start.h:

/usr/include/x86_64-linux-gnu/bits/types/cookie_io_functions_t.h:

/usr/include/x86_64-linux-gnu/bits/wchar.h:

/usr/include/x86_64-linux-gnu/bits/sem.h:

/usr/include/x86_64-linux-gnu/sys/select.h:

/usr/include/unistd.h:

/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h:

/usr/include/x86_64-linux-gnu/sys/msg.h:

/usr/include/x86_64-linux-gnu/bits/poll.h:

/usr/lib/llvm-14/lib/clang/14.0.0/include/stdarg.h:

/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h:

/usr/include/x86_64-linux-gnu/bits/timerfd.h:

/usr/include/x86_64-linux-gnu/bits/types/struct_itimerspec.h:

/usr/include/x86_64-linux-gnu/bits/floatn.h:

/usr/include/x86_64-linux-gnu/bits/epoll.h:

/usr/include/x86_64-linux-gnu/bits/floatn-common.h:

/usr/include/x86_64-linux-gnu/asm/socket.h:

/usr/include/x86_64-linux-gnu/bits/eventfd.h:

/usr/include/stdlib.h:
