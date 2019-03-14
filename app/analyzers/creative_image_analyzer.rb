class CreativeImageAnalyzer < ActiveStorage::Analyzer::ImageAnalyzer
  def metadata
    md = super.dup
    md[:name] = @blob.filename
    return md unless md[:height].present? && md[:width].present?

    md[:format] = "small" if md[:width].to_i == 200 && md[:height] == 200
    md[:format] = "large" if md[:width].to_i == 260 && md[:height] == 200
    md[:format] = "wide"  if md[:width].to_i == 512 && md[:height] == 320
    md
  end
end
