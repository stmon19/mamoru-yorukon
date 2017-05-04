# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Posts" do
    describe "Admin" do
      describe "posts", type: :feature do
        refinery_login

        describe "posts list" do
          before do
            FactoryGirl.create(:post, :title => "UniqueTitleOne")
            FactoryGirl.create(:post, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.posts_admin_posts_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.posts_admin_posts_path

            click_link "Add New Post"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Posts::Post, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Posts::Post, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:post, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.posts_admin_posts_path

              click_link "Add New Post"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Posts::Post, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:post, :title => "A title") }

          it "should succeed" do
            visit refinery.posts_admin_posts_path

            within ".actions" do
              click_link "Edit this post"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:post, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.posts_admin_posts_path

            click_link "Remove this post forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Posts::Post.count).to eq(0)
          end
        end

      end
    end
  end
end
