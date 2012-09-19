class ClassMethodChecker < CodeAnalyzer::Checker
  interesting_files /.*\.rb/
  interesting_nodes :defs

  add_callback :start_defs do |node|
    if :var_ref == node[1].sexp_type && :@const == node[1][1].sexp_type
      add_warning "use self to define class method"
    end
  end
end
