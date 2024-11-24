from PIL import Image, ImageChops, ImageDraw, ImageFont

def compare_images_and_find_difference(path_one, path_two, out_image_path):
    # Open the two images
    image1 = Image.open(path_one)
    image2 = Image.open(path_two)

    # Ensure both images have the same size
    image2 = image2.resize(image1.size)

    # Ensure both images have the same mode
    image1 = image1.convert('RGB')
    image2 = image2.convert('RGB')

    # Find the difference between the images
    diff = ImageChops.difference(image1, image2)

    # Calculate the percentage of matching pixels
    diff_data = diff.getdata()
    total_pixels = len(diff_data)
    matching_pixels = sum(1 for pixel in diff_data if pixel == (0, 0, 0))
    matching_percentage = (matching_pixels / total_pixels) * 100

    print(f"Matching Percentage: {matching_percentage:.2f}%")

    # Highlight the differences by enhancing the contrast
    diff = ImageChops.add(diff, diff, 2.0, -100)

    # Create a white background image
    white_bg = Image.new('RGB', image1.size, (255, 255, 255))

    # Convert the difference image to grayscale to use as a mask
    mask = diff.convert('L')

    # Paste the difference image onto the white background using the mask
    white_bg.paste(diff, (0, 0), mask)

    # Create a new image with a width that is the sum of the widths of the three images
    total_width = image1.width + image2.width + white_bg.width
    max_height = max(image1.height, image2.height, white_bg.height)+20

    merged_image = Image.new('RGB', (total_width, max_height))

    # Paste the images side by side
    merged_image.paste(image1, (0, 20))
    merged_image.paste(white_bg, (image1.width, 20))
    merged_image.paste(image2, (image1.width + white_bg.width, 20))

    try:
        font = ImageFont.truetype("arial.ttf", 24)  # Use a truetype font if available
    except IOError:
        font = ImageFont.load_default()  # Fallback to default font if truetype font is not available

    # Draw the matching percentage on the white background image
    draw = ImageDraw.Draw(merged_image)
    font = ImageFont.load_default()
    text = f"Matching: {matching_percentage:.2f}%"
    draw.text((image1.width, 5), text, fill="white", font=font)

    # Save or display the result
    merged_image.show()
    merged_image.save(out_image_path)

    return matching_percentage
