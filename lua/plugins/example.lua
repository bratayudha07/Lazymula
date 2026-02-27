-- File ini adalah contoh konfigurasi plugin.
-- Karena ini hanya contoh, kita tidak akan memuat apapun dari sini.
-- Semua konfigurasi plugin yang aktif sebaiknya dipisah ke file masing-masing
-- di folder plugins/ (seperti treesitter.lua, cmp.lua, dll)

-- Kembalikan tabel kosong karena ini hanya contoh
-- Hapus baris ini jika Anda ingin menggunakan file ini untuk konfigurasi aktual
-- if true then
--   return {}
-- end

-- Di bawah ini adalah contoh konfigurasi plugin.
-- Jika Anda ingin menggunakannya, pindahkan ke file terpisah atau
-- hapus baris "if true then return {} end" di atas.

return {
  -- Contoh konfigurasi trouble
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },

  -- Contoh override nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
