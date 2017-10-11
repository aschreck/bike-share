  describe "When a user visits the URI '/'" do
    it "they see the contents of the homepage/dashboard" do
      visit '/'

      expect(page).to have_content(/bikeshare/i)
      expect(page).to have_link("All")
      expect(page).to have_link("New")
      expect(page).to have_link("Dashboard")
    end
  end
