local bufferline_exists, bufferline = pcall(require, 'bufferline')
if not bufferline_exists then
    vim.notify('plugin bufferline not installed', 'error')
    return
end

bufferline.setup {}
