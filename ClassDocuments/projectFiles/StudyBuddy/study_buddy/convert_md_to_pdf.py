#!/usr/bin/env python3
"""
Script to convert Markdown files and text files to PDF
"""

import os
import sys
import markdown2
from reportlab.lib.pagesizes import letter, A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, PageBreak
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib.enums import TA_LEFT, TA_CENTER, TA_RIGHT
import re

def markdown_to_pdf(md_file, pdf_file):
    """Convert a Markdown file to PDF"""
    
    # Read the markdown file
    with open(md_file, 'r', encoding='utf-8') as f:
        md_content = f.read()
    
    # Convert markdown to HTML
    html_content = markdown2.markdown(md_content, extras=['tables', 'fenced-code-blocks', 'code-friendly'])
    
    # Create PDF document
    doc = SimpleDocTemplate(pdf_file, pagesize=A4, rightMargin=72, leftMargin=72, topMargin=72, bottomMargin=18)
    
    # Get styles
    styles = getSampleStyleSheet()
    
    # Create custom styles
    title_style = ParagraphStyle(
        'CustomTitle',
        parent=styles['Heading1'],
        fontSize=16,
        spaceAfter=30,
        alignment=TA_CENTER,
        textColor='#8B0000'  # Morehouse Maroon
    )
    
    heading1_style = ParagraphStyle(
        'CustomHeading1',
        parent=styles['Heading1'],
        fontSize=14,
        spaceAfter=12,
        spaceBefore=12,
        textColor='#8B0000'  # Morehouse Maroon
    )
    
    heading2_style = ParagraphStyle(
        'CustomHeading2',
        parent=styles['Heading2'],
        fontSize=12,
        spaceAfter=8,
        spaceBefore=8,
        textColor='#333333'
    )
    
    normal_style = ParagraphStyle(
        'CustomNormal',
        parent=styles['Normal'],
        fontSize=10,
        spaceAfter=6,
        alignment=TA_LEFT
    )
    
    # Parse HTML and create PDF content
    story = []
    
    # Add title
    title_match = re.search(r'<h1[^>]*>(.*?)</h1>', html_content, re.IGNORECASE)
    if title_match:
        title_text = re.sub(r'<[^>]+>', '', title_match.group(1))
        story.append(Paragraph(title_text, title_style))
        story.append(Spacer(1, 20))
    
    # Process the rest of the content
    lines = html_content.split('\n')
    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        # Handle headings
        if line.startswith('<h1'):
            text = re.sub(r'<[^>]+>', '', line)
            story.append(Paragraph(text, heading1_style))
        elif line.startswith('<h2'):
            text = re.sub(r'<[^>]+>', '', line)
            story.append(Paragraph(text, heading2_style))
        elif line.startswith('<h3'):
            text = re.sub(r'<[^>]+>', '', line)
            story.append(Paragraph(text, heading2_style))
        elif line.startswith('<p>'):
            text = re.sub(r'<[^>]+>', '', line)
            if text.strip():
                story.append(Paragraph(text, normal_style))
        elif line.startswith('<ul>') or line.startswith('<ol>'):
            # Handle lists
            text = re.sub(r'<[^>]+>', '', line)
            if text.strip():
                story.append(Paragraph(f"• {text}", normal_style))
        elif line.startswith('<li>'):
            text = re.sub(r'<[^>]+>', '', line)
            if text.strip():
                story.append(Paragraph(f"• {text}", normal_style))
        elif line.startswith('<code>') or line.startswith('<pre>'):
            # Handle code blocks
            text = re.sub(r'<[^>]+>', '', line)
            if text.strip():
                code_style = ParagraphStyle(
                    'Code',
                    parent=normal_style,
                    fontName='Courier',
                    fontSize=9,
                    leftIndent=20,
                    backColor='#f5f5f5'
                )
                story.append(Paragraph(text, code_style))
        elif line.startswith('<hr>'):
            story.append(Spacer(1, 12))
        else:
            # Handle plain text
            if line and not line.startswith('<'):
                story.append(Paragraph(line, normal_style))
    
    # Build PDF
    doc.build(story)
    print(f"✅ Converted {md_file} to {pdf_file}")

def text_to_pdf(txt_file, pdf_file):
    """Convert a text file to PDF with monospace font for diagrams"""
    
    # Read the text file
    with open(txt_file, 'r', encoding='utf-8') as f:
        txt_content = f.read()
    
    # Create PDF document
    doc = SimpleDocTemplate(pdf_file, pagesize=A4, rightMargin=36, leftMargin=36, topMargin=72, bottomMargin=18)
    
    # Get styles
    styles = getSampleStyleSheet()
    
    # Create custom styles for text files
    title_style = ParagraphStyle(
        'TextTitle',
        parent=styles['Heading1'],
        fontSize=16,
        spaceAfter=30,
        alignment=TA_CENTER,
        textColor='#8B0000',  # Morehouse Maroon
        fontName='Helvetica-Bold'
    )
    
    diagram_style = ParagraphStyle(
        'Diagram',
        parent=styles['Normal'],
        fontSize=8,
        spaceAfter=2,
        alignment=TA_LEFT,
        fontName='Courier',
        leading=10
    )
    
    section_style = ParagraphStyle(
        'Section',
        parent=styles['Heading2'],
        fontSize=12,
        spaceAfter=8,
        spaceBefore=12,
        textColor='#8B0000',  # Morehouse Maroon
        fontName='Helvetica-Bold'
    )
    
    normal_style = ParagraphStyle(
        'TextNormal',
        parent=styles['Normal'],
        fontSize=10,
        spaceAfter=6,
        alignment=TA_LEFT,
        fontName='Helvetica'
    )
    
    # Parse text and create PDF content
    story = []
    
    lines = txt_content.split('\n')
    in_diagram = False
    
    for line in lines:
        line = line.rstrip()  # Remove trailing whitespace but keep leading
        
        # Check if this is a title line
        if line.startswith('STUDYBUDDY') and 'DEVOPS' in line.upper():
            story.append(Paragraph("StudyBuddy DevOps Workflow", title_style))
            story.append(Spacer(1, 20))
            continue
            
        # Check if this is a section header
        if line.isupper() and len(line) > 10 and not line.startswith('┌') and not line.startswith('│') and not line.startswith('└'):
            story.append(Paragraph(line, section_style))
            continue
            
        # Check if we're in a diagram section (contains box drawing characters)
        if any(char in line for char in ['┌', '┐', '└', '┘', '─', '│', '├', '┤', '┬', '┴', '►', '◄', '▼', '▲']):
            in_diagram = True
            story.append(Paragraph(line, diagram_style))
        elif in_diagram and line.strip() == '':
            # Empty line in diagram
            story.append(Paragraph(line, diagram_style))
        elif in_diagram and not any(char in line for char in ['┌', '┐', '└', '┘', '─', '│', '├', '┤', '┬', '┴', '►', '◄', '▼', '▲']):
            # End of diagram section
            in_diagram = False
            if line.strip():
                story.append(Paragraph(line, normal_style))
        else:
            # Regular text
            if line.strip():
                story.append(Paragraph(line, normal_style))
            else:
                story.append(Spacer(1, 6))
    
    # Build PDF
    doc.build(story)
    print(f"✅ Converted {txt_file} to {pdf_file}")

def main():
    """Main function to convert all markdown and text files"""
    
    # List of files to convert
    files_to_convert = [
        ('test/test_plan.md', 'markdown'),
        ('docs/devops_workflow.md', 'markdown'),
        ('README.md', 'markdown'),
        ('docs/devops_diagram.txt', 'text')
    ]
    
    for file_path, file_type in files_to_convert:
        if os.path.exists(file_path):
            pdf_file = file_path.replace('.md', '.pdf').replace('.txt', '.pdf')
            try:
                if file_type == 'markdown':
                    markdown_to_pdf(file_path, pdf_file)
                elif file_type == 'text':
                    text_to_pdf(file_path, pdf_file)
            except Exception as e:
                print(f"❌ Error converting {file_path}: {e}")
        else:
            print(f"⚠️  File not found: {file_path}")
    
    print("\n🎉 Conversion complete!")

if __name__ == "__main__":
    main() 