`ifndef _VUTILS_MACROS_SVH
`define _VUTILS_MACROS_SVH

  `include "uvm_macros.svh"


  // log message for tracing purposes
  `define trace_info( MSG=$sformatf("TRACE %m"), ID=get_type_name() ) `uvm_info(ID, MSG, UVM_HIGH)


  // uvm report wrapper macros with ID default to get_type_name() and explicit verbosity levels.
  `define info_none(MSG, ID=get_type_name())   `uvm_info(ID, MSG, UVM_NONE)   // info with none verbosity
  `define info(MSG, ID=get_type_name())        `uvm_info(ID, MSG, UVM_LOW)    // info with low verbosity (default)
  `define info_low(MSG, ID=get_type_name())    `uvm_info(ID, MSG, UVM_LOW)    // info with low verbosity (same as `info)
  `define info_med(MSG, ID=get_type_name())    `uvm_info(ID, MSG, UVM_MEDIUM) // info with high  verbosity
  `define info_high(MSG, ID=get_type_name())   `uvm_info(ID, MSG, UVM_HIGH)   // info with high  verbosity
  `define info_debug(MSG, ID=get_type_name())  `uvm_info(ID, MSG, UVM_DEBUG)  // info with debug verbosity
  `define info_full(MSG, ID=get_type_name())   `uvm_info(ID, MSG, UVM_FULL)   // info with full  verbosity
  `define warn(MSG, ID=get_type_name())        `uvm_warning(ID, MSG)  // warning
  `define error(MSG, ID=get_type_name())       `uvm_error(ID, MSG)    // error
  `define fatal(MSG, ID=get_type_name())       `uvm_fatal(ID, MSG)    // fatal


  // path/signal to string convertion macro using backtick and quote
  `define arg2str(ARG)  `"ARG`"


  // check if a signal contains X/Z
  // multi-line macros do not work on edaplayground
  `define check_ifx(SIG, ID=get_type_name()) if($isunknown(SIG)) `error($sformatf("%s contains X!", `arg2str(SIG)), ID)


  `define flip_coin  $urandom_range(0, 1)
  `define roll_dice  $urandom_range(0, 5)


  // check randomize call and report error when it fails
  `define check_rand(RCALL, ID=get_type_name())  if(!RCALL) `error($sformatf("%s failed at %s:%0d!", `arg2str(RCALL), `__FILE__, `__LINE__), ID)


  // initialize seq_item's attribute value from rhs and disable rand mode
  `define set_trans_attr(ATTR)  this.ATTR = rhs.ATTR; this.ATTR.rand_mode(0);


  // uvm_component new function
  `define ucomp_new( NAME=get_type_name() ) \
function new(string name = NAME, uvm_component parent); \
      super.new(name, parent); \
    endfunction // new

  // uvm_object new function
  `define uobj_new( NAME=get_type_name() ) \
    function new(string name = NAME); \
      super.new(name); \
    endfunction // new


`endif // _VUTILS_MACROS_SVH
