_G.var         = vim.api.nvim_set_var

_G.font_icon = {
  error   = ' ';
  warn    = ' ';
  hint    = ' ';
  info    = ' ';
  modifiy = ' ';
  add     = ' ';
  merge   = ' ';
  renamed = ' ';
  unknown = ' ';
  deleted = ' ';
  ignored = ' ';
  close   = ' ';
  edit    = '';
  line    = '│';
  line1   = '⏽';
  branch  = ' ';
  gear    = ' ';
  light   = '';
  check   = '﫠';
  ok      = ' ';
}

function _G.var_tbl(variable_table)
  for variable_name, value in pairs(variable_table)
  do
    var(variable_name, value)
  end
end
