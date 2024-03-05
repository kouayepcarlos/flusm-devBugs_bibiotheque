#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/elfnote-lto.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;
BUILD_LTO_INFO;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x281bc4e3, "module_layout" },
	{ 0x5e6c9aaf, "dma_free_attrs" },
	{ 0x3c046cef, "dma_alloc_attrs" },
	{ 0x12aaea65, "proc_remove" },
	{ 0x7780fcc2, "misc_deregister" },
	{ 0x78827384, "proc_create" },
	{ 0x6a99d3bf, "misc_register" },
	{ 0xb5b54b34, "_raw_spin_unlock" },
	{ 0xabc4cd40, "usmPagesCount" },
	{ 0xba8fbd64, "_raw_spin_lock" },
	{ 0x8d6c053, "usmPagesLock" },
	{ 0x65487097, "__x86_indirect_thunk_rax" },
	{ 0xaf954d74, "usm_poll_ufd" },
	{ 0xd0da656b, "__stack_chk_fail" },
	{ 0x97651e6c, "vmemmap_base" },
	{ 0xdccbe141, "handle_page" },
	{ 0xe18ef4aa, "remap_pfn_range" },
	{ 0x4c9d28b0, "phys_base" },
	{ 0x7cd8d75e, "page_offset_base" },
	{ 0x2659f576, "wake_up_process" },
	{ 0x6b10bee1, "_copy_to_user" },
	{ 0x48fa965, "handle_usm" },
	{ 0x92997ed8, "_printk" },
	{ 0xbdfb6dbb, "__fentry__" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "398996A53D8AAFFBF4D8EBD");
