-- ============================================================
-- Create the slideshow table (run in Supabase SQL Editor)
-- ============================================================

CREATE TABLE IF NOT EXISTS slideshow (
  id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title       TEXT,
  "desc"      TEXT,
  meta        TEXT,
  img_url     TEXT DEFAULT 'logo.png',
  created_at  TIMESTAMPTZ DEFAULT now()
);

-- Enable RLS
ALTER TABLE slideshow ENABLE ROW LEVEL SECURITY;

-- Public can read slideshow
CREATE POLICY "Public can read slideshow"
  ON slideshow FOR SELECT
  USING (true);

-- Admins can insert slideshow
CREATE POLICY "Admins can insert slideshow"
  ON slideshow FOR INSERT
  WITH CHECK (
    auth.role() = 'authenticated'
    AND auth.jwt() ->> 'email' IN (
      'murugesan13081978@gmail.com',
      'murugesankumaresan00@gmail.com',
      'kumaresan.ai.421@gmail.com'
    )
  );

-- Admins can update slideshow
CREATE POLICY "Admins can update slideshow"
  ON slideshow FOR UPDATE
  USING (
    auth.role() = 'authenticated'
    AND auth.jwt() ->> 'email' IN (
      'murugesan13081978@gmail.com',
      'murugesankumaresan00@gmail.com',
      'kumaresan.ai.421@gmail.com'
    )
  );

-- Admins can delete slideshow
CREATE POLICY "Admins can delete slideshow"
  ON slideshow FOR DELETE
  USING (
    auth.role() = 'authenticated'
    AND auth.jwt() ->> 'email' IN (
      'murugesan13081978@gmail.com',
      'murugesankumaresan00@gmail.com',
      'kumaresan.ai.421@gmail.com'
    )
  );
