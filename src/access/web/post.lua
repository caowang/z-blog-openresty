local frm = require('access.filter_request_method')
frm.filter_non_get()
ngx.ctx.post_id = ngx.var[1]