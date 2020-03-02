local _M = {}

local function config()
    return {
        host = "127.0.0.1",
        port = "5432",
        database = "z-blog",
        user = "thunk"
    }
end

function _M.val_escape(val)
    if val ~= nil then
        return "'" .. val .. "'"
    else
        return "null"
    end
end

function _M.query(sql)
    local pg = pgmoon.new(config())

    local success, err = pg:connect()
    if not success then
        ngx.log(ngx.ERR, 'query_db connect pg error#', err)
        ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
    end

    -- num_queries, 几条sql语句执行
    local result, num_queries = pg:query(sql)

    pg:keepalive()

    return result
end

return _M